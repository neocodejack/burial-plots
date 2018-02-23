using System;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web.Script.Serialization;
using System.Text.RegularExpressions;

namespace BurialPlots.Utills
{
    public static class Numerics
    {
        public static int GetInt(object input)
        {
            if (input == null || input + "" == "") return 0;
            try
            {
                return Convert.ToInt32(input);
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static bool GetBool(object input)
        {
            if (input == null || input + "" == "") return false;
            try
            {
                return Convert.ToBoolean(input);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static decimal Getdecimal(object input)
        {
            if (input == null || input + "" == "") return 0;
            try
            {
                return Convert.ToDecimal(input);
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static string GetDate(DateTime dt)
        {

            var ts = new TimeSpan(DateTime.Now.Ticks - dt.Ticks);
            double delta = Math.Abs(ts.TotalSeconds);

            if (delta < 60)
            {
                return ts.Seconds == 1 ? "one sec ago" : ts.Seconds
                + " seconds ago";
            }
            if (delta < 120)
            {
                return "a min ago";
            }
            if (delta < 2700) // 45 * 60
            {
                return ts.Minutes + " min ago";
            }
            if (delta < 5400) // 90 * 60
            {
                return "an hour ago";
            }
            if (delta < 86400)
            { // 24 * 60 * 60
                return ts.Hours + " hours ago";
            }
            if (delta < 172800)
            { // 48 * 60 * 60
                return "yesterday";
            }
            if (delta < 2592000)
            { // 30 * 24 * 60 * 60
                return ts.Days + " days ago";
            }
            if (delta < 31104000)
            { // 12 * 30 * 24 * 60 * 60
                int months = Convert.ToInt32(Math.Floor((double)ts.Days / 30));
                return months <= 1 ? "one month ago" : months + " months ago";
            }
            int years = Convert.ToInt32(Math.Floor((double)ts.Days / 365));
            return years <= 1 ? "one year ago" : years + " years ago";
        }

        public static string AddComas(string data)
        {
            try
            {
                data = ReverseString(data);
                char[] value = data.ToArray();
                int strLength = data.Length;
                string tempaar = "";

                for (int i = strLength; i > 0; i--)
                {
                    if (i % 3 == 0 && i != strLength)
                    {
                        tempaar += ",";
                        tempaar += value[i - 1].ToString();
                    }
                    else
                    {
                        tempaar += value[i - 1].ToString();
                    }
                }

                return tempaar;
            }
            catch (Exception)
            {
                return "";
            }
        }
        public static string ReverseString(string s)
        {
            char[] arr = s.ToCharArray();
            Array.Reverse(arr);
            return new string(arr);
        }

        public static string GetRandomString()
        {
            string path = Path.GetRandomFileName();
            path = path.Replace(".", ""); // Remove period.
            return path;
        }

        public static DateTime ConvertDateTime(string date)
        {
    //        DateTime date2 = Convert.ToDateTime(dateString,
    //System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);

            var datetime = DateTime.ParseExact(date, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            return datetime;
        }


        public static DateTime ConvertDateFromddMMyyyy(string date_in_ddMMyyyy)
        {
            DateTime dt = DateTime.ParseExact(date_in_ddMMyyyy, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            return dt;
        }

        public static DateTime ConvertDateFromddMMyyyyDashed(string date_in_ddMMyyyy)
        {
            DateTime dt = DateTime.ParseExact(date_in_ddMMyyyy, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            return dt;
        }

        public static DateTime ConvertToDateTimeddMMMyyyy(DateTime dt)
        {
            DateTime dt2 = DateTime.ParseExact(dt.ToString("dd/MM/yyyy"), "dd MM yyyy", CultureInfo.InvariantCulture);
            return dt2;

        }


        public static string ToJSON(this object obj)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(obj);
        }

        public static string ToJSON(this object obj, int recursionDepth)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.RecursionLimit = recursionDepth;
            return serializer.Serialize(obj);
        }

        public static string NumberToWords(int number)
        {
            if (number == 0)
                return "zero";

            if (number < 0)
                return "minus " + NumberToWords(Math.Abs(number));

            string words = "";

            if ((number / 1000000) > 0)
            {
                words += NumberToWords(number / 1000000) + " million ";
                number %= 1000000;
            }

            if ((number / 1000) > 0)
            {
                words += NumberToWords(number / 1000) + " thousand ";
                number %= 1000;
            }

            if ((number / 100) > 0)
            {
                words += NumberToWords(number / 100) + " hundred ";
                number %= 100;
            }

            if (number > 0)
            {
                if (words != "")
                    words += "and ";

                var unitsMap = new[] { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" };
                var tensMap = new[] { "zero", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety" };

                if (number < 20)
                    words += unitsMap[number];
                else
                {
                    words += tensMap[number / 10];
                    if ((number % 10) > 0)
                        words += "-" + unitsMap[number % 10];
                }
            }

            return words;
        }

       public static string FormatNumber<T>(T number, int maxDecimals = 4)
        {
            return Regex.Replace(String.Format("{0:n" + maxDecimals + "}", number),
                                 @"[" + System.Globalization.NumberFormatInfo.CurrentInfo.NumberDecimalSeparator + "]?0+$", "");
        }
    }
}
