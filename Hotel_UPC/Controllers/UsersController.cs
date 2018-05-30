using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Hotel_UPC.Models;

namespace Hotel_UPC.Controllers
{
    public class UsersController : Controller
    {
        private HotelUPCEntitiesContext db = new HotelUPCEntitiesContext();

        // GET: Users
        public ActionResult Index()
        {
            var users = db.Users.Include(u => u.UserType);
            return View(users.ToList());
        }

        // GET: Users/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }
        // GET: Users/Register
        public ActionResult Register()
        {
            ViewBag.UserTypeId = new SelectList(db.UserTypes, "ID", "Description");
            return View();
        }
        // POST: Users/Register
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include = "ID,UserTypeId,Email,Name,Document,Password,IsForeign,DoB")] User user)
        {
            if (ModelState.IsValid)
            {
                var ut = from t in db.UserTypes
                         where t.Description.ToLower()
                         == "customer"
                         select t;
                UserType objUserType = ut.FirstOrDefault();
                user.UserTypeId = objUserType.ID;
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Login");
            }

            
            return View(user);
        }
        // GET: Users/Login
        public ActionResult Login()
        {
            ViewBag.UserTypeId = new SelectList(db.UserTypes, "ID", "Description");
            return View();
        }
        // POST: Users/Login
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login([Bind(Include = "Email,Password")] User user)
        {
            if (ModelState.IsValid)
            {

                var ut = from t in db.Users
                         where t.Email.ToLower()==user.Email.ToLower()&& t.Password==user.Password
                         select t;
                User objUser = ut.FirstOrDefault();
                if (objUser!=null)
                {
                    Session["User"] = objUser;
                    return RedirectToAction("AvailableRooms", "Rooms");
                }
                else
                {
                    ViewBag.ErrorMessage="ERROR";
                }
            }
            
           
            return View(user);
        }
        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        // GET: Users/Create
        public ActionResult Create()
        {
            ViewBag.UserTypeId = new SelectList(db.UserTypes, "ID", "Description");
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,UserTypeId,Email,Name,Document,Password,IsForeign,DoB")] User user)
        {
            if (ModelState.IsValid)
            {

                var ut = from t in db.UserTypes
                         where t.Description.ToLower()
                         == "customer"
                         select t;
                UserType objUserType = ut.FirstOrDefault();
                user.UserTypeId = objUserType.ID;
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Login");
            }

            ViewBag.UserTypeId = new SelectList(db.UserTypes, "ID", "Description", user.UserTypeId);
            return View(user);
        }

        // GET: Users/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserTypeId = new SelectList(db.UserTypes, "ID", "Description", user.UserTypeId);
            return View(user);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,UserTypeId,Email,Name,Document,Password,IsForeign,DoB")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserTypeId = new SelectList(db.UserTypes, "ID", "Description", user.UserTypeId);
            return View(user);
        }

        // GET: Users/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User user = db.Users.Find(id);
            db.Users.Remove(user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
