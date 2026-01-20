# ⚡ Quick Start Guide

## 🎯 What I Just Created

✅ **Files Created:**
1. `client/lib/api.ts` - Complete API client with all endpoints
2. `client/.env.local` - Frontend environment variables
3. `server/.env` - Backend environment variables
4. `BACKEND_FRONTEND_INTEGRATION.md` - Complete integration guide (690 lines)
5. `INTEGRATION_ROADMAP.md` - Detailed implementation roadmap (670 lines)
6. `START_INTEGRATION.md` - Step-by-step setup instructions (371 lines)

---

## 🚀 Start Everything (3 Commands)

### 1. Start MongoDB
```powershell
Get-Service -Name MongoDB
# If not running: net start MongoDB
```

### 2. Start Backend (Terminal 1)
```powershell
cd C:\Users\gupta\OneDrive\Desktop\AGORA\server
npm run dev
```
**Expected:** `Server running on port 5000`

### 3. Start Frontend (Terminal 2)
```powershell
cd C:\Users\gupta\OneDrive\Desktop\AGORA\client
npm run dev
```
**Expected:** `Ready on http://localhost:3000`

---

## 🧪 Quick Test (3 Minutes)

### Test 1: Backend Health
```powershell
curl http://localhost:5000/health
```
✅ **Expected:** `{"status":"ok","message":"Agora Backend API is running"}`

### Test 2: API Endpoints
```powershell
curl http://localhost:5000/api/elections
```
✅ **Expected:** `[]` (empty array)

### Test 3: Frontend Access
Open: `http://localhost:3000`
✅ **Expected:** See Agora homepage, no errors in console (F12)

---

## 📊 Current Status

### ✅ What's Working
- Backend server structure ✓
- Frontend UI components ✓
- API client created ✓
- Environment variables configured ✓

### 🔄 What Needs Testing
- MongoDB connection
- Backend endpoints
- Frontend-backend communication
- File uploads
- Authentication flow

---

## 🎯 Next Immediate Actions

### Priority 1: Verify Backend Works
```bash
cd server
npm install  # If not done
npm run dev  # Start server
# Test with curl commands above
```

### Priority 2: Add Missing Backend Features
1. Install multer: `npm install multer @types/multer`
2. Add file upload routes (see INTEGRATION_ROADMAP.md)
3. Add MPIN management routes
4. Create uploads directory

### Priority 3: Connect Frontend
1. Update RegistrationForm to use `api.auth.register()`
2. Test registration flow
3. Update AdminVerificationDashboard
4. Create login page

---

## 📁 File Structure

```
AGORA/
├── client/                   # Frontend (Next.js)
│   ├── lib/
│   │   └── api.ts           # ✅ API client (NEW)
│   ├── .env.local           # ✅ Frontend config (NEW)
│   ├── components/          # All UI components
│   └── app/                 # Next.js pages
│
├── server/                   # Backend (Express)
│   ├── src/
│   │   ├── server.ts        # Main server file
│   │   ├── controllers/     # Business logic
│   │   ├── routes/          # API routes
│   │   ├── models/          # MongoDB models
│   │   └── middleware/      # Auth, validation
│   ├── .env                 # ✅ Backend config (NEW)
│   └── package.json
│
└── docs/                     # ✅ Documentation (NEW)
    ├── BACKEND_FRONTEND_INTEGRATION.md
    ├── INTEGRATION_ROADMAP.md
    └── START_INTEGRATION.md
```

---

## 🔧 API Client Usage Examples

### Registration
```typescript
import { api } from '@/lib/api'

const formData = new FormData()
formData.append('fullName', 'John Doe')
formData.append('phone', '9999999999')
// ... add other fields

const response = await api.auth.register(formData)
```

### Login
```typescript
// Step 1: Request OTP
await api.auth.requestOTP('9999999999')

// Step 2: Verify OTP + MPIN
const response = await api.auth.verifyOTPAndMPIN('9999999999', '123456', '654321')
```

### Get Elections
```typescript
const elections = await api.elections.getAll()
```

### Vote
```typescript
await api.elections.vote(electionId, partyIndex)
```

---

## 🐛 Common Issues & Fixes

### Backend Won't Start
```powershell
# Issue: MongoDB not running
Get-Service -Name MongoDB
net start MongoDB

# Issue: Port 5000 in use
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

### Frontend Can't Connect
```powershell
# Check .env.local exists
Test-Path C:\Users\gupta\OneDrive\Desktop\AGORA\client\.env.local

# Verify content
Get-Content C:\Users\gupta\OneDrive\Desktop\AGORA\client\.env.local
# Should show: NEXT_PUBLIC_API_URL=http://localhost:5000/api

# Restart frontend after .env changes
cd client
npm run dev
```

### CORS Errors
Check backend CORS config in `server/src/server.ts`:
```typescript
app.use(cors({
  origin: 'http://localhost:3000',
  credentials: true
}))
```

---

## 📚 Documentation Files

1. **BACKEND_FRONTEND_INTEGRATION.md** - Complete integration guide
   - All API endpoints documented
   - Authentication flow
   - Code examples
   - Testing instructions

2. **INTEGRATION_ROADMAP.md** - Implementation roadmap
   - What's done vs what needs doing
   - Priority order
   - Code snippets for missing features
   - Testing checklist

3. **START_INTEGRATION.md** - Step-by-step setup
   - Prerequisites
   - Installation steps
   - Troubleshooting
   - Testing procedures

---

## 🎯 Success Checklist

### Before Starting
- [ ] Node.js installed (v18+)
- [ ] MongoDB installed
- [ ] Both `server/` and `client/` have `node_modules/`

### Startup
- [ ] MongoDB service running
- [ ] Backend starts without errors (port 5000)
- [ ] Frontend starts without errors (port 3000)
- [ ] Health check returns OK
- [ ] No CORS errors in browser console

### Basic Integration
- [ ] API client can reach backend
- [ ] Registration form can submit data
- [ ] Admin dashboard can load users
- [ ] Login flow works end-to-end

---

## 💡 Pro Tips

1. **Keep 3 terminals open:**
   - Terminal 1: Backend server
   - Terminal 2: Frontend dev server
   - Terminal 3: Testing commands

2. **Check logs:**
   - Backend: See terminal where `npm run dev` runs
   - Frontend: Browser console (F12)
   - Network: Browser DevTools → Network tab

3. **Test incrementally:**
   - Start backend alone first
   - Test endpoints with curl
   - Then start frontend
   - Then test integration

4. **Use the API client:**
   ```typescript
   import { api } from '@/lib/api'
   // All endpoints already configured!
   ```

---

## 📞 Commands Cheat Sheet

```powershell
# MongoDB
Get-Service -Name MongoDB
net start MongoDB

# Backend
cd C:\Users\gupta\OneDrive\Desktop\AGORA\server
npm install
npm run dev

# Frontend
cd C:\Users\gupta\OneDrive\Desktop\AGORA\client
npm run dev

# Test
curl http://localhost:5000/health
curl http://localhost:5000/api/elections

# Open browser
start http://localhost:3000
```

---

## 🎉 You're Ready!

Everything is set up. Just run the 3 commands above and start testing!

**Next Step:** Read `START_INTEGRATION.md` for detailed setup instructions.
