using System;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Xml.Serialization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

using Cricket.Domain.Interfaces;
using Cricket.Domain.Models;

namespace Cricket.Web.Controllers
{
    public class BaseController : Controller
    {
        #region Constants

        private const string CacheKeyLoggedUser = "Cache.Key.LoggedUser";

        #endregion

        #region Members

        protected readonly IConfiguration Configuration;

        protected readonly IHttpContextAccessor ContextAccessor;

        protected readonly IMemoryCache Cache;

        protected readonly ILogger<BaseController> Logger;

        protected readonly IUserDataService UserDataService;

        #endregion

        #region Properties

        public User LoggedUser { get; private set; }

        #endregion

        #region Constructors

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="configuration">Configuration</param>
        /// <param name="contextAccessor">Context Accessor</param>
        /// <param name="cache">Cache</param>
        /// <param name="logger">Logger</param>
        /// <param name="userDataService">User Data Service</param>
        public BaseController(
            IConfiguration configuration,
            IHttpContextAccessor contextAccessor,
            IMemoryCache cache,
            ILogger<BaseController> logger,
            IUserDataService userDataService)
        {
            Configuration = configuration;
            ContextAccessor = contextAccessor;
            Cache = cache;
            Logger = logger;
            UserDataService = userDataService;
        }

        #endregion

        #region Helper methods

        protected void CheckUserAccess()
        {
            var context = ContextAccessor.HttpContext;
            if (context.User.Identities.Any(x => x.IsAuthenticated))
            {
                var winUser = ContextAccessor.HttpContext.User.Identity.Name;

                if (Cache.TryGetValue(CacheKeyLoggedUser, out User cachedUser))
                {
                    LoggedUser = cachedUser;
                }

                var checkAccess = false;
                if (LoggedUser == null)
                {
                    checkAccess = true;
                }
                else if (!LoggedUser.UserName.Equals(winUser, StringComparison.InvariantCultureIgnoreCase))
                {
                    checkAccess = true;
                }

                if (checkAccess)
                {
                    LoggedUser = UserDataService.GetUserByUserName(winUser);
                    if (LoggedUser == null)
                    {
                        throw new UnauthorizedAccessException("Add your Windows network account to the Users database table to get access");
                    }
                    else
                    {
                        Cache.Set(CacheKeyLoggedUser, LoggedUser);
                    }
                }
            }
        }

        protected void CheckAdminAccess()
        {
            CheckUserAccess();
            if (LoggedUser != null)
            {
                if (!LoggedUser.UserIsAdmin)
                {
                    throw new UnauthorizedAccessException("User does not have enough permissions to to perform this action");
                }
            }
        }

        public void LogInformation(string message)
        {
            if (Logger != null)
            {
                Logger.LogInformation($"{GetType().FullName}: {message}");
            }
        }

        public string XmlSerialize<T>(T objInstance)
        {
            var serializer = new XmlSerializer(typeof(T));
            var writer = new StringWriter();
            serializer.Serialize(writer, objInstance);
            return writer.ToString().Replace(Environment.NewLine, " ");
        }

        public string JsonSerialize<T>(T objInstance)
        {
            var serializer = new DataContractJsonSerializer(typeof(T));
            var stream = new MemoryStream();
            serializer.WriteObject(stream, objInstance);
            stream.Position = 0;
            var reader = new StreamReader(stream);
            return reader.ReadToEnd().Replace(Environment.NewLine, " ");
        }

        #endregion
    }
}
