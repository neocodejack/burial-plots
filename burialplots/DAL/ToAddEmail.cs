using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.DAL
{
    public class ToAddEmail
    {
        public static List<AdministrativeEmail> ToAddEmails ()
        {
            var email = new AddAdministrativeEmailRepository().GetAll().OrderByDescending(x=>x.Id).ToList();
            return email;
        }
    }
}