namespace Cricket.Data.Constants
{
    /// <summary>
    /// Class to hold SQL constants
    /// </summary>
    public class SQL
    {
        #region SQL Parameters

        public const string Rows = "@Rows";
        public const string Page = "@Page";
        public const string UpdatedBy = "@UpdatedBy";
        public const string IncludeArchived = "@IncludeArchived";
        public const string AffectedRowCount = "@AffectedRowCount";

        public const string UserID = "@UserID";
        public const string UserName = "@UserName";
        public const string UserDisplayName = "@UserDisplayName";
        public const string UserIsAdmin = "@UserIsAdmin";

        public const string TeamID = "@TeamID";
        public const string TeamCode = "@TeamCode";

        public const string WorldCupPlayerID = "@WorldCupPlayerID";
        public const string DateOfBirthRangeBegin = "@DateOfBirthRangeBegin";
        public const string DateOfBirthRangeEnd = "@DateOfBirthRangeEnd";

        #endregion

        #region SQL Procedures

        public const string GetUser = "[dbo].[GetUser]";
        public const string SetUser = "[dbo].[SetUser]";

        public const string GetTeam = "[dbo].[GetTeam]";

        public const string GetWorldCupPlayer = "[dbo].[GetWorldCupPlayer]";

        #endregion
    }
}
