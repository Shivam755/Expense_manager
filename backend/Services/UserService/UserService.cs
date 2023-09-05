using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DBContext;

namespace backend.Services.UserService
{
    public class UserService : IUserService
    {
        ExpenseDBContext _db;

        public UserService(ExpenseDBContext db)
        {
            _db = db;
        }
    }
}