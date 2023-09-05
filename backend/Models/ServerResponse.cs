using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    public class ServerResponse<T>
    {
        T? Data { get; set; }
        bool IsSuccess { get; set; } = true;
        string? Message { get; set; }
    }
}