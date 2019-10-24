using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace cms.Models
{
    public class Response
    {
        public string Data { get; set; }
        public int ErrorCode { get; set; }
        public string ErrorMsg { get; set; }
    }


    public class UbaInputs
    {
        public string Data { get; set; }
        public int ErrorCode { get; set; }
        public string ErrorMsg { get; set; }
    }
}