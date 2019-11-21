
using DevExpress.Web.Mvc;
using cms;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using cms.Models;
using MySql.Data.MySqlClient;

namespace cms.Controllers
{
	//   [Authorize]
	public class BookingController : BaseController
    {
		// GET: users
		public ActionResult Index()
		{
			return View();
		}


		#region list users
	
		
		public ActionResult GridViewPartial()
		{
            var model = GetBooking();
			return PartialView("_GridViewPartial", model.ToList());
		}


        #endregion


        public ActionResult AcceptRequest(string ObjId)
        {
            UpdateRecord(ObjId);

            var model = GetBooking();

            return PartialView("_GridViewPartial", model.ToList());

        }
        
        public void UpdateRecord(string ObjId)
        {
            try
            {

                MySqlConnection MyConn2 = new MySqlConnection(connectionString);
                string query = "UPDATE Booking SET Accepted=@Accepted WHERE ObjId =@ObjId";
                MyConn2.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@ObjId", ObjId);
                cmd.Parameters.AddWithValue("@Accepted", "Yes");
                cmd.Connection = MyConn2;
                cmd.ExecuteNonQuery();
                MyConn2.Close();
       

            }
            catch (Exception)
            {

                throw;
            }


        }


        private List<BookingsDto> GetBooking()
        {

            List<BookingsDto> Bookings = new List<BookingsDto>();

            string constr = connectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT ObjId, email, EventsType,occasion,FromTime,ToTime,RequestDate,Accepted FROM Booking";

                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            Bookings.Add(new BookingsDto
                            {
                                ObjId = Guid.Parse((sdr["ObjId"]).ToString()),
                                email = sdr["email"].ToString(),
                                EventsType = sdr["EventsType"].ToString(),
                                occasion = sdr["occasion"].ToString(),
                                FromTime = sdr["FromTime"].ToString(),
                                ToTime = sdr["ToTime"].ToString(),
                                RequestDate = sdr["RequestDate"].ToString(),
                                Accepted = sdr["Accepted"].ToString()
                            });
                        }
                    }
                    con.Close();
                }
            }

            return Bookings.ToList();

        }

     
	}


}