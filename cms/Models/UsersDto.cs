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

    public class ChefModel
    {
        public Guid Id { get; set; }
        public string Names { get; set; }
        public byte[] Qualification { get; set; }

    }

    public class RoleDto
    {
        public Guid Id { get; set; }
        public string Name { get; set; }

    }

    public class UserRolesDto
    {
        public Guid ObjId { get; set; }
        public string RoleName { get; set; }
        public string RoleId { get; set; }
        public string UserId { get; set; }

    }
}