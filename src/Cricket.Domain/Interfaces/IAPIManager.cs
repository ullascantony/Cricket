using System.Collections.Generic;
using System.Threading.Tasks;

namespace Cricket.Domain.Interfaces
{
    /// <summary>
    /// Interface to model API Manager
    /// </summary>
    public interface IAPIManager
    {
        #region Methods

        /// <summary>
        /// Get data asynchronously
        /// </summary>
        /// <typeparam name="T">Object type</typeparam>
        /// <param name="controller">Controller name</param>
        /// <param name="action">Action name</param>
        /// <param name="paramData">Parameter data as list</param>
        /// <returns>Object result</returns>
        Task<T> GetAsync<T>(string controller, string action = null, List<KeyValuePair<string, object>> paramData = null);

        /// <summary>
        /// Get data asynchronously with named parameters
        /// </summary>
        /// <typeparam name="T">Object type</typeparam>
        /// <param name="controller">Controller name</param>
        /// <param name="action">Action name</param>
        /// <param name="paramData">Parameter data as list</param>
        /// <returns>Object result</returns>
        Task<T> GetNamedParamAsync<T>(string controller, string action = null, List<KeyValuePair<string, object>> paramData = null);

        /// <summary>
        /// Post data asynchronously
        /// </summary>
        /// <typeparam name="T">Object type</typeparam>
        /// <param name="controller">Controller name</param>
        /// <param name="action">Action name</param>
        /// <param name="data">Data as object</param>
        /// <returns>Object result</returns>
        Task<T> PostAsync<T>(string controller, string action, object data);

        #endregion
    }
}
