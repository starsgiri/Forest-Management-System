# Forest Management System - Configuration Guide

## 🎯 Backend Configuration

### 1. Database Connection (MySQL)
**Location:** `backend/src/main/resources/application.properties`

```properties
# Database Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/forest_management_system
spring.datasource.username=root
spring.datasource.password=Giri@#2004
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```

**To Change:**
- `localhost:3306` - Change if MySQL is on different host/port
- `forest_management_system` - Your database name
- `root` - Your MySQL username
- `Giri@#2004` - Your MySQL password

### 2. Server Port
**Location:** Same file

```properties
# Server Configuration
server.port=8080
```

**To Change:** Modify `8080` to your desired port

---

## 🎨 Frontend Configuration

### 1. Backend API Connection
**Location:** `frontend/lib/api.ts`

```typescript
const API_BASE_URL = 'http://localhost:8080/api';
```

**To Change:**
- `localhost:8080` - Change to your backend server address
- If backend port changes, update here too

### 2. Authentication Endpoints
**Location:** `frontend/app/auth/page.tsx`

```typescript
const response = await fetch(`http://localhost:8080/api/auth/login`, {
  // or /api/auth/signup
});
```

**To Change:** Update `localhost:8080` to match your backend

---

## 📋 Setup Steps

### Backend Setup:
1. Make sure MySQL is running
2. Create database: `CREATE DATABASE forest_management_system;`
3. Update `application.properties` with your credentials
4. Run: `.\mvnw.cmd spring-boot:run`

### Frontend Setup:
1. Update API URLs in `lib/api.ts` if needed
2. Run: `npm run dev`
3. Open: `http://localhost:3000`

---

## 🔐 Authentication Flow

1. User lands on `/` (root page)
2. Redirects to `/auth` for login/signup
3. After successful authentication → redirects to `/dashboard`
4. Dashboard has access to all modules

---

## 🚀 First Time Setup

1. **Start Backend:**
   ```bash
   cd backend
   .\mvnw.cmd spring-boot:run
   ```

2. **Start Frontend:**
   ```bash
   cd frontend
   npm run dev
   ```

3. **Create First User:**
   - Go to `http://localhost:3000`
   - Click "Sign Up"
   - Create admin account
   - Login and access dashboard

---

## 📁 Key Files Reference

### Backend API Endpoints:
- `/api/auth/login` - User login
- `/api/auth/signup` - User registration
- `/api/animals` - Animals CRUD
- `/api/trees` - Trees CRUD
- `/api/plants` - Plants CRUD
- `/api/officers` - Officers CRUD
- `/api/visitors` - Visitors CRUD
- `/api/resources` - Resources CRUD

### Frontend Pages:
- `/` - Auto-redirect page
- `/auth` - Login/Signup
- `/dashboard` - Main dashboard
- `/animals` - Animals management
- `/trees` - Trees management
- `/plants` - Plants management
- `/officers` - Officers management
- `/visitors` - Visitors management
- `/resources` - Resources management

---

## 🔧 Common Issues

### Backend won't start:
- Check MySQL is running
- Verify database credentials in `application.properties`
- Ensure port 8080 is not in use

### Frontend can't connect:
- Check backend is running on port 8080
- Verify API_BASE_URL in `lib/api.ts`
- Check browser console for CORS errors

### API Error 500:
- Check backend logs for detailed error
- Verify database tables are created
- Check entity relationships are correct
