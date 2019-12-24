using System;

namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to serve some common properties to all Domain Model classes
    /// </summary>
    public class AuditBase
    {
        #region Properties

        public DateTime DateCreated { get; set; }

        public DateTime? DateUpdated { get; set; }

        public DateTime? DateArchived { get; set; }

        #endregion

        #region Extended properties

        /// <summary>
        /// Holds count of results for the query
        /// </summary>
        public int ResultCount { get; set; }

        /// <summary>
        /// Used when archiving a record
        /// </summary>
        public bool? Archive { get; set; }

        /// <summary>
        /// Required to create/update data
        /// </summary>
        public int? UpdatedBy { get; set; }

        #endregion

        #region Serialization settings

        public bool ShouldSerializeArchive()
        {
            return Archive.HasValue;
        }

        public bool ShouldSerializeUpdatedBy()
        {
            return UpdatedBy.HasValue;
        }

        #endregion
    }
}
