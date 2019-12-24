using System;

namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to map data from database table [dbo].[Player]
    /// </summary>
    public class Player : Team
    {
        #region Properties

        public int PlayerID { get; set; }

        public string GivenName { get; set; }

        public string OtherGivenNames { get; set; }

        public string FamilyName { get; set; }

        public DateTime DateOfBirth { get; set; }

        #endregion
    }
}
