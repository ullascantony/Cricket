using System.Collections.Generic;

using Cricket.Domain.Models;

namespace Cricket.Domain.Interfaces
{
    /// <summary>
    /// Interface to model World Cup Player Data
    /// </summary>
    public interface IWorldCupPlayerDataService
    {
        #region Methods

        /// <summary>
        /// Search World Cup Players based on passed in criteria
        /// </summary>
        /// <param name="criteria">World Cup Player Search object</param>
        /// <returns>List of World Cup Players</returns>
        List<WorldCupPlayer> SearchWorldCupPlayers(WorldCupPlayerSearch criteria);

        #endregion
    }
}
