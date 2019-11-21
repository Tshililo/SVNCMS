using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace cms.Models
{ 
    public class UserDto
    {
        public Guid Id { get; set; }      
        public string Email { get; set; }
        public bool? EmailConfirmed { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        

    }
}