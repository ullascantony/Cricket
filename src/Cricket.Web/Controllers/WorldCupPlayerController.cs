using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

using Cricket.Domain.Interfaces;
using Cricket.Domain.Models;

namespace Cricket.Web.Controllers
{
    [Route("api/[controller]")]
    public class WorldCupPlayerController : BaseController
    {
        #region Members

        private readonly ITeamDataService TeamDataService;

        private readonly IWorldCupPlayerDataService WorldCupPlayerDataService;

        #endregion

        #region Constructors

        public WorldCupPlayerController(
            IConfiguration configuration,
            IHttpContextAccessor contextAccessor,
            IMemoryCache cache,
            ILogger<WorldCupPlayerController> logger,
            IUserDataService userDataService,
            ITeamDataService teamDataService,
            IWorldCupPlayerDataService worldCupPlayerDataService) : base(configuration, contextAccessor, cache, logger, userDataService)
        {
            CheckUserAccess();

            TeamDataService = teamDataService;
            WorldCupPlayerDataService = worldCupPlayerDataService;
        }

        #endregion

        #region Action methods

        /// <summary>
        /// Search World Cup Players based on passed in criteria
        /// </summary>
        /// <param name="criteria">World Cup Player Search object</param>
        /// <returns>List of World Cup Players</returns>
        /// <sample>POST api/WorldCupPlayer/Search</sample>
        [HttpPost("[action]")]
        public IEnumerable<WorldCupPlayer> Search([FromBody] WorldCupPlayerSearch criteria)
        {
            LogInformation($"Searching World Cup Players for criteria: {JsonSerialize(criteria)}");

            if(criteria == null)
            {
                throw new InvalidOperationException("Criteria cannot be null");
            }

            return WorldCupPlayerDataService.SearchWorldCupPlayers(criteria);
        }

        /// <summary>
        /// Get World Cup Player Chart data
        /// </summary>
        /// <returns>World Cup Player Chart data object</returns>
        /// <sample>GET api/WorldCupPlayer/ChartData</sample>
        [HttpGet("[action]")]
        public WorldCupPlayerChartData ChartData()
        {
            var teams = TeamDataService.SearchTeams(new TeamSearch { Rows = 100 });
            var worldCupPlayers = WorldCupPlayerDataService.SearchWorldCupPlayers(new WorldCupPlayerSearch { Rows = 500 });

            var teamNames = new List<string>();
            teamNames.AddRange(teams.Select(team => team.TeamName));

            var teamPrimaryColours = new List<string>();
            teamPrimaryColours.AddRange(teams.Select(team => $"#{team.TeamColourPrimary}"));

            var teamSecondaryColours = new List<string>();
            teamSecondaryColours.AddRange(teams.Select(team => $"#{team.TeamColourSecondary}"));

            var teamPlayerCounts = new List<int>();
            foreach (var team in teams)
            {
                teamPlayerCounts.Add(worldCupPlayers.Where(player => player.TeamID == team.TeamID).Count());
            }

            return new WorldCupPlayerChartData
            {
                TeamNames = teamNames,
                TeamPlayerCounts = teamPlayerCounts,
                TeamPrimaryColours = teamPrimaryColours,
                TeamSecondaryColours = teamSecondaryColours
            };
        }

        #endregion
    }
}
