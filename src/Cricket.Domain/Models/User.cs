namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to map data from database procedure [dbo].[GetUser]
    /// </summary>
    public class User : AuditBase
    {
        #region Properties

        public int UserID { get; set; }

        public string UserName { get; set; }

        public string UserDisplayName { get; set; }

        public bool UserIsAdmin { get; set; }

        #endregion
    }
}
