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
    public class WorldCupPlayerDataService : BaseService, IWorldCupPlayerDataService
    {
        #region Constructors

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="configuration">Configuration</param>
        /// <param name="cache">Cache</param>
        /// <param name="logger">Logger</param>
        public WorldCupPlayerDataService(
            IConfiguration configuration,
            IMemoryCache cache,
            ILogger<WorldCupPlayerDataService> logger = null) : base(configuration, cache, logger)
        {
        }

        #endregion

        #region Methods

        public List<WorldCupPlayer> SearchWorldCupPlayers(WorldCupPlayerSearch criteria)
        {
            LogInformation($"Searching World Cup Players for criteria: {JsonSerialize(criteria)}");

            var parameters = new DynamicParameters();

            parameters.Add(SQL.WorldCupPlayerID, criteria.WorldCupPlayerID, DbType.Int32);
            parameters.Add(SQL.TeamID, criteria.TeamID, DbType.Int32);
            parameters.Add(SQL.DateOfBirthRangeBegin, criteria.DateOfBirthRangeBegin, DbType.Date);
            parameters.Add(SQL.DateOfBirthRangeEnd, criteria.DateOfBirthRangeEnd, DbType.Date);
            parameters.Add(SQL.IncludeArchived, criteria.IncludeArchived, DbType.Boolean);
            parameters.Add(SQL.Rows, criteria.Rows, DbType.Int32);
            parameters.Add(SQL.Page, criteria.Page, DbType.Int32);

            using (var con = new SqlConnection(GetBaseConnection()))
            {
                using (var response = con.QueryMultiple(
                    SQL.GetWorldCupPlayer,
                    parameters,
                    commandType: CommandType.StoredProcedure))
                {
                    return response.Read<WorldCupPlayer>().AsList();
                }
            }
        }

        #endregion
    }
}
