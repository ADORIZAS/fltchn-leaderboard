# How to Push to GitHub - Detailed Step-by-Step Guide

## Overview
You need to authenticate with GitHub to push your code. Here's exactly how to do it.

---

## Method 1: Personal Access Token (Easiest - Recommended)

### Step 1: Create a Personal Access Token

1. **Open your web browser**
2. **Go to**: https://github.com/settings/tokens
   - Or navigate: GitHub → Your Profile (top right) → Settings → Developer settings → Personal access tokens → Tokens (classic)
3. **Click**: "Generate new token" → "Generate new token (classic)"
4. **Fill in the form**:
   - **Note**: `FLTCHN Leaderboard` (or any name you like)
   - **Expiration**: Choose 90 days, 1 year, or "No expiration" (your choice)
   - **Scopes**: Check the box for **`repo`** (this gives full control of repositories)
     - This will automatically check sub-options like `repo:status`, `repo_deployment`, etc.
5. **Scroll down** and click **"Generate token"** (green button at bottom)
6. **IMPORTANT**: GitHub will show you the token ONCE. **Copy it immediately!**
   - It will look like: `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
   - If you lose it, you'll need to create a new one

### Step 2: Push Your Code

1. **Open Terminal** (or use your current terminal)

2. **Navigate to your project**:
   ```bash
   cd "/Users/ajdorizas/Global Flight Leaderboard"
   ```

3. **Run the push command**:
   ```bash
   git push -u origin main
   ```

4. **When prompted for credentials**:
   - **Username**: Type `ADORIZAS` and press Enter
   - **Password**: **Paste your token** (the `ghp_...` string you copied)
     - ⚠️ **Important**: Use the TOKEN, not your GitHub password!
     - The password field won't show characters as you type (this is normal for security)
     - Press Enter after pasting

5. **What you'll see if successful**:
   ```
   Enumerating objects: 50, done.
   Counting objects: 100% (50/50), done.
   Delta compression using up to 8 threads
   Compressing objects: 100% (45/45), done.
   Writing objects: 100% (50/50), 15.23 KiB | 2.18 MiB/s, done.
   Total 50 (delta 5), reused 0 (delta 0), pack-reused 0
   remote: Resolving deltas: 100% (5/5), done.
   To https://github.com/ADORIZAS/FLTCHN-Leaderboard.git
    * [new branch]      main -> main
   Branch 'main' set up to track remote branch 'main' from 'origin'.
   ```

6. **Done!** Your code is now on GitHub.

### Step 3: Verify

1. **Open**: https://github.com/ADORIZAS/FLTCHN-Leaderboard
2. You should see all your files!

---

## Method 2: GitHub CLI (Better for Long-term)

### Step 1: Install GitHub CLI

```bash
# Install using Homebrew
brew install gh
```

If you don't have Homebrew:
```bash
# Install Homebrew first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then install GitHub CLI
brew install gh
```

### Step 2: Authenticate

```bash
# Start authentication
gh auth login
```

**Follow the prompts**:
1. **What account do you want to log into?**
   - Choose: `GitHub.com` (press Enter)

2. **What is your preferred protocol for Git operations?**
   - Choose: `HTTPS` (press Enter)

3. **Authenticate Git with your GitHub credentials?**
   - Choose: `Yes` (press Enter)

4. **How would you like to authenticate GitHub CLI?**
   - Choose: `Login with a web browser` (press Enter)

5. **Press Enter to open github.com in your browser...**
   - Press Enter
   - Browser will open
   - Click "Authorize" button
   - Enter your GitHub password if prompted
   - You'll see "Authentication complete" in browser

6. **Back in terminal**: You'll see "✓ Authentication complete"

### Step 3: Push

```bash
cd "/Users/ajdorizas/Global Flight Leaderboard"
git push -u origin main
```

This time it should work without asking for credentials!

---

## Troubleshooting

### "fatal: could not read Username"
- **Solution**: You need to authenticate (use Method 1 or 2 above)

### "remote: Support for password authentication was removed"
- **Solution**: You're using your GitHub password instead of a token
- **Fix**: Use a Personal Access Token (Method 1)

### "Permission denied (publickey)"
- **Solution**: You're trying to use SSH but don't have keys set up
- **Fix**: Use HTTPS with token (Method 1) or install GitHub CLI (Method 2)

### Token not working
- **Check**: Did you copy the ENTIRE token? (starts with `ghp_`)
- **Check**: Did you check the `repo` scope when creating the token?
- **Try**: Create a new token and try again

### "Device not configured" error
- **Solution**: This means git can't prompt for credentials in this environment
- **Fix**: Use GitHub CLI (Method 2) or manually enter credentials when prompted

### Credentials saved but still asking
- **Solution**: Clear saved credentials and try again:
  ```bash
  git credential-osxkeychain erase
  host=github.com
  protocol=https
  ```
  (Press Enter twice, then try push again)

---

## What Happens After Push?

Once your code is pushed:

1. **View on GitHub**: https://github.com/ADORIZAS/FLTCHN-Leaderboard
2. **All your files** will be visible
3. **Ready for**:
   - Vercel deployment (connect to this repo)
   - Railway/Render deployment (connect to this repo)
   - GitHub Actions (already configured)

---

## Quick Reference

**Fastest way to push right now**:
1. Create token: https://github.com/settings/tokens/new
2. Copy token
3. Run: `git push -u origin main`
4. Username: `ADORIZAS`
5. Password: `<paste token>`

**Best long-term solution**:
1. `brew install gh`
2. `gh auth login`
3. `git push -u origin main` (no credentials needed!)

---

## Need More Help?

If you're still stuck:
- Check `PUSH_INSTRUCTIONS.md` for alternative methods
- Make sure you're in the right directory: `/Users/ajdorizas/Global Flight Leaderboard`
- Verify your repository exists: https://github.com/ADORIZAS/FLTCHN-Leaderboard

**Ready to push? Follow Method 1 above - it's the quickest!**

