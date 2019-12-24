using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Dapper;

using Cricket.Data.Constants;
using Cricket.Domain.Interfaces;
using Cricket.Domain.Models;

namespace Cricket.Data.Services
{
    public class UserDataService : BaseService, IUserDataService
    {
        #region Constructors

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="configuration">Configuration</param>
        /// <param name="cache">Cache</param>
        /// <param name="logger">Logger</param>
        public UserDataService(
            IConfiguration configuration,
            IMemoryCache cache,
            ILogger<UserDataService> logger = null) : base(configuration, cache, logger)
        {
        }

        #endregion

        #region Methods

        public User GetUserByID(int userId)
        {
            LogInformation($"Getting User for User ID: {userId}");

            var parameters = new DynamicParameters();
            parameters.Add(SQL.UserID, userId, DbType.Int32);

            using (var con = new SqlConnection(GetBaseConnection()))
            {
                using (var response = con.QueryMultiple(
                    SQL.GetUser,
                    parameters,
                    commandType: CommandType.StoredProcedure))
                {
                    return response.ReadFirstOrDefault<User>();
                }
            }
        }

        public User GetUserByUserName(string userName)
        {
            LogInformation($"Getting User for User Name: {userName}");

            var parameters = new DynamicParameters();
            parameters.Add(SQL.UserName, userName, DbType.String);

            using (var con = new SqlConnection(GetBaseConnection()))
            {
                using (var response = con.QueryMultiple(
                    SQL.GetUser,
                    parameters,
                    commandType: CommandType.StoredProcedure))
                {
                    return response.ReadFirstOrDefault<User>();
                }
            }
        }

        public List<User> SearchUsers(UserSearch criteria)
        {
            LogInformation($"Searching Users for criteria: {JsonSerialize(criteria)}");

            var parameters = new DynamicParameters();
            parameters.Add(SQL.UserID, criteria.UserID, DbType.Int32);
            parameters.Add(SQL.UserName, criteria.UserName, DbType.String);
            parameters.Add(SQL.UserIsAdmin, criteria.UserIsAdmin, DbType.Boolean);
            parameters.Add(SQL.IncludeArchived, criteria.IncludeArchived, DbType.Boolean);
            parameters.Add(SQL.Rows, criteria.Rows, DbType.Int32);
            parameters.Add(SQL.Page, criteria.Page, DbType.Int32);

            using (var con = new SqlConnection(GetBaseConnection()))
            {
                using (var response = con.QueryMultiple(
                    SQL.GetUser,
                    parameters,
                    commandType: CommandType.StoredProcedure))
                {
                    return response.Read<User>().AsList();
                }
            }
        }

        public int CreateUser(User user)
        {
            LogInformation($"Creating User: {JsonSerialize(user)}");

            user.UserID = 0;

            var parameters = new DynamicParameters();
            parameters.Add(SQL.UserID, user.UserID, DbType.Int32, ParameterDirection.InputOutput);
            parameters.Add(SQL.UserName, user.UserName, DbType.String);
            parameters.Add(SQL.UserDisplayName, user.UserDisplayName, DbType.String);
            parameters.Add(SQL.UserIsAdmin, user.UserIsAdmin, DbType.Boolean);
            parameters.Add(SQL.UpdatedBy, user.UpdatedBy, DbType.Int32);

            using (var con = new SqlConnection(GetBaseConnection()))
            {
                con.Execute(SQL.SetUser, parameters, commandType: CommandType.StoredProcedure);
                user.UserID = parameters.Get<int>(SQL.UserID);
            }

            return user.UserID;
        }

        public int UpdateUser(User user)
        {
            LogInformation($"Updating User: {JsonSerialize(user)}");

            var affectedRowCount = 0;

            var parameters = new DynamicParameters();
            parameters.Add(SQL.UserID, user.UserID, DbType.Int32, ParameterDirection.InputOutput);
            parameters.Add(SQL.UserName, user.UserName, DbType.String);
            parameters.Add(SQL.UserDisplayName, user.UserDisplayName, DbType.String);
            parameters.Add(SQL.UserIsAdmin, user.UserIsAdmin, DbType.Boolean);
            parameters.Add(SQL.UpdatedBy, user.UpdatedBy, DbType.Int32);
            parameters.Add(SQL.AffectedRowCount, affectedRowCount, DbType.Int32, ParameterDirection.ReturnValue);

            using (var con = new SqlConnection(GetBaseConnection()))
            {
                con.Execute(SQL.SetUser, parameters, commandType: CommandType.StoredProcedure);
                affectedRowCount = parameters.Get<int>(SQL.AffectedRowCount);
            }

            return affectedRowCount;
        }

        #endregion
    }
}
