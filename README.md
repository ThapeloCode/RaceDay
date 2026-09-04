# RaceDay
This is a Portfolio Of Evidence, for APIs, ERD, SQL and MVC

---
# RaceDay - Community Event Management System

RaceDay is a full-stack event management system designed specifically for South African mass-participation sporting events (such as the Soweto Marathon, Midmar Mile, and Cape Town Cycle Tour). Built with an ASP.NET Core backend, Entity Framework Core, and a fully normalized Microsoft SQL Server relational database, RaceDay streamlines participant registrations, event categorizations, route details, and official race results.

---
## System Architecture & Database Schema

The core database consists of 6 normalized relational entities:
* **User**: Manages accounts, roles (Admin vs. Participant), and user credentials.
* **Event**: Stores high-level occasion metadata, venues, and schedules.
* **Category**: Defines race disciplines and sub-divisions under each event (e.g., 10K, 21K, 42K).
* **Route**: Maps course routes, GPS points, and distance parameters to specific categories.
* **Registration**: Tracks participant event registrations, assigned bib numbers, and entry dates.
* **Results**: Records finish times (in seconds) linked directly to user registrations.