# Two-wheeler-and-four-wheeler
# Two-Wheeler and Four-Wheeler Auto Consulting System

## Project Overview
The Two-Wheeler and Four-Wheeler Auto Consulting System is a web-based application that helps customers explore vehicles, receive expert consultations, locate service centers, book vehicle services, and submit reviews.

## Objectives
- Provide a centralized vehicle catalog.
- Help customers receive expert vehicle recommendations.
- Enable online service booking.
- Manage customer and consultant accounts.
- Collect customer feedback through reviews.

## Technologies Used

**Frontend:** React.js, Vite, CSS

**Backend:** Node.js, Express.js

**Database:** MySQL

**Authentication:** JWT and bcrypt

## Main Modules
1. User Registration and Login
2. Vehicle Management
3. Vehicle Consultation
4. Service Center Management
5. Service Booking
6. Customer Reviews

## Project Structure
- `database/` – Database schema and sample data.
- `backend/` – REST API and server-side functionality.
- `frontend/` – React user interface.

## Installation and Execution

### 1. Database Setup
Create the MySQL database by executing:

```sql
SOURCE database/schema.sql;
SOURCE database/seed.sql;
```

### 2. Backend Setup

```bash
cd backend
npm install
```

Create a `.env` file using `.env.example` and configure your MySQL credentials and JWT secret.

Run:

```bash
npm run seed:users
npm start
```

Backend runs at `http://localhost:5000`.

### 3. Frontend Setup

Open another terminal:

```bash
cd frontend
npm install
npm run dev
```

Open `http://localhost:5173` in your browser.

## Sample Login Accounts

| Role | Email | Password |
|---|---|---|
| Admin | admin@example.com | Admin@1234 |
| Staff | staff@example.com | Staff@1234 |
| Customer | customer@example.com | Customer@1234 |
| Consultant | consultant@example.com | Consult@1234 |

## Expected Outcome
The system provides a centralized platform for vehicle selection, expert consultation, service management, online bookings, and customer feedback.

## Conclusion
This project simplifies vehicle consultation and after-sales service through an integrated web-based platform using React, Node.js, Express, and MySQL.
