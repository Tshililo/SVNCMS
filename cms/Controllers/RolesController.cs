using DevExpress.Web.Mvc;
using cms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using cms.Models;
using MySql.Data.MySqlClient;

namespace cms.Controllers
{
   // [Authorize]
    public class RolesController : BaseController
    {
        // GET: Roles
        public ActionResult Index()
        {
            return View();
        }

        private List<RoleDto> GetRoles()
        {
            var getdate = DateTime.Now.Date;

            List<RoleDto> Bookings = new List<RoleDto>();

            string constr = connectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT Id,Name FROM Role";

                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            Bookings.Add(new RoleDto
                            {
                                Id = Guid.Parse((sdr["Id"]).ToString()),
                                Name = sdr["Name"].ToString()
                            });
                        }
                    }
                    con.Close();
                }
            }

            return Bookings.ToList();

        }

        [ValidateInput(false)]
        public ActionResult RolesGridViewPartial()
        {
            var model = GetRoles();
            return PartialView("_RolesGridViewPartial", model.ToList());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult RolesGridViewPartialAddNew(RoleDto item)
        {
            var model = GetRoles();
            if (ModelState.IsValid)
            {
                try
                {
                    var currentRolesToAddExists = model.Where(c => c.Id == item.Id).Any();
                    if (currentRolesToAddExists == false)
                    {
                
                    }
                    else
                        ViewData["EditError"] = "Role Already Exist";

                }

                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            else
                ViewData["EditError"] = "Please, correct all errors.";
            return PartialView("_RolesGridViewPartial", model.ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult RolesGridViewPartialUpdate(RoleDto  item)
        {
            var model = GetRoles();
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.Id == item.Id);
                    if (modelItem != null)
                    {
    
                    }
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            else
                ViewData["EditError"] = "Please, correct all errors.";
            return PartialView("_RolesGridViewPartial", model.ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult RolesGridViewPartialDelete(System.String Id)
        {
            var model = GetRoles();
            if (Id != null)
            {
                try
                {
                    var item = model.FirstOrDefault(it => it.Id.ToString() == Id);
                    if (item != null)
                    {

                    }
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            return PartialView("_RolesGridViewPartial", model.ToList());
        }
    }
}