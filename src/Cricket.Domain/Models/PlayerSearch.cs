namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to map criteria for Team data searches
    /// </summary>
    public class PlayerSearch : TeamSearch
    {
        #region Properties

        public int? PlayerID { get; set; }

        #endregion

        #region Serialization settings

        public bool ShouldSerializePlayerID()
        {
            return PlayerID.HasValue;
        }

        #endregion
    }
}
