namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to map criteria for Team data searches
    /// </summary>
    public class TeamSearch : SearchBase
    {
        #region Properties

        public int? TeamID { get; set; }

        public string TeamCode { get; set; }

        #endregion

        #region Serialization settings

        public bool ShouldSerializeTeamID()
        {
            return TeamID.HasValue;
        }

        public bool ShouldSerializeTeamCode()
        {
            return !string.IsNullOrWhiteSpace(TeamCode);
        }

        #endregion
    }
}
