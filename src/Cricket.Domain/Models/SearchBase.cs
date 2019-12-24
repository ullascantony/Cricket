namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to serve some common properties to all Search classes
    /// </summary>
    public class SearchBase
    {
        #region Properties

        public int? Rows { get; set; }

        public int? Page { get; set; }

        public bool? IncludeArchived { get; set; }

        #endregion

        #region Serialization settings

        public bool ShouldSerializeRows()
        {
            return Rows.HasValue;
        }

        public bool ShouldSerializePage()
        {
            return Page.HasValue;
        }

        public bool ShouldSerializeIncludeArchived()
        {
            return IncludeArchived.HasValue;
        }

        #endregion
    }
}
