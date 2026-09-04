# RaceDay
This is a Portfolio Of Evidence, for APIs, ERD, SQL and MVC

---

# RaceDay - Community Event Management System

RaceDay is a full-stack event management system designed for South African sporting events (such as the Soweto Marathon, Midmar Mile, and Cape Town Cycle Tour). It is built with an ASP.NET Core backend, Entity Framework Core, and a fully normalized Microsoft SQL Server relational database, RaceDay streamlines participant registrations, event categorizations, route details, and official race results.

---

## User Roles & Access Control

The system implements Role-Based Access Control (RBAC) to distinguish between administrative management and participant interactions:

* **Admin Role**:
  * Full CRUD (Create, Read, Update, Delete) access to manage core entities including Events, Categories, Routes, and User profiles.
  * Capability to create new race events, define distance categories, assign course route parameters, and manage participant entries.
  * Access to system-wide reports and official finish-time uploads.

* **Participant Role**:
  * Ability to register for upcoming sports events and select specific race categories (e.g., 10K, 21K, 42K).
  * Profile dashboard to view assigned bib numbers, registration history, and event details.
  * Public access to view official race results, leaderboards, and personal finish times.

---

## System Architecture & Database Schema

The core database consists of 6 normalized relational entities:
* **User**: Manages accounts, credentials, and role assignments (`Admin` vs. `Participant`).
* **Event**: Stores high-level occasion metadata, venues, and schedules.
* **Category**: Defines race disciplines and sub-divisions under each event.
* **Route**: Maps course routes, GPS points, and distance parameters to specific categories.
* **Registration**: Tracks participant event registrations, assigned bib numbers, and entry dates.
* **Results**: Records finish times (in seconds) linked directly to user registrations.