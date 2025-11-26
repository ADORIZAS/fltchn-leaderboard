# Next Steps - Vercel, Backend Hosting, API Keys, GitHub

## ✅ Firebase - COMPLETE!
- Firebase project: `fltchn-leaderboard`
- Service account key: `backend/firebase-key.json`
- Connection test: ✅ PASSED

---

## Step 1: GitHub Repository Setup

### 1.1 Create GitHub Repository

1. **Go to**: https://github.com/new
2. **Repository name**: `fltchn-leaderboard` (or your choice)
3. **Visibility**: Public (recommended for free tier) or Private
4. **DO NOT** check "Initialize with README" (we already have files)
5. **Click**: "Create repository"

### 1.2 Connect Local Repository

After creating the repo, GitHub will show you commands. Run these:

```bash
cd "/Users/ajdorizas/Global Flight Leaderboard"

# Initialize git if not already done
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: FLTCHN Global Aircraft Intelligence Leaderboard"

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/fltchn-leaderboard.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**✅ Approval Needed**: Create the GitHub repo and authorize the push

---

## Step 2: Vercel Setup (Frontend Hosting)

### 2.1 Sign Up / Login

1. **Go to**: https://vercel.com
2. **Click**: "Sign Up" or "Log In"
3. **Choose**: "Continue with GitHub" (recommended)
4. **Authorize**: Click "Authorize Vercel" when prompted

### 2.2 Deploy Frontend

1. **In Vercel Dashboard**: Click "Add New..." → "Project"
2. **Import Git Repository**: Select your `fltchn-leaderboard` repo
3. **Configure Project**:
   - **Framework Preset**: Next.js (auto-detected)
   - **Root Directory**: `frontend`
   - **Build Command**: `npm run build` (default)
   - **Output Directory**: `.next` (default)
   - **Install Command**: `npm install` (default)
4. **Environment Variables**: Add:
   - `NEXT_PUBLIC_API_BASE_URL`: `http://localhost:8000/api/v1` (we'll update after backend deploy)
5. **Click**: "Deploy"

**✅ Approval Needed**: Authorize Vercel GitHub access and approve deployment

---

## Step 3: Backend Hosting (Choose One)

### Option A: Railway (Easiest - Recommended)

1. **Go to**: https://railway.app
2. **Click**: "Start a New Project"
3. **Choose**: "Login with GitHub"
4. **Authorize**: Click "Authorize Railway" when prompted
5. **New Project**: Click "New Project"
6. **Deploy from GitHub**: Select your `fltchn-leaderboard` repository
7. **Configure**:
   - Railway will auto-detect Python
   - **Root Directory**: `backend`
   - **Start Command**: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
8. **Environment Variables**: Add these in Railway dashboard:
   - `FIREBASE_SERVICE_ACCOUNT_KEY`: (Paste entire JSON content from `backend/firebase-key.json`)
   - `FIREBASE_PROJECT_ID`: `fltchn-leaderboard`
   - `SPIRE_API_KEY`: (leave empty for now)
   - `ADSBEXCHANGE_API_KEY`: (leave empty for now)
   - `SECRET_KEY`: (generate one - see below)
   - `ALLOWED_ORIGINS`: (your Vercel URL after deployment)
9. **Deploy**: Railway will automatically deploy

**Generate SECRET_KEY**:
```bash
python3 -c "import secrets; print(secrets.token_urlsafe(32))"
```

**✅ Approval Needed**: Authorize Railway GitHub access and approve deployment

### Option B: Render

1. **Go to**: https://render.com
2. **Sign up** with GitHub
3. **New** → **Web Service**
4. **Connect** your GitHub repository
5. **Configure**:
   - **Name**: `fltchn-api`
   - **Environment**: Python 3
   - **Build Command**: `cd backend && pip install -r requirements.txt`
   - **Start Command**: `cd backend && uvicorn app.main:app --host 0.0.0.0 --port $PORT`
6. **Environment Variables**: Same as Railway above
7. **Deploy**

**✅ Approval Needed**: Authorize Render GitHub access

---

## Step 4: API Keys (Optional - Can Add Later)

### 4.1 Spire Aviation API

1. **Go to**: https://spire.com/aviation
2. **Sign up** for account
3. **Navigate** to API section
4. **Request** API access (may require approval)
5. **Copy** API key when provided
6. **Add** to backend environment variables:
   - In Railway/Render dashboard: `SPIRE_API_KEY=your_key_here`

### 4.2 ADSBexchange (via RapidAPI)

1. **Go to**: https://rapidapi.com
2. **Sign up** for free account
3. **Search**: "ADSBexchange"
4. **Subscribe** to free tier
5. **Copy**: X-RapidAPI-Key
6. **Add** to backend environment variables:
   - In Railway/Render dashboard: `ADSBEXCHANGE_API_KEY=your_key_here`

**⚠️ Note**: You can start without these API keys. The app will work with just registry data.

---

## Step 5: Update Vercel Environment Variable

After backend is deployed:

1. **Get backend URL** from Railway/Render (e.g., `https://fltchn-api.railway.app`)
2. **Go to Vercel Dashboard** → Your Project → Settings → Environment Variables
3. **Update**: `NEXT_PUBLIC_API_BASE_URL` to `https://your-backend-url.railway.app/api/v1`
4. **Redeploy**: Go to Deployments → Click "..." → Redeploy

---

## Quick Checklist

- [ ] GitHub repository created and connected
- [ ] Vercel account created and frontend deployed
- [ ] Railway/Render account created and backend deployed
- [ ] Environment variables set in hosting platforms
- [ ] Backend URL updated in Vercel
- [ ] API keys added (optional)

---

## After Setup

Once everything is deployed:
1. Test the live site
2. Add test data to Firestore
3. Set up GitHub Actions for workers
4. Monitor and optimize

**Let me know when you've completed each step and I'll help with the next!**

