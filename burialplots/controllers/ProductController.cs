using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace BurialPlots.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            var item = new CategoryRepository().GetAll();
            ViewBag.itemlist = item;
            return View();
        }
        public ActionResult Item(int id)
        {
            var getitem = new ItemRepository().GetAll().Where(x => x.CateId == id);
            ViewBag.product = getitem;

            return View();
        }
        public ActionResult ProductDetails(int id)
        {
            var item = new ItemRepository().FirstOrDefault(x => x.Id == id);

            return View(item);
        }
        public string AddtoCart(int id)
        {
            try
            {
                var dataitem = new ItemRepository().FirstOrDefault(x => x.Id == id);
                List<Shoppingcart> list = new List<Shoppingcart>();
                if (Session["cartitem"] != null)
                {
                    List<Shoppingcart> cartitem = (List<Shoppingcart>)Session["cartitem"];
                    int tot = 1;
                   foreach (Shoppingcart item in cartitem)
                    {
                        Shoppingcart c = new Shoppingcart();
                        c.itemid = item.itemid;
                        c.itemdescription = item.itemdescription;
                        c.itemname = item.itemname;
                        c.itempic = item.itempic;
                        c.itemprice = Convert.ToDecimal(item.itemprice);
                        c.itemqty = Convert.ToDecimal(item.itemqty);
                        c.userid = 1;
                        c.username = "hamza";
                        list.Add(c);
                       
                        if (tot==cartitem.Count)
                        {
                            Shoppingcart ct = new Shoppingcart();
                            ct.itemid = dataitem.Id;
                            ct.itemdescription = dataitem.ItemDescription;
                            ct.itemname = dataitem.ItemName;
                            ct.itempic = dataitem.ItemImage;
                            ct.itemprice = Convert.ToDecimal(dataitem.ItemRprice);
                            ct.itemqty = Convert.ToDecimal(dataitem.ItemQty);
                            ct.userid = 1;
                            ct.username = "hamza";
                            list.Add(ct);
                        }
                        tot++;
                    }
                 
                    Session["cartitem"] = list;
                }
                else
                {
                    Shoppingcart c = new Shoppingcart();
                    c.itemid = dataitem.Id;
                    c.itemdescription = dataitem.ItemDescription;
                    c.itemname = dataitem.ItemName;
                    c.itempic = dataitem.ItemImage;
                    c.itemprice = Convert.ToDecimal(dataitem.ItemRprice);
                    c.itemqty = Convert.ToDecimal(dataitem.ItemQty);
                    c.userid = 1;
                    c.username = "hamza";

                    list.Add(c);
                    Session["cartitem"] = list;
                }
            
                return "true";
            }
            catch (Exception)
            {

                return "false";
            }



           

            //try
            //{
            //    var pro = new ItemRepository().FirstOrDefault(x => x.Id == id);
            //    Cart c = new Cart();
            //    c.ItemId = pro.Id;
            //    c.ItemName = pro.ItemName;
            //    c.ItemPicture = pro.ItemImage;
            //    c.ItemPrice = pro.ItemRprice.ToString();
            //    c.ItemQty = pro.ItemQty.ToString();
            //    var add = new CartRepository().Add(c);
            //    return "true";
            //}
            //catch
            //{
            //    return "false";
            //}
         

        }
        public ActionResult Chekout()
        {
            var cartitem = Session["cartitem"];

            return View("~/Views/Product/_Chekout.cshtml",cartitem);
        }
        public string DeleteCart(int id)
        {
            try
            {
                var cartitem = Session["cartitem"];
                List<Shoppingcart> list = (List<Shoppingcart>)Session["cartitem"];
                var itemToRemove = list.Single(r => r.itemid == id);
                list.Remove(itemToRemove);
                Session["cartitem"] = list;

                return "true";
            }
            catch (Exception)
            {
                return "false";
            }
           
        }
        
        public ActionResult Payment()
        {
            //if(Session["id"]==null)
            //{
            //    return View("~/Views/Plots/Login.cshtml");
            //}
            //else
            //{
                List<Shoppingcart> cartitem = (List<Shoppingcart>)Session["cartitem"];
                Cart item = new Cart();
                if(cartitem!=null)
                {
                    foreach (var sessitme in cartitem)
                    {
                        item.ItemId = sessitme.itemid;
                        item.ItemName = sessitme.itemname;
                        item.ItemPicture = sessitme.itempic;
                        item.ItemPrice = sessitme.itemprice.ToString();
                        item.ItemQty = sessitme.itemqty.ToString();
                        //item.UserId = Convert.ToInt32(Session["id"].ToString());
                        var itemd = new CartRepository().Add(item);
                    }
                    Session.Remove("cartitem");
                
                            
               
            }
            return View();


        }
    }

    public class Shoppingcart
    {
        public int itemid { get; set; }
        public string itemname { get; set; }
        public string itempic { get; set; }
        public string itemdescription { get; set; }
        public decimal itemprice { get; set; }
        public decimal itemqty { get; set; }
        public decimal userid { get; set; }

        public string username { get; set; }
    }

}