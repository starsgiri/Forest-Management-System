# 🚀 Free Backend Deployment Guide

## Option 1: Railway (Recommended - Easiest)

### Why Railway?
- ✅ Free tier: 500 hours/month + $5 credit
- ✅ Automatic MySQL database included
- ✅ Auto-deploys from GitHub
- ✅ Very easy setup

### Steps:

1. **Prepare Your Project**
   - Create `.railway` folder in backend directory
   - Add `railway.json`:
   ```json
   {
     "$schema": "https://railway.app/railway.schema.json",
     "build": {
       "builder": "NIXPACKS"
     },
     "deploy": {
       "startCommand": "./mvnw spring-boot:run",
       "restartPolicyType": "ON_FAILURE",
       "restartPolicyMaxRetries": 10
     }
   }
   ```

2. **Sign Up & Deploy**
   - Go to https://railway.app
   - Sign up with GitHub
   - Click "New Project" → "Deploy from GitHub repo"
   - Select your repository
   - Railway auto-detects Spring Boot!

3. **Add MySQL Database**
   - In your project, click "+ New"
   - Select "Database" → "Add MySQL"
   - Railway automatically creates database and provides connection string

4. **Configure Environment Variables**
   - In Railway dashboard, go to your service
   - Click "Variables" tab
   - Add these variables:
   ```
   SPRING_DATASOURCE_URL=<Railway MySQL URL>
   SPRING_DATASOURCE_USERNAME=<Railway MySQL user>
   SPRING_DATASOURCE_PASSWORD=<Railway MySQL password>
   ```

5. **Deploy!**
   - Railway automatically builds and deploys
   - You'll get a URL like: `https://your-app.railway.app`

---

## Option 2: Render (Also Great)

### Why Render?
- ✅ Free tier: 750 hours/month
- ✅ Free PostgreSQL database
- ✅ Auto-deploys from GitHub
- ✅ Sleep after 15 min inactivity (wakes on request)

### Steps:

1. **Create `render.yaml` in backend root:**
   ```yaml
   services:
     - type: web
       name: forest-management-api
       env: java
       buildCommand: ./mvnw clean package -DskipTests
       startCommand: java -jar target/forest-management-system-1.0.0.jar
       envVars:
         - key: DATABASE_URL
           fromDatabase:
             name: forest-db
             property: connectionString
   
   databases:
     - name: forest-db
       databaseName: forest_management
       user: forest_user
   ```

2. **Update application.properties for Render:**
   ```properties
   spring.datasource.url=${DATABASE_URL}
   spring.jpa.hibernate.ddl-auto=update
   server.port=${PORT:8080}
   ```

3. **Sign Up & Deploy**
   - Go to https://render.com
   - Sign up with GitHub
   - Click "New +" → "Web Service"
   - Connect your GitHub repo
   - Render auto-detects the build!

---

## Option 3: Heroku (Classic Choice)

### Why Heroku?
- ✅ Free tier with limitations
- ✅ Easy PostgreSQL add-on
- ✅ Well-documented

### Steps:

1. **Install Heroku CLI:**
   ```bash
   # Windows (using Chocolatey)
   choco install heroku-cli
   ```

2. **Create `Procfile` in backend root:**
   ```
   web: java -jar target/forest-management-system-1.0.0.jar
   ```

3. **Create `system.properties`:**
   ```properties
   java.runtime.version=21
   ```

4. **Deploy Commands:**
   ```bash
   # Login
   heroku login
   
   # Create app
   cd backend
   heroku create forest-management-api
   
   # Add PostgreSQL
   heroku addons:create heroku-postgresql:mini
   
   # Deploy
   git init
   git add .
   git commit -m "Initial commit"
   heroku git:remote -a forest-management-api
   git push heroku master
   ```

---

## Option 4: Fly.io

### Why Fly.io?
- ✅ Free tier: 3 shared VMs
- ✅ Global deployment
- ✅ Good performance

### Steps:

1. **Install Fly CLI:**
   ```bash
   iwr https://fly.io/install.ps1 -useb | iex
   ```

2. **Deploy:**
   ```bash
   cd backend
   fly launch
   fly deploy
   ```

---

## 🎯 My Recommendation: Railway

**Railway is the easiest and best for your use case:**

1. Free MySQL included (no need to switch to PostgreSQL)
2. Auto-deployment from GitHub
3. Simple environment variable management
4. No sleep timeout like Render
5. Good free tier

### Quick Railway Setup (5 minutes):

```bash
# 1. Ensure your backend code is on GitHub
cd "C:\Users\girio\Desktop\projects\Forest Management System"
git add .
git commit -m "Prepare for deployment"
git push origin master

# 2. Go to railway.app and sign in with GitHub

# 3. Click "New Project" → "Deploy from GitHub"

# 4. Select "Forest-Management-System" repo

# 5. Railway will auto-detect Spring Boot and deploy!
```

---

## After Deployment - Update Frontend

Once deployed, update your frontend to use the production API:

**File: `frontend/.env.local`** (create if doesn't exist)
```env
NEXT_PUBLIC_API_URL=https://your-app.railway.app/api
```

**Or hardcode in `frontend/lib/api.ts`:**
```typescript
const API_BASE_URL = 'https://your-app.railway.app/api';
```

---

## Free Hosting Comparison Table

| Platform | Free Tier | Database | Sleep? | Deployment |
|----------|-----------|----------|--------|------------|
| **Railway** | 500 hrs/$5 credit | MySQL ✅ | No ❌ | GitHub Auto |
| **Render** | 750 hrs | PostgreSQL | Yes (15 min) | GitHub Auto |
| **Heroku** | 550 hrs | PostgreSQL | Yes (30 min) | Git Push |
| **Fly.io** | 3 VMs | Separate | No ❌ | CLI |

---

## 🔥 Start with Railway Now!

1. Push code to GitHub: ✅ (Already done)
2. Go to: https://railway.app
3. Sign in with GitHub
4. Deploy in 1 click!

Your backend will be live at: `https://forest-management-XXXX.up.railway.app`

---

## Troubleshooting

### Backend won't start?
- Check Railway logs for errors
- Verify MySQL connection string is correct
- Ensure `application.properties` uses environment variables

### Database connection failed?
- Make sure you added MySQL database in Railway
- Copy connection details to environment variables
- Check if spring.datasource.url format is correct

### Want to use custom domain?
- Railway: Settings → Domains → Add custom domain
- Render: Settings → Custom Domain
- Both support free SSL certificates!

---

Need help with deployment? Let me know which platform you choose!
