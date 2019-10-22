using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using cms;
using cms.Models;
using MySql.Data.MySqlClient;

namespace cms.Controllers
{
  //  [Authorize]
    public class MainMenuController : BaseController
    {
        BaseController gg = new BaseController();
        // GET: Cemeteries
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetEdit()
        {
            OnSiteVisitDto model = new OnSiteVisitDto();
            return PartialView("CreateMainMenuEditPartial", model);

        }

        public ActionResult SavePayments(string PeopleId, string numberofplates, string emailId = "", string phoneNo = "", string Occasionvalue = "", string EventsType = "")
        {
            insert(PeopleId, numberofplates, emailId, phoneNo, Occasionvalue);

            return PartialView("CreateMainMenuEditPartial");

        
        }

        public void SendSMS(string PhoneNo, string RefNo, string Occasionvalue = "", string EventsType = "")
        {
            string to, msg;
            msg = "Dear Customer. You have Booked a Chef for Occasion: " + Occasionvalue + " for " + EventsType + " Event" + RefNo + ""; ;
            to = PhoneNo;
            WebClient client = new WebClient();
            // Add a user agent header in case the requested URI contains a query.
            client.Headers.Add("user-agent", "Mozilla/4.0(compatible; MSIE 6.0; Windows NT 5.2; .NET CLR1.0.3705;)");
            client.QueryString.Add("user", "RomeoMulaudzi");
            client.QueryString.Add("password", "dAAdJKAHTfOJYc");
            client.QueryString.Add("api_id", "3546405");
            client.QueryString.Add("to", to);
            client.QueryString.Add("text", msg);
            string baseurl = "http://api.clickatell.com/http/sendmsg";
            Stream data = client.OpenRead(baseurl);
            StreamReader reader = new StreamReader(data);
            string s = reader.ReadToEnd();
            //data.Close();
            reader.Close();

        }

        private void SendEmail(string EmailAddress , string RefNo, string Occasionvalue = "", string EventsType = "")
        {
            MailMessage Msg = new MailMessage();
            // Sender e-mail address.
            Msg.From = new MailAddress("ubachefnoreply@gmail.com");
            // Recipient e-mail address.
            Msg.To.Add(EmailAddress);
            Msg.Subject = "Dear Client";
            Msg.Body = "You have Booked a Chef for Occasion: " + Occasionvalue + " for "  + EventsType + " Event" + RefNo + "";
            Msg.IsBodyHtml = true;
            // your remote SMTP server IP.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("ubachefnoreply@gmail.com", "ubachefnoreply27");
            smtp.EnableSsl = true;
            smtp.Send(Msg);
        }

        public static string ReplaceLastOccurrence(string Source, string Find, string Replace)
        {
            int Place = Source.LastIndexOf(Find);
            string result = Source.Remove(Place, Find.Length).Insert(Place, Replace);
            return result;
        }

        private string insert(string PeopleId, string numberofplates, string emailId = "", string phoneNo = "", string Occasionvalue = "", string EventsType = "")
        {
            try
            {
                Guid ObjId = Guid.NewGuid();
                string NoOfPeople = PeopleId;
                string NoOfPlates = numberofplates;
                string Date = DateTime.Now.ToString();
                string occasionvalue = Occasionvalue;
                string RefNo = "Uba - " + RandomString(9, false);
                string Eventstype = EventsType;
                string FNUmber = ReplaceLastOccurrence(phoneNo, "0", "+27") +",";

                //This is my insert query in which i am taking input from the user through windows forms  
                string Query = "insert into ubachef.Payments(ObjId,NoOfPeople,NoOfPlates,Date,RefNo,emailId,phoneNo,Occasion,EventsType) values('" + ObjId + "','" + 
                    NoOfPeople + "','" + NoOfPlates + "','" + Date + "','" + RefNo + "','" + emailId + "','" + FNUmber + "','" + occasionvalue + "','" + EventsType + "');";
                MySqlConnection MyConn2 = new MySqlConnection(gg.MyConnection2);
                MySqlCommand MyCommand2 = new MySqlCommand(Query, MyConn2);
                MySqlDataReader MyReader2;
                MyConn2.Open();
                MyReader2 = MyCommand2.ExecuteReader();     // Here our query will be executed and data saved into the database.  
               
                while (MyReader2.Read())
                {
                    return "Procord Not Processed";
                }
                MyConn2.Close();


                SendEmail(emailId, RefNo, occasionvalue, Eventstype);
                SendSMS(emailId, RefNo, occasionvalue, Eventstype);
                return "Procord Processed";
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }


        }
      
        }
}
