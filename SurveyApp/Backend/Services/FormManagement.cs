using SurveyBeta.Modals;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SurveyBeta.DB;

namespace SurveyBeta.Services
{
    public class FormManagement
    {
        public void SubmitForm(FormSubmissionInfo oSubmission)
        {
            try
            {
                using (DataClasses1DataContext eDataBase = new DataClasses1DataContext())
                {
                    FormSubmission eSubmission = new FormSubmission();
                    eSubmission.DeviceId = oSubmission.DeviceId;
                    eSubmission.SubmittedOn = oSubmission.SubmittedOn;
                    eSubmission.SyncedOn = oSubmission.SyncedOn;
                    eSubmission.FormId = oSubmission.FormId;
                    eSubmission.IsActive = true;
                    eSubmission.IsDeleted = false;
                    eDataBase.FormSubmissions.InsertOnSubmit(eSubmission);
                    eDataBase.SubmitChanges();
                    oSubmission.Id = eSubmission.Id;
                    foreach (var oValue in oSubmission.oValues)
                    {
                        FormSubmissionValue eValue = new FormSubmissionValue();
                        eValue.SubmissionId = eSubmission.Id;
                        eValue.QuestionText = oValue.QuestionText;
                        eValue.AnswerText = oValue.AnswerText;
                        eDataBase.FormSubmissionValues.InsertOnSubmit(eValue);
                        eDataBase.SubmitChanges();
                        oValue.Id = eValue.Id;
                    }
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }
        public void SubmitForms(List<FormSubmissionInfo> oSubmissions)
        {
            try
            {
                using (DataClasses1DataContext eDataBase = new DataClasses1DataContext())
                {
                    foreach (var oSubmission in oSubmissions)
                    {
                        FormSubmission eSubmission = new FormSubmission();
                        eSubmission.DeviceId = oSubmission.DeviceId;
                        eSubmission.SubmittedOn = oSubmission.SubmittedOn;
                        eSubmission.SyncedOn = oSubmission.SyncedOn;
                        eSubmission.FormId = oSubmission.FormId;
                        eSubmission.IsActive = true;
                        eSubmission.IsDeleted = false;
                        eDataBase.FormSubmissions.InsertOnSubmit(eSubmission);
                        eDataBase.SubmitChanges();
                        oSubmission.Id = eSubmission.Id;
                        foreach (var oValue in oSubmission.oValues)
                        {
                            FormSubmissionValue eValue = new FormSubmissionValue();
                            eValue.SubmissionId = eSubmission.Id;
                            eValue.QuestionText = oValue.QuestionText;
                            eValue.AnswerText = oValue.AnswerText;
                            eDataBase.FormSubmissionValues.InsertOnSubmit(eValue);
                            eDataBase.SubmitChanges();
                            oValue.Id = eValue.Id;
                        }
                    }
                    
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }
    }
}