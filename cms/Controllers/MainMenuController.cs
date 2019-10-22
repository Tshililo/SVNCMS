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

        public ActionResult SavePayments(string PeopleId, string numberofplates, string emailId = "", string phoneNo = "")
        {
            insert(PeopleId, numberofplates, emailId, phoneNo);

            return PartialView("CreateMainMenuEditPartial");

        
        }

        public void SendSMS(string PhoneNo, String RefNo)
        {
            string to, msg;
            msg = "";
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

        private void SendEmail(string EmailAddress , string RefNo )
        {
            MailMessage Msg = new MailMessage();
            // Sender e-mail address.
            Msg.From = new MailAddress("ubachefnoreply@gmail.com");
            // Recipient e-mail address.
            Msg.To.Add(EmailAddress);
            Msg.Subject = "Dear Client";
            Msg.Body = "Kindly Receive Proof of Booking your Reference No: " + RefNo + "";
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

        private string insert(string PeopleId, string numberofplates, string emailId = "", string phoneNo = "")
        {
            try
            {
                Guid ObjId = Guid.NewGuid();
                string NoOfPeople = PeopleId;
                string NoOfPlates = numberofplates;
                string Date = DateTime.Now.ToString();

                string RefNo = "Uba - " + RandomString(9, false);

                string FNUmber = ReplaceLastOccurrence(phoneNo, "0", "+27") +",";

                //This is my insert query in which i am taking input from the user through windows forms  
                string Query = "insert into ubachef.Payments(ObjId,NoOfPeople,NoOfPlates,Date,RefNo) values('" + ObjId + "','" + NoOfPeople + "','" + NoOfPlates + "','" + Date + "','" + RefNo + "');";
                //This is  MySqlConnection here i have created the object and pass my connection string.  
                MySqlConnection MyConn2 = new MySqlConnection(gg.MyConnection2);
                //This is command class which will handle the query and connection object.  
                MySqlCommand MyCommand2 = new MySqlCommand(Query, MyConn2);
                MySqlDataReader MyReader2;
                MyConn2.Open();
                MyReader2 = MyCommand2.ExecuteReader();     // Here our query will be executed and data saved into the database.  
               
                while (MyReader2.Read())
                {
                    return "Procord Not Processed";
                }
                MyConn2.Close();


                SendEmail(emailId, RefNo);
                return "Procord Processed";
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }


        }
      
        }
}
