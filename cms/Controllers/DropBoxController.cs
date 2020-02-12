using cms.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Mvc;

namespace cms.Controllers
{
    public class DropBoxController : BaseController
    {
 
		// GET: DropBox
		public ActionResult Index()
        {
            return View();
        }

        private List<Chefs> GetChefs()
        {
            var getdate = DateTime.Now.Date;

            List<Chefs> Bookings = new List<Chefs>();

            string constr = connectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT ObjId, Idno, email,AddressId,phoneNo,Remarks FROM Chefs";

                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            Bookings.Add(new Chefs
                            {
                                ObjId = Guid.Parse((sdr["ObjId"]).ToString()),
                                Idno = sdr["Idno"].ToString(),
                                emailId = sdr["email"].ToString(),
                                AddressId = sdr["AddressId"].ToString(),
                                phoneNo = sdr["phoneNo"].ToString(),
                                Remarks = sdr["Remarks"].ToString(),
                               // DateCaptured = 
                            });
                        }
                    }
                    con.Close();
                }
            }

            return Bookings.ToList();

        }

        [HttpPost]
        public ActionResult FileManagerPartial(string headerObjId)
        {
            string RootFolder;

            var Mymodel = GetChefs();

            ViewBag.headerObjId = headerObjId;

            if (headerObjId == null)
            {

                RootFolder = Path.Combine(Server.MapPath("~/Uploads/"));
                return PartialView("_FileManagerPartial", RootFolder);
            }
            var model = Mymodel.Where(c => c.ObjId.ToString() == headerObjId).FirstOrDefault();
            //RootFolder = @"~\Content\" + model.IdNo;

            RootFolder = Path.Combine(Server.MapPath("~/Uploads/")) + model.Idno;
            // Determine whether the directory exists.
            if (Directory.Exists(RootFolder))
            {
                ViewBag.RootFolder = RootFolder;
                return PartialView("_FileManagerPartial", RootFolder);
            }
            Directory.CreateDirectory(RootFolder);
            ViewBag.RootFolder = RootFolder;
            return PartialView("_FileManagerPartial", RootFolder);
        }


        public FileStreamResult FileManagerPartialDownload()
        {
            return null;
        }

        public ActionResult ApplicationsGridViewPartial()
		{
         
            var model = GetChefs();

            // DXCOMMENT: Pass a data model for GridView in the PartialView method's second parameter
            return PartialView("GridViewPartialView", model.ToList());
		}


    }

}