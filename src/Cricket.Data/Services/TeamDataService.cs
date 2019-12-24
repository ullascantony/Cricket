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
    public class TeamDataService : BaseService, ITeamDataService
    {
        #region Constants

        private const string CacheKeyTeams = "Cache.Key.Teams";

        #endregion

        #region Constructors

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="configuration">Configuration</param>
        /// <param name="cache">Cache</param>
        /// <param name="logger">Logger</param>
        public TeamDataService(
            IConfiguration configuration,
            IMemoryCache cache,
            ILogger<TeamDataService> logger = null) : base(configuration, cache, logger)
        {
        }

        #endregion

        #region Methods

        public List<Team> SearchTeams(TeamSearch criteria)
        {
            LogInformation($"Searching Teams for criteria: {JsonSerialize(criteria)}");

            if (Cache.TryGetValue(CacheKeyTeams, out List<Team> cachedTeams))
            {
                return cachedTeams;
            }
            else
            {
                var parameters = new DynamicParameters();

                parameters.Add(SQL.TeamID, criteria.TeamID, DbType.Int32);
                parameters.Add(SQL.TeamCode, criteria.TeamCode, DbType.String);
                parameters.Add(SQL.IncludeArchived, criteria.IncludeArchived, DbType.Boolean);
                parameters.Add(SQL.Rows, criteria.Rows, DbType.Int32);
                parameters.Add(SQL.Page, criteria.Page, DbType.Int32);

                using (var con = new SqlConnection(GetBaseConnection()))
                {
                    using (var response = con.QueryMultiple(
                        SQL.GetTeam,
                        parameters,
                        commandType: CommandType.StoredProcedure))
                    {
                        var teams = response.Read<Team>().AsList();

                        Cache.Set(CacheKeyTeams, teams);

                        return teams;
                    }
                }
            }
        }

        #endregion
    }
}
