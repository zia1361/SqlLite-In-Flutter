using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyBeta.Modals
{
    public class SubmissionValueInfo
    {
        public int Id { get; set; }
        public int SubmissionId { get; set; }
        public string QuestionText { get; set; }
        public string AnswerText { get; set; }
    }
}