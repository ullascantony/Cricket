using System;

namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to map criteria for World Cup Player data searches
    /// </summary>
    public class WorldCupPlayerSearch : PlayerSearch
    {
        #region Properties

        public int? WorldCupPlayerID { get; set; }

        public DateTime? DateOfBirthRangeBegin { get; set; }

        public DateTime? DateOfBirthRangeEnd { get; set; }

        #endregion

        #region Serialization settings

        public bool ShouldSerializeWorldCupPlayerID()
        {
            return WorldCupPlayerID.HasValue;
        }

        public bool ShouldSerializeDateOfBirthRangeBegin()
        {
            return DateOfBirthRangeBegin.HasValue;
        }

        public bool ShouldSerializeDateOfBirthRangeEnd()
        {
            return DateOfBirthRangeEnd.HasValue;
        }

        #endregion
    }
}
