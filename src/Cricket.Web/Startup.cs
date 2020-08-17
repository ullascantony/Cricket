using System;
using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Server.IISIntegration;
using Microsoft.AspNetCore.SpaServices.ReactDevelopmentServer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Hosting;

using Cricket.Data.Services;
using Cricket.Domain.Interfaces;

namespace Cricket.Web
{
    /// <summary>
    /// Startup logic
    /// </summary>
    public class Startup
    {
        #region Properties

        /// <summary>
        /// Applicaton version
        /// </summary>
        public string AppVersion { get; set; }

        /// <summary>
        /// Configuration
        /// </summary>
        public IConfiguration Configuration { get; set; }

        /// <summary>
        /// Logger
        /// </summary>
        public ILogger<Startup> Logger;

        #endregion

        #region Configured properties

        public string AppTitle
        {
            get
            {
                return Configuration.GetSection("AppSettings").GetSection("App.Title").Value;
            }
        }

        public string AppDescription
        {
            get
            {
                return Configuration.GetSection("AppSettings").GetSection("App.Description").Value;
            }
        }

        #endregion

        #region Constructor

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="configuration">Configuration</param>
        public Startup(
            IConfiguration configuration,
            ILogger<Startup> logger)
        {
            Configuration = configuration;
            Logger = logger;

            AppVersion = GetApplicationVersion();
        }

        #endregion

        #region Methods

        /// <summary>
        /// This method gets called by the runtime. Use this method to add services to the container.
        /// </summary>
        /// <param name="services">Dependency services</param>
        public void ConfigureServices(IServiceCollection services)
        {
            services
                .AddMvc()
                .SetCompatibilityVersion(CompatibilityVersion.Version_3_0)
                .AddRazorPagesOptions(options =>
                {
                    options.RootDirectory = "/Pages";
                    options.Conventions.ConfigureFilter(new IgnoreAntiforgeryTokenAttribute());
                });
            Logger.LogInformation("Configured MVC and Anti-forgery settings");

            // Add Windows authentication
            services.AddAuthentication(IISDefaults.AuthenticationScheme);
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            Logger.LogInformation("Configured Windows authentication");

            // Add cacheing ability
            services.AddMemoryCache();
            Logger.LogInformation("Configured cacheing ability");

            // Add custom services
            services
                .AddTransient<IUserDataService, UserDataService>()
                .AddTransient<ITeamDataService, TeamDataService>()
                .AddTransient<IWorldCupPlayerDataService, WorldCupPlayerDataService>();
            Logger.LogInformation("Configured custom services");

            // In production, the React files will be served from this directory
            services.AddSpaStaticFiles(configuration =>
            {
                configuration.RootPath = "ClientApp/build";
            });
            Logger.LogInformation("Configured production React files directory");
        }

        /// <summary>
        /// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        /// </summary>
        /// <param name="app">Application builder</param>
        /// <param name="env">Hosting environment</param>
        /// <param name="loggerFactory">Logger factory</param>
        public void Configure(
            IApplicationBuilder app,
            IWebHostEnvironment env,
            ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                Logger.LogInformation("Configured developer error page");
            }
            else
            {
                app.UseExceptionHandler("/Error");
                app.UseHsts(); // Default HSTS value is 30 days
                Logger.LogInformation("Configured custom error page");
            }

            // Enable default HTTPS redirection when available
            app.UseHttpsRedirection();

            // Add URL based routing capabilities
            app.UseRouting();
            Logger.LogInformation("Configured Application Routing");

            app.UseStaticFiles();
            app.UseSpaStaticFiles();
            app.UseCookiePolicy();
            Logger.LogInformation("Configured Application Web Settings");

            // Add endpoints to controller actions
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller}/{action=Index}/{id?}");
            });
            Logger.LogInformation("Configured site settings");

            loggerFactory.AddFile("logs/cricket_{Date}.log");
            Logger.LogInformation("Configured file logging");

            app.UseSpa(spa =>
            {
                spa.Options.SourcePath = "ClientApp";

                if (env.IsDevelopment())
                {
                    spa.UseReactDevelopmentServer(npmScript: "start");
                }
            });
            Logger.LogInformation("Configured Single-page Application");
        }

        #endregion

        #region Helper methods

        private string GetApplicationVersion()
        {
            var appVersion = "v1";
            try
            {
                var asm = Assembly.GetExecutingAssembly().GetName();
                appVersion = $"v{asm.Version.Major}.{asm.Version.Minor}.{asm.Version.Build}";
            }
            catch (Exception)
            {
                // Sink it
            }
            return appVersion;
        }

        #endregion
    }
}
