using System;
using System.Collections.Generic;
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
    public class TeamController : BaseController
    {
        #region Members

        private readonly ITeamDataService TeamDataService;

        #endregion

        #region Constructors

        public TeamController(
            IConfiguration configuration,
            IHttpContextAccessor contextAccessor,
            IMemoryCache cache,
            ILogger<TeamController> logger,
            IUserDataService userDataService,
            ITeamDataService teamDataService) : base(configuration, contextAccessor, cache, logger, userDataService)
        {
            CheckUserAccess();

            TeamDataService = teamDataService;
        }

        #endregion

        #region Action methods

        /// <summary>
        /// Search Teams based on passed in criteria
        /// </summary>
        /// <param name="criteria">Team Search object</param>
        /// <returns>List of Teams</returns>
        /// <sample>POST api/Team/Search</sample>
        [HttpPost("[action]")]
        public IEnumerable<Team> Search([FromBody] TeamSearch criteria)
        {
            LogInformation($"Searching Users for criteria: {JsonSerialize(criteria)}");

            if (criteria == null)
            {
                throw new InvalidOperationException("Criteria cannot be null");
            }

            return TeamDataService.SearchTeams(criteria);
        }

        #endregion
    }
}
