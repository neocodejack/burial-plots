using System.Web;
using System.Web.Optimization;

namespace BurialPlots
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            //// Use the development version of Modernizr to develop with and learn from. Then, when you're
            //// ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.min.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                     "~/Content/bootstrap.min.css",
                      "~/Content/assets/global/plugins/font-awesome/css/font-awesome.min.css",
                      "~/Content/assets/global/plugins/simple-line-icons/simple-line-icons.min.css",
                      "~/Content/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css",
                      "~/Content/custom-style.css"
                      ));

            bundles.Add(new StyleBundle("~/Content/Global").Include(
                     "~/Content/assets/global/css/components.min.css",
                     "~/Content/assets/global/css/plugins.min.css"));

            bundles.Add(new StyleBundle("~/Content/Layout").Include(
                     "~/Content/assets/layouts/layout/css/layout.min.css",
                     "~/Content/assets/layouts/layout/css/themes/darkblue.min.css",
                     "~/Content/assets/layouts/layout/css/custom.min.css"
                     ));

            bundles.Add(new ScriptBundle("~/bundles/CorePlugins").Include(
                "~/Content/assets/global/plugins/js.cookie.min.js",
                "~/Content/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js",
                "~/Content/assets/global/plugins/jquery.blockui.min.js",
                "~/Content/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
                ));

            bundles.Add(new ScriptBundle("~/bundles/LayoutScript").Include(
                "~/Content/assets/layouts/layout/scripts/layout.min.js",
                "~/Content/assets/layouts/global/scripts/quick-sidebar.min.js",
                "~/Content/assets/layouts/global/scripts/quick-nav.min.js"
                ));
            bundles.Add(new StyleBundle("~/Content/PageLevel").Include(
                 "~/assets/global/plugins/select2/css/select2.min.css ",
                  "~/Content/assets/global/plugins/datatables/datatables.min.css",
                  "~/Content/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css",
                 "~/Content/assets/global/plugins/select2/css/select2-bootstrap.min.css"

               ));
            bundles.Add(new ScriptBundle("~/bundles/PageLevel").Include(
               "~/Content/assets/global/plugins/select2/js/select2.full.min.js",
               "~/Content/assets/global/plugins/datatables/datatables.min.js",
               "~/Content/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js",
               "~/Content/assets/pages/scripts/table-datatables-fixedheader.min.js",
               "~/Scripts/underscore-min.js"
               ));
        }
    }
}
