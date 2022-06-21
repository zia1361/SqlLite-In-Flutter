using SurveyBeta.Modals;
using SurveyBeta.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyBeta.Api
{
    /// <summary>
    /// Summary description for apicall
    /// </summary>
    public class apicall : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var jsonSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            jsonSerializer.MaxJsonLength = Int32.MaxValue;

            var jsonString = String.Empty;

            var methodName = Convert.ToString(context.Request.QueryString["methodName"]);
            try
            {
                #region SubmitForm
                if (methodName.ToLower() == "SubmitForm".ToLower())
                {
                    context.Request.InputStream.Position = 0;
                    using (var inputStream = new System.IO.StreamReader(context.Request.InputStream))
                    {
                        jsonString = inputStream.ReadToEnd();
                    }

                    var oSubmission = jsonSerializer.Deserialize<FormSubmissionInfo>(jsonString);
                    new FormManagement().SubmitForm(oSubmission);
                    context.Response.ContentType = "application/json";
                    context.Response.ContentEncoding = System.Text.Encoding.UTF8;
                    context.Response.Write(jsonSerializer.Serialize(oSubmission));
                    return;
                }
                #endregion

                #region SubmitForms
                if (methodName.ToLower() == "SubmitForms".ToLower())
                {
                    context.Request.InputStream.Position = 0;
                    using (var inputStream = new System.IO.StreamReader(context.Request.InputStream))
                    {
                        jsonString = inputStream.ReadToEnd();
                    }

                    var oSubmission = jsonSerializer.Deserialize<List<FormSubmissionInfo>>(jsonString);
                    new FormManagement().SubmitForms(oSubmission);
                    context.Response.ContentType = "application/json";
                    context.Response.ContentEncoding = System.Text.Encoding.UTF8;
                    context.Response.Write(jsonSerializer.Serialize(new Dictionary<string, dynamic>() { { "IsError", false }, { "ErrorMessage", "" } }));
                    return;
                }
                #endregion
            }
            catch (Exception ex)
            {

                context.Response.ContentType = "application/json";
                context.Response.ContentEncoding = System.Text.Encoding.UTF8;

                context.Response.Write(jsonSerializer.Serialize(new Dictionary<string, dynamic>() { { "IsError", true }, { "ErrorMessage", ex.Message } }));
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}