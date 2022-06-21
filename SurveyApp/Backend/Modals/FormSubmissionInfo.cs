using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyBeta.Modals
{
    public class FormSubmissionInfo
    {
        public int Id { get; set; }
        public string DeviceId { get; set; }
        public DateTime SubmittedOn { get; set; }
        public DateTime SyncedOn { get; set; }
        public int FormId { get; set; }
        public List<SubmissionValueInfo> oValues { get; set; }
        public bool IsError { get; set; }
        public string ErrorMessage { get; set; }
    }
}