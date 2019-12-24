namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to map data from database procedure [dbo].[GetTeam]
    /// </summary>
    public class Team : AuditBase
    {
        #region Properties

        public int TeamID { get; set; }

        public string TeamCode { get; set; }

        public string TeamName { get; set; }

        public string TeamColourPrimary { get; set; }

        public string TeamColourSecondary { get; set; }

        #endregion
    }
}
