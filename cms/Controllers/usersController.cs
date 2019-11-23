
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

        #region userroles
        [ValidateInput(false)]
        public ActionResult UserRolesPartial(string UserId)
        {
            var model = GetUserRolesDto(UserId);
            return PartialView("_UserRoles", model.ToList());
        }


        private List<UserRolesDto> GetUserRolesDto(string userId)
        {
           
            List<UserRolesDto> roles = new List<UserRolesDto>();

            string constr = connectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT rr.ObjId as UserRoleId, rl.Name as Rolename, ss.Id as userId,rl.Id as RoleId from UserRole rr JOIN User ss on rr.UserId = ss.Id JOIN Role rl on rr.RoleId = rl.Id  where ss.Id='" + userId + "'";

                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            roles.Add(new UserRolesDto
                            {
                                ObjId = Guid.Parse((sdr["UserRoleId"]).ToString()),
                                RoleName = sdr["Rolename"].ToString(),
                                // EmailConfirmed = bool.Parse(sdr["EmailConfirmed"].ToString()),
                                // Password = sdr["Password"].ToString(),
                                RoleId = sdr["RoleId"].ToString(),
                                // TempPassword = sdr["TempPassword"].ToString(),
                                UserId = sdr["userId"].ToString(),
                            });
                        }
                    }
                    con.Close();
                }
            }


            return roles.ToList();
        }


        private List<UserRolesDto> GetUserRolesNewDto()
        {

            List<UserRolesDto> roles = new List<UserRolesDto>();

            string constr = connectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT rr.ObjId as UserRoleId, rl.Name as Rolename, ss.Id as userId,rl.Id as RoleId from UserRole rr JOIN User ss on rr.UserId = ss.Id JOIN Role rl on rr.RoleId = rl.Id";

                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            roles.Add(new UserRolesDto
                            {
                                ObjId = Guid.Parse((sdr["UserRoleId"]).ToString()),
                                RoleName = sdr["Rolename"].ToString(),
                                // EmailConfirmed = bool.Parse(sdr["EmailConfirmed"].ToString()),
                                // Password = sdr["Password"].ToString(),
                                RoleId = sdr["RoleId"].ToString(),
                                // TempPassword = sdr["TempPassword"].ToString(),
                                UserId = sdr["userId"].ToString(),
                            });
                        }
                    }
                    con.Close();
                }
            }


            return roles.ToList();
        }

        public ActionResult RolesPartial()
        {
            var mymodel = GetRole();
            return PartialView(mymodel);
        }

        //Function to get a list of roles 
        private List<RoleDto> GetRoles()
        {
            var mymodel = GetRole();
            return mymodel;
        }
        public ActionResult UserRolesEditHeaderFormPartial(string ObjId)
        {
            var userRoleModal = GetUserRolesDto(ObjId).Where(c => c.UserId.ToString() == ObjId).SingleOrDefault();

            //this will pass a list of roles to the front end
            ViewData["Roles"] = GetRoles();
            if (userRoleModal == null)
            {
                return PartialView("RolesEditPartialFormView", new UserRolesDto());
            }

            var model = GetUserRolesNewDto();

            return PartialView("RolesEditPartialFormView", model);

        }


        [HttpPost, ValidateInput(true)]
        public ActionResult UserRolesPartialAddNew(UserRolesDto item)
        {
            //var model = db.UserRoles;

            //if (ModelState.IsValid)
            //{
            //    try
            //    {
            //        // double check to ensure this new Id generated does not exist
            //        var userRole = db.UserRoles.Where(c => c.ObjId == item.ObjId).SingleOrDefault();

            //        // 1 get roleId, userid we want to insert
            //        // 2 query the userroles on the 2 values
            //        // only if we get nothing - .Any() is false, then can we insert.
            //        // if we find a record, return ViewData["EditError"] = "Role Already exists for User";

            //        var currentUserRoleToAddExists = db.UserRoles.Where(c => c.RoleId == item.RoleId && c.UserId == item.UserId).Any();

            //        if (userRole == null && currentUserRoleToAddExists == false)
            //        {
            //            var userR = new UserRole()
            //            {
            //                ObjId = item.ObjId,
            //                UserId = item.UserId,
            //                RoleId = item.RoleId
            //            }; ;

            //            userR.UserId = item.UserId;
            //            userR.RoleId = item.RoleId;
            //            model.Add(userR);
            //            db.SaveChanges();
            //        }
            //        else
            //        {
            //            if (currentUserRoleToAddExists == false)
            //                ViewData["EditError"] = "Role Already exists for User";
            //            else
            //                ViewData["EditError"] = "User Role Id Already Exist. This is not allowed on a New record. Please Contact Support.";
            //            //userRole.RoleId = item.RoleId;
            //            //model.Attach(userRole);
            //            //db.SaveChanges();
            //        }

            //    }
            //    catch (Exception e)
            //    {
            //        ViewData["EditError"] = e.Message;
            //    }
            //}
            //else
            //    ViewData["EditError"] = "Please, correct all errors.";
            //var modelReturn = GetUserRolesDto(item.UserId.ToString());
            //return PartialView("_UserRoles", modelReturn);

            return PartialView("_UserRoles");

        }

        [HttpPost, ValidateInput(true)]
        public ActionResult UserRolesGridViewPartialUpdate(UserRolesDto item)
        {
            //var model = db.UserRoles;
            //if (ModelState.IsValid)
            //{
            //    try
            //    {
            //        var userRole = db.UserRoles.Where(c => c.ObjId == item.ObjId).SingleOrDefault();

            //        if (userRole != null)
            //        {
            //            this.UpdateModel(userRole);
            //            db.SaveChanges();
            //        }

            //        else
            //        {
            //            userRole.RoleId = item.RoleId;
            //            model.Attach(userRole);
            //            db.SaveChanges();
            //            ;
            //        }
            //    }
            //    catch (Exception e)
            //    {
            //        ViewData["EditError"] = e.Message;
            //    }
            //}
            //else
            //    ViewData["EditError"] = "Please, correct all errors.";
            //var modelReturn = GetUserRolesDto(item.UserId.ToString());
            //return PartialView("_UserRoles", modelReturn);


            return PartialView("_UserRoles");
        }

        public ActionResult UserRolesGridViewPartialDelete(UserRolesDto item)
        {
            //var model = db.UserRoles;

            //if (item.ObjId != null)
            //{
            //    try
            //    {
            //        var userRole = db.UserRoles.Where(c => c.ObjId == item.ObjId).SingleOrDefault();
            //        if (userRole != null)
            //            model.Remove(userRole);
            //        db.SaveChanges();
            //    }
            //    catch (Exception e)
            //    {
            //        ViewData["EditError"] = e.Message;
            //    }
            //}

            //var modelReturn = GetUserRolesDto(item.UserId.ToString());
            //return PartialView("_UserRoles", modelReturn);



            return PartialView("_UserRoles");
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


        private List<RoleDto> GetRole()
        {

            List<RoleDto> users = new List<RoleDto>();

            string constr = connectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT Id, Name FROM Role";
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            users.Add(new RoleDto
                            {
                                Id = Guid.Parse((sdr["Id"]).ToString()),
                                Name = sdr["Name"].ToString()
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