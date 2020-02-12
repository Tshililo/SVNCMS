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
using System.Text;

namespace cms.Controllers
{
  //  [Authorize]
    public class MainMenuController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetEdit(string id)
        {
            ViewBag.CuizineType = id;
            return PartialView("CreateMainMenuEditPartial");

        }


        public ActionResult SavePayments(string PeopleId)
        {

            List<string> p = PeopleId.Split(',').ToList();
            try
            {
                string NoOfPeople = p[0];
                string Description = p[1];
                string emailId = p[2];
                string phoneNo = p[3];
                string CuisineType = p[4];
                string AddressId = p[5];
                //////////////////////////////////////////////////////////////
                string Duration = p[6];
                string TotalPriceId = p[7];
                string RequestDate = p[8];
                string NamesId = p[9];

                string fPhoneNo = phoneNo + ",";
                //////////////////////////////////////////////////////////////
                string RefNo = DateTime.Now.ToString("yyyy/MM/dd").Replace("/", "") + RandomString(4, false);

                ViewBag.RefNo = RefNo;
                insertrecords(NoOfPeople, emailId, fPhoneNo,  CuisineType, RefNo, AddressId, Duration, RequestDate, NamesId, Description, TotalPriceId);
                // SendEmail(emailId, RefNo, Occasionvalue, EventsType, CuisineType, TotalPriceId);
                SendSMS(NoOfPeople, emailId, fPhoneNo, CuisineType, RefNo, AddressId, Duration, RequestDate, NamesId, Description, TotalPriceId);

            }
            catch (Exception)
            {

                throw;
            }


            return PartialView("Payments");


        }

        // ubachefEntities db = new ubachefEntities();

        public void insertrecords(string PeopleId,  string emailId = "", string phoneNo = "",
           string CuisineType = "", string RefNo = "", string AddressId = "",
            string Duration = "", string RequestDate = "", string NamesId = "", string Description = "", string TotalPriceId = "")
        {

            try
            {
                //var model = db.bookings;

                booking Tosave = new booking();

                Tosave.ObjId = Guid.NewGuid();
                Tosave.people = PeopleId;
                Tosave.Description = Description;
                Tosave.email = emailId;
                Tosave.datecapture = DateTime.Now.ToString("yyyy/MM/dd");
                Tosave.Qualification = CuisineType;
                Tosave.phoneno = phoneNo;
                Tosave.refno = RefNo;
                Tosave.address = AddressId;
                Tosave.RequestDate = RequestDate;
                Tosave.Accepted = "No";
                Tosave.NamesId = NamesId;
                Tosave.Duration = Duration;
               
                //This is my insert query in which i am taking input from the user through windows forms  
                string Query = "insert into BookingTutor(ObjId,NoOfPeople,email,datecapture,Qualification,Description,phoneno,refno,address,Duration,RequestDate,Accepted,Names,TotalPrice) values('" +
                Tosave.ObjId + "','" + Tosave.people + "','" + Tosave.email + "','" + Tosave.datecapture 
                + "','" + Tosave.Qualification 
                + "','" + Description
                + "','" + Tosave.phoneno + "','" + Tosave.refno + "','" + Tosave.address
                + "','" + Tosave.Duration  + "','" + Tosave.RequestDate
                + "','" + Tosave.Accepted + "','" + Tosave.NamesId + "','" + TotalPriceId + "');";

                MySqlConnection MyConn2 = new MySqlConnection(connectionString);
                MySqlCommand MyCommand2 = new MySqlCommand(Query, MyConn2);
                MySqlDataReader MyReader2;
                MyConn2.Open();
                MyReader2 = MyCommand2.ExecuteReader();     // Here our query will be executed and data saved into the database.  

                MyConn2.Close();


            }
            catch (Exception)
            {

                throw;
            }


        }

        public void SendSMS(string PeopleId, string emailId = "", string phoneNo = "",
           string CuisineType = "", string RefNo = "", string AddressId = "",
            string Duration = "", string RequestDate = "", string NamesId = "", string Description = "", string TotalPriceId = "")
        {


            string to, msg;
            msg = "Dear " + NamesId + " You have Booked a Turtor for "  + "Duration of: " + Duration + " Minutes. "+"RefNo: " + RefNo + ". Amount to pay " + TotalPriceId;
            to = phoneNo;
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
            reader.Close();
            data.Close();

        }



        public static string ReplaceLastOccurrence(string Source, string Find, string Replace)
        {
            int Place = Source.LastIndexOf(Find);
            string result = Source.Remove(Place, Find.Length).Insert(Place, Replace);
            return result;
        }

        public string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }
    }
}
