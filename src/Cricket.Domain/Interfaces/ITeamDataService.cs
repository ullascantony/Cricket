using System.Collections.Generic;

using Cricket.Domain.Models;

namespace Cricket.Domain.Interfaces
{
    /// <summary>
    /// Interface to model Team Data
    /// </summary>
    public interface ITeamDataService
    {
        #region Methods

        /// <summary>
        /// Search Teams based on passed in criteria
        /// </summary>
        /// <param name="criteria">Team Search object</param>
        /// <returns>List of Teams</returns>
        List<Team> SearchTeams(TeamSearch criteria);

        #endregion
    }
}
