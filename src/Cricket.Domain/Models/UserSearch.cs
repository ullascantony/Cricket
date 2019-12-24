namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to map criteria for Team data searches
    /// </summary>
    public class UserSearch : SearchBase
    {
        #region Properties

        public int? UserID { get; set; }

        public string UserName { get; set; }

        public bool? UserIsAdmin { get; set; }

        #endregion

        #region Serialization settings

        public bool ShouldSerializeUserID()
        {
            return UserID.HasValue;
        }

        public bool ShouldSerializeUserName()
        {
            return !string.IsNullOrWhiteSpace(UserName);
        }

        public bool ShouldSerializeUserIsAdmin()
        {
            return UserIsAdmin.HasValue;
        }

        #endregion
    }
}
