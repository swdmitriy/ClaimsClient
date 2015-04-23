using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ClaimClient.Startup))]
namespace ClaimClient
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
