using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;

namespace Cricket.Web
{
    /// <summary>
    /// Entry point
    /// </summary>
    public class Program
    {
        #region Methods

        /// <summary>
        /// Entry point method
        /// </summary>
        /// <param name="args">Arguments</param>
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        /// <summary>
        /// Initiate and configure a Web Host Builder
        /// </summary>
        /// <param name="args">Arguments</param>
        /// <returns>Web Host Builder object</returns>
        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>();

        #endregion
    }
}
