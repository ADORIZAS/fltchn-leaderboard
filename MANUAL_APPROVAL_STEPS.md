# Manual Approval Steps - What You Need to Do

Since I cannot create accounts or authorize OAuth flows automatically, here are the exact steps you need to approve:

## Step 1: Firebase Setup (5 minutes)

### 1.1 Create Firebase Project
1. **Open**: https://console.firebase.google.com
2. **Click**: "Add project" or "Create a project"
3. **Enter project name**: `fltchn-leaderboard` (or your choice)
4. **Click**: "Continue"
5. **Google Analytics**: Choose "Not now" (or enable if you want)
6. **Click**: "Create project"
7. **Wait**: 30-60 seconds for project creation

### 1.2 Enable Firestore
1. In Firebase Console, click **"Firestore Database"** in left sidebar
2. Click **"Create database"**
3. Select **"Start in test mode"** (we'll add security rules)
4. Choose **location** (closest to your users)
5. Click **"Enable"**

### 1.3 Get Service Account Key
1. Click **gear icon** ⚙️ next to "Project Overview"
2. Select **"Project settings"**
3. Go to **"Service accounts"** tab
4. Click **"Generate new private key"**
5. Click **"Generate key"** in popup
6. **Save the JSON file** - you'll need this!
   - Save as: `backend/firebase-key.json`
   - Or note the path where you save it

### 1.4 Note Your Project ID
- In Firebase Console, at the top you'll see "Project ID"
- Copy this - you'll need it for `.env` file

**✅ Approval Complete**: You now have Firebase set up!

---

## Step 2: Vercel Account (2 minutes)

### 2.1 Sign Up
1. **Open**: https://vercel.com
2. **Click**: "Sign Up"
3. **Choose**: "Continue with GitHub" (recommended)
4. **Authorize**: Click "Authorize Vercel" when prompted
5. **Complete**: Profile setup if needed

**✅ Approval Complete**: Vercel account ready!

---

## Step 3: Backend Hosting (Choose One)

### Option A: Railway (Easiest - Recommended)

1. **Open**: https://railway.app
2. **Click**: "Start a New Project"
3. **Choose**: "Login with GitHub"
4. **Authorize**: Click "Authorize Railway" when prompted
5. **Done**: Account ready!

### Option B: Render

1. **Open**: https://render.com
2. **Click**: "Get Started for Free"
3. **Choose**: "Sign up with GitHub"
4. **Authorize**: Click "Authorize Render" when prompted
5. **Done**: Account ready!

**✅ Approval Complete**: Backend hosting ready!

---

## Step 4: API Keys (Optional - Can Add Later)

### 4.1 Spire Aviation API
1. **Open**: https://spire.com/aviation
2. **Sign up** for account
3. **Request API access** (may need approval)
4. **Copy API key** when provided

### 4.2 ADSBexchange (via RapidAPI)
1. **Open**: https://rapidapi.com
2. **Sign up** for free account
3. **Search**: "ADSBexchange"
4. **Subscribe** to free tier
5. **Copy**: X-RapidAPI-Key

**⚠️ Note**: You can start without these and add them later. The app will work with just registry data.

---

## Step 5: GitHub Repository (If Not Done)

1. **Open**: https://github.com/new
2. **Repository name**: `fltchn-leaderboard`
3. **Visibility**: Public or Private (your choice)
4. **Don't** initialize with README
5. **Click**: "Create repository"
6. **Copy** the repository URL

---

## What I'll Do After Your Approvals

Once you complete the above:
1. ✅ I'll help you connect everything
2. ✅ Set up environment variables
3. ✅ Deploy to hosting
4. ✅ Configure workers
5. ✅ Launch the application

---

## Quick Checklist

- [ ] Firebase project created
- [ ] Firestore enabled
- [ ] Service account key downloaded
- [ ] Vercel account created
- [ ] Railway/Render account created
- [ ] GitHub repository created (optional)
- [ ] API keys obtained (optional)

**Once you complete these, let me know and I'll connect everything!**

