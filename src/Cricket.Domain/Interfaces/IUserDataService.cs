using System.Collections.Generic;

using Cricket.Domain.Models;

namespace Cricket.Domain.Interfaces
{
    /// <summary>
    /// Interface to model User Data
    /// </summary>
    public interface IUserDataService
    {
        #region Methods

        /// <summary>
        /// Get User matching passed in ID
        /// </summary>
        /// <param name="userId">User ID</param>
        /// <returns>User object</returns>
        User GetUserByID(int userId);

        /// <summary>
        /// Get User matching passed in User Name
        /// </summary>
        /// <param name="userName">User Name</param>
        /// <returns>User object</returns>
        User GetUserByUserName(string userName);

        /// <summary>
        /// Search Users based on passed in criteria
        /// </summary>
        /// <param name="criteria">User Search object</param>
        /// <returns>List of Users</returns>
        List<User> SearchUsers(UserSearch criteria);

        /// <summary>
        /// Create a new User
        /// </summary>
        /// <param name="user">User object</param>
        /// <returns>Newly created User ID</returns>
        int CreateUser(User user);

        /// <summary>
        /// Update an existing User
        /// </summary>
        /// <param name="user">User object</param>
        /// <returns>Affected row count</returns>
        int UpdateUser(User user);

        #endregion
    }
}
