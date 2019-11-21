
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
	public class usersController : BaseController
    {
		// GET: users
		public ActionResult Index()
		{
			return View();
		}


		#region list users
	
		[HttpPost]

		private void SendEMail(string emailid, string subject, string body)
		{
			System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
			client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
			client.EnableSsl = true;
			client.Host = "smtp.gmail.com";
			client.Port = 587;


			System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("prsappreply@gmail.com", "Mutheiwana27");
			client.UseDefaultCredentials = false;
			client.Credentials = credentials;

			System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
			msg.From = new MailAddress("prsappreply@gmail.com");
			msg.To.Add(new MailAddress(emailid));

			msg.Subject = subject;
			msg.IsBodyHtml = true;
			msg.Body = body;

			client.Send(msg);
		}

		public ActionResult GridViewPartial()
		{
            var model = GetUser();
			return PartialView("_GridViewPartial", model.ToList());
		}


		#endregion



        private List<UserDto> GetUser()
        {

            List<UserDto> users = new List<UserDto>();

            string constr = connectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT Id, Email, EmailConfirmed,Password,PhoneNumber,TempPassword,UserName FROM User";
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            users.Add(new UserDto
                            {
                                Id = Guid.Parse((sdr["Id"]).ToString()),
                                Email = sdr["Email"].ToString(),
                               // EmailConfirmed = bool.Parse(sdr["EmailConfirmed"].ToString()),
                               // Password = sdr["Password"].ToString(),
                                PhoneNumber = sdr["PhoneNumber"].ToString(),
                               // TempPassword = sdr["TempPassword"].ToString(),
                                UserName = sdr["UserName"].ToString(),
                            });
                        }
                    }
                    con.Close();
                }
            }

            return users.ToList();

        }

     
	}


}