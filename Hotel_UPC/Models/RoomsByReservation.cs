//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Hotel_UPC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RoomsByReservation
    {
        public int ID { get; set; }
        public int ReservationID { get; set; }
        public int RoomID { get; set; }
    
        public virtual Reservation Reservation { get; set; }
        public virtual Room Room { get; set; }
    }
}
