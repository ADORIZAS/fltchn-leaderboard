# Push to GitHub - Authentication Required

## Current Status
- ✅ Repository connected: https://github.com/ADORIZAS/FLTCHN-Leaderboard
- ✅ Code ready to push
- ⚠️ Authentication needed

## Quick Authentication Options

### Option 1: Personal Access Token (Fastest - 2 minutes)

1. **Create Token**:
   - Open: https://github.com/settings/tokens/new
   - **Note**: `FLTCHN Leaderboard`
   - **Expiration**: 90 days (or your choice)
   - **Scopes**: Check `repo` (full control of private repositories)
   - Click **"Generate token"**
   - **COPY THE TOKEN** (you won't see it again!)

2. **Push with Token**:
   ```bash
   cd "/Users/ajdorizas/Global Flight Leaderboard"
   git push -u origin main
   ```
   When prompted:
   - **Username**: `ADORIZAS`
   - **Password**: `<paste your token>` (not your GitHub password!)

### Option 2: GitHub CLI (Recommended for future)

```bash
# Install
brew install gh

# Login (opens browser)
gh auth login
# Choose: GitHub.com → HTTPS → Login with web browser

# Push
cd "/Users/ajdorizas/Global Flight Leaderboard"
git push -u origin main
```

### Option 3: SSH Keys (If you have them set up)

```bash
# Change remote to SSH
cd "/Users/ajdorizas/Global Flight Leaderboard"
git remote set-url origin git@github.com:ADORIZAS/FLTCHN-Leaderboard.git
git push -u origin main
```

## After Successful Push

Once pushed, you'll see:
```
Enumerating objects: X, done.
Counting objects: 100% (X/X), done.
...
To https://github.com/ADORIZAS/FLTCHN-Leaderboard.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

Then you can:
1. View: https://github.com/ADORIZAS/FLTCHN-Leaderboard
2. Connect Vercel
3. Connect Railway/Render

## Need Help?

If you get stuck:
- Token not working? Make sure you copied the entire token
- Still asking for password? Use token as password, not GitHub password
- Want to avoid entering credentials each time? Use GitHub CLI or SSH

**Ready? Create your token at https://github.com/settings/tokens/new and then try pushing again!**

