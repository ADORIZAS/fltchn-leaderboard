# GitHub Repository Setup - Quick Guide

## ✅ Git Initialized
- Git repository has been initialized
- Initial commit created
- Ready to connect to GitHub

## 🔗 Connect to GitHub

### Option 1: Use the Script (Easiest)

```bash
cd "/Users/ajdorizas/Global Flight Leaderboard"
./connect_github.sh
```

The script will:
1. Ask for your GitHub username
2. Ask for repository name
3. Test the connection
4. Help you push the code

### Option 2: Manual Setup

1. **Create Repository on GitHub**:
   - Go to: https://github.com/new
   - Repository name: `fltchn-leaderboard` (or your choice)
   - **Don't** check "Initialize with README"
   - Click "Create repository"

2. **Connect and Push**:
   ```bash
   cd "/Users/ajdorizas/Global Flight Leaderboard"
   
   # Add remote (replace YOUR_USERNAME and YOUR_REPO)
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   
   # Push to GitHub
   git branch -M main
   git push -u origin main
   ```

### Option 3: Test Connection First

```bash
cd "/Users/ajdorizas/Global Flight Leaderboard"
./test_github.sh
```

This will test the connection and guide you through setup.

## 🔐 Authentication

If you get authentication errors:

### Option A: GitHub CLI (Recommended)
```bash
# Install GitHub CLI
brew install gh

# Login
gh auth login
# Follow prompts - choose HTTPS and browser login
```

### Option B: Personal Access Token
1. Go to: https://github.com/settings/tokens
2. Generate new token (classic)
3. Select scopes: `repo`
4. Copy token
5. Use as password when pushing (username = your GitHub username)

### Option C: SSH Keys
```bash
# Generate SSH key (if you don't have one)
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to GitHub
# Copy public key: cat ~/.ssh/id_ed25519.pub
# Add at: https://github.com/settings/keys

# Change remote to SSH
git remote set-url origin git@github.com:USERNAME/REPO.git
```

## ✅ After Connection

Once connected, you can:
1. View repository: https://github.com/YOUR_USERNAME/fltchn-leaderboard
2. Set up Vercel to deploy from GitHub
3. Set up Railway/Render to deploy from GitHub
4. Set up GitHub Actions for workers

## 🚀 Next Steps

After GitHub is connected:
1. ✅ GitHub repository - DONE
2. ⏭️ Vercel deployment (connect to GitHub repo)
3. ⏭️ Backend hosting (connect to GitHub repo)
4. ⏭️ API keys setup

**Ready to connect? Run `./connect_github.sh` or follow manual steps above!**

