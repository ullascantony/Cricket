using System.Collections.Generic;

namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to map data for World Cup Player Chart
    /// </summary>
    public class WorldCupPlayerChartData
    {
        #region Properties

        public List<string> TeamNames { get; set; }

        public List<string> TeamPrimaryColours { get; set; }

        public List<string> TeamSecondaryColours { get; set; }

        public List<int> TeamPlayerCounts { get; set; }

        #endregion
    }
}
