using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Hotel_UPC.Startup))]
namespace Hotel_UPC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
