using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Web.Http;

namespace BurialPlots.Controllers
{
    public class BurialPlotsEmailsController : ApiController
    {
        [HttpGet]
        public void SendEmail(string Body, string Subject, string toEmail, string fromEmail, string Password, string ssl, string MailHost, string Port)
        {
            var message = new MailMessage();
            message.To.Add(toEmail);
            message.From = new MailAddress(fromEmail);  // replace with valid value
            message.Subject = Subject;
            message.IsBodyHtml = true;
            message.Body = Body;
            message.Priority = MailPriority.Normal;
            var smtp = new SmtpClient();
            smtp.Credentials = new NetworkCredential(fromEmail, Password);
            smtp.Host = MailHost;
            smtp.Port = Convert.ToInt32(Port);
            smtp.EnableSsl = Convert.ToBoolean(ssl);
            smtp.Send(message);
        }
    }
}
