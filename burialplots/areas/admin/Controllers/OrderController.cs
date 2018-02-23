using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BurialPlots.DAL;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using OfficeOpenXml;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        // GET: Admin/Order
        public ActionResult Index(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                ViewBag.mId = id;
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        public ActionResult PlanOrder()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        public PartialViewResult LoadPlanOrders()
        {
            var list = new OrderPlanRepository().GetAll().OrderByDescending(x => x.Id);
            return PartialView("~/Areas/Admin/Views/Order/_LoadPlanOrders.cshtml", list);

        }
        public ActionResult EditPlanOrder(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var obj = new OrderPlanRepository().GetById(Convert.ToDecimal(id));
                return View(obj);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        [HttpPost]
        public string UpdatePlanOrderStatus(string id, string status)
        {
            var obj = new OrderPlanRepository().GetById(Convert.ToDecimal(id));
            obj.Status = status;
            var f = new OrderPlanRepository().Update(obj);
            if (f)
            {
                return "true";
            }
            else
            {
                return "false";
            }
        }
        [HttpPost]
        public string DeletePlanOrder(string id)
        {
            try
            {
                Decimal OId = Convert.ToDecimal(id);
                var planItem = new OrderPlanItemRepository().GetAll(x => x.OrderPlanId == OId);
                foreach (var item in planItem)
                {
                    new OrderPlanItemRepository().Delete(item.Id);
                }
                new OrderPlanRepository().Delete(OId);
                return "true";
            }
            catch (Exception)
            {
                return "false";
            }
        }

        [HttpPost]
        public PartialViewResult LoadOrders(string memberId)
        {
            List<Order> ordersList = null;
            if (!string.IsNullOrEmpty(memberId))
            {
                Decimal mId = Convert.ToDecimal(memberId);
                ordersList = new OrderRepository().GetAll(x => x.MemberId == mId).OrderByDescending(x => x.Id).ToList();

            }
            else
            {
                ordersList = new OrderRepository().GetAll().OrderByDescending(x => x.Id).ToList();
            }

            return PartialView("~/Areas/Admin/Views/Order/_LoadOrders.cshtml", ordersList);
        }

        [HttpPost]
        public string DeleteOrder(string id)
        {
            try
            {
                new OrderRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception)
            {
                return "false";
            }
        }

        public ActionResult EditOrder(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var obj = new OrderRepository().GetById(Convert.ToDecimal(id));
                return View(obj);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [HttpPost]
        public string UpdateOrderStatus(string id, string status)
        {

            var obj = new OrderRepository().GetById(Convert.ToDecimal(id));
            var layer = obj.OrderCemeteries.Select(x => x.Grave).SelectMany(x => x.CemeteryLayers).FirstOrDefault(x => x.Id == obj.OrderCemeteries.FirstOrDefault().Quantity);
            layer.IsBooking = false;
            new CemeteryLayerRepository().Update(layer);
            obj.Status = status;
            var f = new OrderRepository().Update(obj);
            if (f)
            {
                if (status == "cancelled")
                {
                    foreach (var item in obj.OrderCemeteries)
                    {
                        var lay = item.Grave.CemeteryLayers.FirstOrDefault(c => c.Id == item.Quantity);
                        lay.IsBooking = false;
                        new CemeteryLayerRepository().Update(lay);
                    }
                }
                return "true";
            }
            else
            {
                return "false";
            }
        }

        public ActionResult Reports()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        public PartialViewResult LoadReports(string dtFrom, string dtTo, string status, string reportTitle)
        {
            ViewBag.DateFrom = dtFrom;
            ViewBag.DateTo = dtTo;
            ViewBag.Status = status;
            ViewBag.ReportTitle = reportTitle;
            if (reportTitle == "cemetery")
            {
                List<Order> order = new OrderRepository().GetAll();
                if (!string.IsNullOrEmpty(dtFrom) && !string.IsNullOrEmpty(dtTo))
                {

                    var dtF = DateTime.Parse(dtFrom);
                    var dateTo = DateTime.Parse(dtTo);
                    order = order.Where(x => x.OrderDate >= dtF && x.OrderDate <= dateTo).ToList();
                }
                if (!string.IsNullOrEmpty(status))
                {
                    order = order.Where(x => x.Status != null && x.Status.ToLower() == status.ToLower()).ToList();
                }
                ViewBag.TotalSale = Math.Round(Convert.ToDecimal(order.Sum(c => c.OrderCemeteries.Sum(v => v.Price))), 2) + "";
                ViewBag.TotalRefund = Math.Round(Convert.ToDecimal(order.Where(c=>c.Status != null && c.Status.ToLower() == "cancelled").Sum(c => c.OrderCemeteries.Sum(v => v.Price))), 2) + "";
                ViewBag.Revenue = Convert.ToDecimal(ViewBag.TotalSale) - Convert.ToDecimal(ViewBag.TotalRefund);
                return PartialView("~/Areas/Admin/Views/Order/_LoadOrderReports.cshtml", order);
            }
            else
            {
                List<OrderPlan> plan = new OrderPlanRepository().GetAll();
                if (!string.IsNullOrEmpty(dtFrom) && !string.IsNullOrEmpty(dtTo))
                {

                    var dtF = DateTime.Parse(dtFrom);
                    var dateTo = DateTime.Parse(dtTo);
                    plan = plan.Where(x => x.OrderDate >= dtF && x.OrderDate <= dateTo).ToList();
                }
                if (!string.IsNullOrEmpty(status))
                {
                    plan = plan.Where(x => x.Status != null && x.Status.ToLower() == status.ToLower()).ToList();
                }
                ViewBag.TotalSale = Math.Round(Convert.ToDecimal(plan.Sum(c => c.OrderPlanItems.Sum(v => v.Price))), 2) + "";
                ViewBag.TotalRefund = Math.Round(Convert.ToDecimal(plan.Where(c => c.Status != null && c.Status.ToLower() == "cancelled").Sum(c => c.OrderPlanItems.Sum(v => v.Price))), 2) + "";
                ViewBag.Revenue = Convert.ToDecimal(ViewBag.TotalSale) - Convert.ToDecimal(ViewBag.TotalRefund);
                return PartialView("~/Areas/Admin/Views/Order/_LoadPlanOrderReport.cshtml", plan);
            }
        }

        public ActionResult ExportExcelReport(string dtFrom, string dtTo, string status, string reportTitle)
        {
            if (reportTitle == "cemetery")
            {
                List<Order> order = new OrderRepository().GetAll();
                if (!string.IsNullOrEmpty(dtFrom) && !string.IsNullOrEmpty(dtTo))
                {

                    var dtF = DateTime.Parse(dtFrom);
                    var dateTo = DateTime.Parse(dtTo);
                    order = order.Where(x => x.OrderDate >= dtF && x.OrderDate <= dateTo).ToList();
                }
                if (!string.IsNullOrEmpty(status))
                {
                    order = order.Where(x => x.Status != null && x.Status.ToLower() == status.ToLower()).ToList();
                }
                using (ExcelPackage pck = new ExcelPackage())
                {
                    //Create the worksheet
                    ExcelWorksheet ws = pck.Workbook.Worksheets.Add("CemeteryReport");
                    ws.Cells[1, 1].Value = "Order ID";
                    ws.Cells[1, 2].Value = "Order By";
                    ws.Cells[1, 3].Value = "Status";
                    ws.Cells[1, 4].Value = "Date";
                    ws.Cells[1, 5].Value = "Price";
                    int row = 2;
                    foreach (var item in order)
                    {
                        ws.Cells[row, 1].Value = item.CartId;
                        ws.Cells[row, 2].Value = item.Member.Fname + " " + item.Member.Lname;
                        ws.Cells[row, 3].Value = item.Status;
                        ws.Cells[row, 4].Value = item.OrderDate.Value.ToString("dd-MMM-yyyy");
                        ws.Cells[row, 5].Value = Math.Round(Convert.ToDecimal(item.OrderCemeteries.Sum(c => c.Price)), 2);
                        row++;
                    }
                    
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;  filename=CemeterOrderReport.xlsx");
                    Response.BinaryWrite(pck.GetAsByteArray());
                }
            }
            else
            {
                List<OrderPlan> plan = new OrderPlanRepository().GetAll();
                if (!string.IsNullOrEmpty(dtFrom) && !string.IsNullOrEmpty(dtTo))
                {

                    var dtF = DateTime.Parse(dtFrom);
                    var dateTo = DateTime.Parse(dtTo);
                    plan = plan.Where(x => x.OrderDate >= dtF && x.OrderDate <= dateTo).ToList();
                }
                if (!string.IsNullOrEmpty(status))
                {
                    plan = plan.Where(x => x.Status != null && x.Status.ToLower() == status.ToLower()).ToList();
                }
                using (ExcelPackage pck = new ExcelPackage())
                {
                    //Create the worksheet
                    ExcelWorksheet ws = pck.Workbook.Worksheets.Add("CemeteryReport");
                    ws.Cells[1, 1].Value = "Order ID";
                    ws.Cells[1, 2].Value = "Order By";
                    ws.Cells[1, 3].Value = "Status";
                    ws.Cells[1, 4].Value = "Date";
                    ws.Cells[1, 5].Value = "Price";
                    int row = 2;
                    foreach (var item in plan)
                    {
                        ws.Cells[row, 1].Value = item.CartId;
                        ws.Cells[row, 2].Value = item.Partner.Fname + " " + item.Partner.Lname;
                        ws.Cells[row, 3].Value = item.Status;
                        ws.Cells[row, 4].Value = item.OrderDate.Value.ToString("dd-MMM-yyyy");
                        ws.Cells[row, 5].Value = Math.Round(Convert.ToDecimal(item.OrderPlanItems.Sum(c => c.Price)), 2);
                        row++;
                    }

                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;  filename=PlanOrderReport.xlsx");
                    Response.BinaryWrite(pck.GetAsByteArray());
                }
            }
            return View("ExportExcel_Report");
        }

        public ActionResult GravesInventory()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                ViewBag.TotalGraves = new CemeteryLayerRepository().GetAll(c => c.Grave.SpotId != null).Count();
                ViewBag.TotalAvailable = new CemeteryLayerRepository().GetAll(c => c.Grave.SpotId != null && c.IsBooking != true).Count();
                ViewBag.TotalSold = new CemeteryLayerRepository().GetAll(c => c.Grave.SpotId != null && c.Grave.OrderCemeteries.FirstOrDefault(b => b.Quantity == c.Id) != null && c.Grave.OrderCemeteries.FirstOrDefault(b => b.Quantity == c.Id).Order.Status == "Confirmed").Count();
                ViewBag.TotalPending = new CemeteryLayerRepository().GetAll(c => c.Grave.SpotId != null && c.Grave.OrderCemeteries.FirstOrDefault(b => b.Quantity == c.Id) != null && c.Grave.OrderCemeteries.FirstOrDefault(b => b.Quantity == c.Id).Order.Status == "Pending").Count();
                ViewBag.TotalRefunded = new CemeteryLayerRepository().GetAll(c => c.Grave.SpotId != null && c.Grave.OrderCemeteries.FirstOrDefault(b => b.Quantity == c.Id) != null && c.Grave.OrderCemeteries.FirstOrDefault(b => b.Quantity == c.Id).Order.Status == "Cancelled").Count();
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        public ActionResult ShowInventryDetails(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var grave = new GravesRepository().GetById(Convert.ToDecimal(id));
                return View(grave);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        public ActionResult GravesInventoryExport()
        {

            try
            {

                var graves = new GravesRepository().GetAll(c => c.SpotId != null);

                using (ExcelPackage pck = new ExcelPackage())
                {
                    //Create the worksheet
                    ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Demo");

                    ws.Cells[1, 1].Value = "Plot No. ";
                    ws.Cells[1, 2].Value = "Plot Name";
                    ws.Cells[1, 3].Value = "Size";

                    ws.Cells[1, 4].Value = "Total Internements";

                    ws.Cells[1, 5].Value = "Available Internements";
                    ws.Cells[1, 6].Value = "Sold Internements";
                    ws.Cells[1, 7].Value = "Pending Internements";
                    ws.Cells[1, 8].Value = "Tier";

                    int row = 2;
                    foreach (var item in graves)
                    {

                        ws.Cells[row, 1].Value = item.PlotNo;
                        ws.Cells[row, 2].Value = item.PlotName;
                        ws.Cells[row, 3].Value = item.Size;
                        ws.Cells[row, 4].Value = item.CemeteryLayers.Count();
                        ws.Cells[row, 5].Value = item.CemeteryLayers.Where(c => c.IsBooking != true).Count();
                        ws.Cells[row, 6].Value = item.CemeteryLayers.Where(c => c.IsBooking == true && c.Grave.OrderCemeteries.FirstOrDefault() != null && c.Grave.OrderCemeteries.FirstOrDefault().Order.Status.ToLower() == "confirmed").Count();
                        ws.Cells[row, 7].Value = item.CemeteryLayers.Where(c => c.IsBooking == true && c.Grave.OrderCemeteries.FirstOrDefault() != null && c.Grave.OrderCemeteries.FirstOrDefault().Order.Status.ToLower() == "pending").Count();
                        ws.Cells[row, 8].Value = item.Tier.Name;
                        row++;
                    }

                    //Write it back to the client
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;  filename=GraveInventory.xlsx");
                    Response.BinaryWrite(pck.GetAsByteArray());
                }
            }
            catch (Exception ex)
            {
                ViewBag.Result = ex.Message;
            }
            return View("ExportExcel_Report");
        }

        public ActionResult ExportInternmentDetails(string id)
        {

            try
            {
                var graveId = Convert.ToDecimal(id);
                var layers = new CemeteryLayerRepository().GetAll(c => c.CemeteryId == graveId);

                using (ExcelPackage pck = new ExcelPackage())
                {
                    //Create the worksheet
                    ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Demo");

                    ws.Cells[1, 1].Value = "Name";
                    ws.Cells[1, 2].Value = "Price";
                    ws.Cells[1, 3].Value = "Status";

                    int row = 2;
                    foreach (var item in layers)
                    {

                        ws.Cells[row, 1].Value = item.Name;
                        ws.Cells[row, 2].Value = item.Price;
                        if (item.Grave.OrderCemeteries.FirstOrDefault() != null)
                        {
                            if (item.Grave.OrderCemeteries.FirstOrDefault().Order.Status != null && item.Grave.OrderCemeteries.FirstOrDefault().Order.Status.ToLower() == "confirmed")
                            {
                                ws.Cells[row, 3].Value = "Sold";
                            }
                            else if (item.Grave.OrderCemeteries.FirstOrDefault().Order.Status != null && item.Grave.OrderCemeteries.FirstOrDefault().Order.Status.ToLower() == "pending")
                            {
                                ws.Cells[row, 3].Value = "Pending";
                            }
                            else
                            {
                                ws.Cells[row, 3].Value = "Refunded";
                            }
                        }
                        else
                        {
                            ws.Cells[row, 3].Value = "Available";
                        }
                        row++;
                    }

                    //Write it back to the client
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;  filename=InternementPlotDetails.xlsx");
                    Response.BinaryWrite(pck.GetAsByteArray());
                }
            }
            catch (Exception ex)
            {
                ViewBag.Result = ex.Message;
            }
            return View("ExportExcel_Report");
        }

        [HttpPost]
        public PartialViewResult LoadCemeteryLayers(string filter)
        {
            var list = new CemeteryLayerRepository().GetAll();
            if (filter == "Sold")
            {
                list = list.Where(c => c.Grave.OrderCemeteries.FirstOrDefault(v => v.Quantity == c.Id) != null && c.Grave.OrderCemeteries.FirstOrDefault(v => v.Quantity == c.Id).Order.Status != null && c.Grave.OrderCemeteries.FirstOrDefault(v => v.Quantity == c.Id).Order.Status.ToLower() == "confirmed").ToList();
            }
            else if (filter == "Pending")
            {
                list = list.Where(c => c.Grave.OrderCemeteries.FirstOrDefault(v => v.Quantity == c.Id) != null && c.Grave.OrderCemeteries.FirstOrDefault(v => v.Quantity == c.Id).Order.Status != null && c.Grave.OrderCemeteries.FirstOrDefault(v => v.Quantity == c.Id).Order.Status.ToLower() == "pending").ToList();
            }
            else if (filter == "Available")
            {
                list = list.Where(c => c.IsBooking != true).ToList();
            }
            else if (filter == "Refunded")
            {
                list = list.Where(c => c.Grave.OrderCemeteries.FirstOrDefault(v => v.Quantity == c.Id) != null && c.Grave.OrderCemeteries.FirstOrDefault(v => v.Quantity == c.Id).Order.Status != null && c.Grave.OrderCemeteries.FirstOrDefault(v => v.Quantity == c.Id).Order.Status.ToLower() == "cancelled").ToList();
            }
            ViewBag.Filter = filter;
            return PartialView("~/Areas/Admin/Views/Order/_LoadCemeteryLayers.cshtml", list);
        }

        [HttpPost]
        public PartialViewResult LoadGravesWise()
        {
            var graves = new GravesRepository().GetAll(c => c.SpotId != null);
            return PartialView("~/Areas/Admin/Views/Order/_LoadGravesWise.cshtml", graves);
        }
        public ActionResult GravesLayerInventoryExport(string filter)
        {

            try
            {

                var list = new CemeteryLayerRepository().GetAll();
                if (filter == "Sold")
                {
                    list = list.Where(c => c.Grave.OrderCemeteries.FirstOrDefault() != null && c.Grave.OrderCemeteries.FirstOrDefault().Order.Status != null && c.Grave.OrderCemeteries.FirstOrDefault().Order.Status.ToLower() == "confirmed").ToList();
                }
                else if (filter == "Pending")
                {
                    list = list.Where(c => c.Grave.OrderCemeteries.FirstOrDefault() != null && c.Grave.OrderCemeteries.FirstOrDefault().Order.Status != null && c.Grave.OrderCemeteries.FirstOrDefault().Order.Status.ToLower() == "pending").ToList();
                }
                else if (filter == "Available")
                {
                    list = list.Where(c => c.IsBooking != true).ToList();
                }
                else if (filter == "Refunded")
                {
                    list = list.Where(c => c.Grave.OrderCemeteries.FirstOrDefault() != null && c.Grave.OrderCemeteries.FirstOrDefault().Order.Status != null && c.Grave.OrderCemeteries.FirstOrDefault().Order.Status.ToLower() == "cancelled").ToList();
                }

                using (ExcelPackage pck = new ExcelPackage())
                {
                    //Create the worksheet
                    ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Demo");
                    ws.Cells[1, 1].Value = "Name";
                    ws.Cells[1, 2].Value = "Plot Name";
                    ws.Cells[1, 3].Value = "Size";
                    ws.Cells[1, 4].Value = "Tier";
                    ws.Cells[1, 5].Value = "Price";
                    ws.Cells[1, 6].Value = "Status";
                    int row = 2;
                    foreach (var item in list)
                    {

                        ws.Cells[row, 1].Value = item.Name;
                        ws.Cells[row, 2].Value = item.Grave.PlotName;
                        ws.Cells[row, 3].Value = item.Grave.Size;
                        ws.Cells[row, 4].Value = item.Grave.Tier.Name;
                        ws.Cells[row, 5].Value = Math.Round(Convert.ToDecimal(item.Price), 2);
                        if (item.IsBooking != true)
                        {
                            ws.Cells[row, 6].Value = "Available";
                        }
                        else
                        {
                            if (item.Grave.OrderCemeteries.FirstOrDefault() != null)
                            {
                                if (item.Grave.OrderCemeteries.FirstOrDefault().Order.Status != null && item.Grave.OrderCemeteries.FirstOrDefault().Order.Status.ToLower() == "confirmed")
                                {
                                    ws.Cells[row, 6].Value = "Sold";
                                }
                                else if (item.Grave.OrderCemeteries.FirstOrDefault().Order.Status != null && item.Grave.OrderCemeteries.FirstOrDefault().Order.Status.ToLower() == "pending")
                                {
                                    ws.Cells[row, 6].Value = "Pending";
                                }
                                else
                                {
                                    ws.Cells[row, 6].Value = "Refunded";
                                }
                            }
                        }
                        row++;
                    }

                    //Write it back to the client
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;  filename=GraveInternementInventory.xlsx");
                    Response.BinaryWrite(pck.GetAsByteArray());
                }
            }
            catch (Exception ex)
            {
                ViewBag.Result = ex.Message;
            }
            return View("ExportExcel_Report");
        }

        public ActionResult PlansInventory()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                ViewBag.TotalServices = new ServiceListingRepository().GetAll().Count();
                ViewBag.TotalSold = new OrderPlanRepository().GetAll(c => c.Status != null && c.Status.ToLower() == "confirmed").Count();
                ViewBag.TotalPending = new OrderPlanRepository().GetAll(c => c.Status != null && c.Status.ToLower() == "pending").Count();
                ViewBag.TotalRefunded = new OrderPlanRepository().GetAll(c => c.Status != null && c.Status.ToLower() == "cancelled").Count();
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [HttpPost]
        public PartialViewResult LoadPurchasePlan()
        {
            var plansList = new PartnerPlanRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Order/_LoadPurchasePlan.cshtml", plansList);
        }
        [HttpPost]
        public PartialViewResult LoadPlanPurchaseDetails(string id)
        {
            var pId = Convert.ToDecimal(id);
            var planDetails = new ServiceListingPlanRepository().GetAll(c => c.PlanId == pId);
            return PartialView("~/Areas/Admin/Views/Order/_LoadPlanPurchaseDetails.cshtml", planDetails);
        }

        public PartialViewResult LoadServiceListingWise()
        {
            var listings = new ServiceListingRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Order/_LoadServiceListingWise.cshtml", listings);
        }
    }
}