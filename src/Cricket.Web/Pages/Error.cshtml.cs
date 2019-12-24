using System;
using System.Diagnostics;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Cricket.Web.Pages
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class ErrorModel : PageModel
    {
        #region Properties

        public string RequestId { get; set; }

        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);

        public int HttpStatusCode { get; private set; }

        public string HttpStatusMessage { get; private set; }

        public Exception Error { get; private set; }

        public bool ShowException => HttpStatusCode == 500;

        #endregion

        #region Constructors

        public ErrorModel(IHttpContextAccessor contextAccessor)
        {
            HttpStatusCode = contextAccessor.HttpContext.Response.StatusCode;
            switch (HttpStatusCode)
            {
                case 400:
                    HttpStatusMessage = "bad request: The request cannot be fulfilled due to bad syntax";
                    break;
                case 403:
                    HttpStatusMessage = "Forbidden";
                    break;
                case 404:
                    HttpStatusMessage = "Page not found";
                    break;
                case 408:
                    HttpStatusMessage = "The server timed out waiting for the request";
                    break;
                default:
                    HttpStatusMessage = "That's odd... Something unexpected happened";
                    break;
            }

            var exceptionFeature = contextAccessor.HttpContext.Features.Get<IExceptionHandlerFeature>();
            if (exceptionFeature != null)
            {
                Error = exceptionFeature.Error;
            }
        }

        #endregion

        #region Handler methods

        public void OnGet()
        {
            RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier;
        }

        #endregion
    }
}
