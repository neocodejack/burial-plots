using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BurialPlots.Startup))]
namespace BurialPlots
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
