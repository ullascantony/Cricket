using System;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Xml.Serialization;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace Cricket.Data.Services
{
    /// <summary>
    /// Base service to hold common logic
    /// </summary>
    public class BaseService
    {
        #region Members

        protected readonly IConfiguration Configuration;

        protected readonly IMemoryCache Cache;

        protected readonly ILogger<BaseService> Logger;

        #endregion

        #region Constructors

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="configuration">Configuration</param>
        /// <param name="cache">Cache</param>
        /// <param name="logger">Logger</param>
        public BaseService(
            IConfiguration configuration,
            IMemoryCache cache,
            ILogger<BaseService> logger = null)
        {
            Configuration = configuration;
            Cache = cache;
            Logger = logger;
        }

        #endregion

        #region Helper methods

        public int GetCommandTimeoutSeconds()
        {
            int.TryParse(Configuration.GetSection("AppSettings").GetSection("Sql.CommandTimeoutSeconds").Value, out int timeoutSeconds);
            return timeoutSeconds == 0 ? 300 : timeoutSeconds;
        }

        public int GetDefaultRecordCount()
        {
            int.TryParse(Configuration.GetSection("AppSettings").GetSection("Sql.DefaultRecordCount").Value, out int recordCount);
            return recordCount == 0 ? 50 : recordCount;
        }

        public string GetBaseConnection()
        {
            return Configuration.GetSection("ConnectionStrings").GetSection("BaseDataConnection").Value;
        }

        public void LogInformation(string message)
        {
            if(Logger != null)
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
