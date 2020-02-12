
using cms.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace cms.Controllers
{

    public class ChefMobileRegisterController : BaseController
    {
        public ActionResult Index()
        {
           var ChefModel = new ChefModel();
            return View(ChefModel);
        }

        [HttpPost]
        public ActionResult UploadFiles()
        {
            // Checking no of files injected in Request object  
            if (Request.Files.Count > 0)
            {
                try
                {
                    var Idno = Request.Form["Idno"].ToString();
                    var emailId = Request.Form["emailId"].ToString();
                    var AddressId = Request.Form["AddressId"].ToString();
                    var phoneNo = Request.Form["phoneNo"].ToString();
                    var Remarks = Request.Form["Remarks"].ToString();

                    Chefs Tosave = new Chefs();
                    Tosave.ObjId = Guid.NewGuid();
                    Tosave.Idno = Idno;
                    Tosave.emailId = emailId;
                    Tosave.AddressId = AddressId;
                    Tosave.phoneNo = phoneNo;
                    Tosave.Remarks = Remarks;
                    Tosave.DateCaptured = DateTime.Now;
                    insertrecords(Tosave);

                    //  Get all files from Request object  
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {



                        HttpPostedFileBase file = files[i];
                        string fname;

                        // Checking for Internet Explorer  
                        if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = file.FileName;
                        }
                        var directory = Path.Combine(Server.MapPath("~/Uploads/" +"/" + Idno + "/"));
                        // Get the complete folder path and store the file inside it.  
                        fname = Path.Combine(Server.MapPath("~/Uploads/") + "/" + Idno + "/", fname);
                 
                        // Determine whether the directory exists.
                        if (!Directory.Exists(directory))
                        {
                         // Try to create the directory.
                          Directory.CreateDirectory(directory);
                        }

                        file.SaveAs(fname);

                    }
                    // Returns message that successfully uploaded  
                    return Json("Registered Successfully!");
                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json("Failed to Register");
            }
        }

        // ubachefEntities db = new ubachefEntities();

        public void insertrecords(Chefs Tosave)
        {
            
            try
            {
                //This is my insert query in which i am taking input from the user through windows forms  
                
                string Query = "insert into tutors(ObjId,Idno,email,AddressId,phoneNo,Remarks,DateCaptured) values('" + 
                Tosave.ObjId + "','" + Tosave.Idno + "','" + Tosave.emailId + "','" + Tosave.AddressId + "','" + Tosave.phoneNo + "','" + 
                Tosave.Remarks + "','" + Tosave.DateCaptured + "');";

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

    }
}