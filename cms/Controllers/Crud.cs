using System;
using System.Text;
using System.Web.Mvc;

namespace cms.Controllers
{
    //  [Authorize]
    public class BaseController : Controller
    {

        //This is my connection string i have assigned the database file address path  
       public string MyConnection2 = "datasource=localhost;port=3306;username=root;password=mukoni";

        public string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }
    }
}