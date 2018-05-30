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
    public class RoomStatesController : Controller
    {
        private HotelUPCEntitiesContext db = new HotelUPCEntitiesContext();

        // GET: RoomStates
        public ActionResult Index()
        {
            return View(db.RoomStates.ToList());
        }

        // GET: RoomStates/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomState roomState = db.RoomStates.Find(id);
            if (roomState == null)
            {
                return HttpNotFound();
            }
            return View(roomState);
        }

        // GET: RoomStates/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RoomStates/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Description")] RoomState roomState)
        {
            if (ModelState.IsValid)
            {
                db.RoomStates.Add(roomState);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(roomState);
        }

        // GET: RoomStates/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomState roomState = db.RoomStates.Find(id);
            if (roomState == null)
            {
                return HttpNotFound();
            }
            return View(roomState);
        }

        // POST: RoomStates/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Description")] RoomState roomState)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomState).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(roomState);
        }

        // GET: RoomStates/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomState roomState = db.RoomStates.Find(id);
            if (roomState == null)
            {
                return HttpNotFound();
            }
            return View(roomState);
        }

        // POST: RoomStates/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomState roomState = db.RoomStates.Find(id);
            db.RoomStates.Remove(roomState);
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
