using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace cms.Models
{ 
    public class BookingsDto
    {
        public Guid ObjId { get; set; }      
        public string email { get; set; }
        public string occasion { get; set; }
        public DateTime datecapture { get; set; }
        public string EventsType { get; set; }
        public string cuisinetype { get; set; }

        public string phoneno { get; set; }
        public string refno { get; set; }
        public string address { get; set; }

        public string FromTime { get; set; }
        public string ToTime { get; set; }
        public DateTime? RequestDate { get; set; }
        public string Accepted { get; set; }
        
    }
}