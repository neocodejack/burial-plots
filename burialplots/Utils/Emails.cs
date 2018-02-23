using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using BurialPlots.DAL;
using System.Web;
using System.Threading.Tasks;

namespace BurialPlots.Utils
{
    public class Email
    {
        public Task SendEmail(string email, string subject, string body)//string emailType
        {
            try
            {
                var stmp = new SmtpClient();
                var message = new MailMessage();
                if (!string.IsNullOrEmpty(email))
                {
                    string defaultemail = ConfigurationManager.AppSettings["SmtpMail"];
                    string Password = ConfigurationManager.AppSettings["SmtpPassword"].ToString();
                    string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                    string port = ConfigurationManager.AppSettings["SmtpPort"];

                    message.To.Add(email);
                    message.From = new MailAddress(defaultemail);  // replace with valid value
                    message.Subject = subject;
                    message.IsBodyHtml = true;
                    message.Body = body; //"Dear ,<br /><br />Thank you for creating your account on GettingGifty.<br/>please click the link below to verify your email. <br/><br/><br/><br/>Cheers!<br/>GettingGifty.<br/> ";
                    message.Priority = MailPriority.Normal;


                    stmp.Credentials = new NetworkCredential(defaultemail, Password);
                    stmp.Host = MailHostServer;
                    stmp.Port = Convert.ToInt32(port);
                    stmp.EnableSsl = true;

                }
                return stmp.SendMailAsync(message);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Task<bool> SendEmail(string email, string subject, string body, List<string> attachments)//string emailType
        {
            try
            {
                var stmp = new SmtpClient();
                var message = new MailMessage();
                if (!string.IsNullOrEmpty(email))
                {
                    string defaultemail = ConfigurationManager.AppSettings["SmtpMail"];
                    string Password = ConfigurationManager.AppSettings["SmtpPassword"].ToString();
                    string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                    string port = ConfigurationManager.AppSettings["SmtpPort"];
                    foreach (var item in attachments)
                    {
                        message.Attachments.Add(new System.Net.Mail.Attachment(item));
                    }
                    message.To.Add(email);
                    message.From = new MailAddress(defaultemail);  // replace with valid value
                    message.Subject = subject;
                    message.IsBodyHtml = true;
                    message.Body = body; //"Dear ,<br /><br />Thank you for creating your account on GettingGifty.<br/>please click the link below to verify your email. <br/><br/><br/><br/>Cheers!<br/>GettingGifty.<br/> ";
                    message.Priority = MailPriority.Normal;


                    stmp.Credentials = new NetworkCredential(defaultemail, Password);
                    stmp.Host = MailHostServer;
                    stmp.Port = Convert.ToInt32(port);
                    stmp.EnableSsl = true;

                }
                return Task.Run(() =>
                {
                    stmp.SendMailAsync(message);
                    return true;
                });

            }
            catch (Exception ex)
            {
                return Task.Run(() =>
                {
                    return false;
                });

            }
        }

        //send submit ticket mail
        public Task<bool> SendEmail(string subject, string body, string attachment, string ticketNmber)//string emailType
        {
            try
            {

                var stmp = new SmtpClient();
                var message = new MailMessage();
                string emailto = ConfigurationManager.AppSettings["CareersEmail"];
                string ccEmail = ConfigurationManager.AppSettings["CareersCCEmail"];
                string bccEmail = ConfigurationManager.AppSettings["CareersBCCEmail"];

                if (!string.IsNullOrEmpty(emailto))
                {
                    string defaultemail = ConfigurationManager.AppSettings["SmtpMail"];
                    string Password = ConfigurationManager.AppSettings["SmtpPassword"].ToString();
                    string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                    string port = ConfigurationManager.AppSettings["SmtpPort"];
                    message.Attachments.Add(new System.Net.Mail.Attachment(attachment));

                    message.To.Add(emailto);
                    message.CC.Add(ccEmail);
                    message.Bcc.Add(bccEmail);
                    message.From = new MailAddress(defaultemail);  // replace with valid value
                    message.Subject = subject + ticketNmber;
                    message.IsBodyHtml = true;
                    message.Body = body; //"Dear ,<br /><br />Thank you for creating your account on GettingGifty.<br/>please click the link below to verify your email. <br/><br/><br/><br/>Cheers!<br/>GettingGifty.<br/> ";
                    message.Priority = MailPriority.Normal;


                    stmp.Credentials = new NetworkCredential(defaultemail, Password);
                    stmp.Host = MailHostServer;
                    stmp.Port = Convert.ToInt32(port);
                    stmp.EnableSsl = true;

                }
                return Task.Run(() =>
                {
                    stmp.SendMailAsync(message);
                    return true;
                });
            }
            catch (Exception ex)
            {
                return Task.Run(() =>
                {
                    return false;
                }
                    );

            }
        }

    }
}