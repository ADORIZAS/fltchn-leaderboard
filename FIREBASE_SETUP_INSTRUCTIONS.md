# Firebase Setup - Quick Instructions

## Where is your Firebase service account key?

After downloading from Firebase Console, it's likely in your **Downloads** folder.

### Quick Setup:

1. **Find the file**: Look for a file named something like:
   - `fltchn-leaderboard-xxxxx-firebase-adminsdk-xxxxx.json`
   - Or `serviceAccountKey.json`
   - Usually in `~/Downloads/`

2. **Copy it to the project**:
   ```bash
   cd "/Users/ajdorizas/Global Flight Leaderboard"
   cp ~/Downloads/*firebase*.json backend/firebase-key.json
   # Or if you know the exact filename:
   # cp ~/Downloads/your-exact-filename.json backend/firebase-key.json
   ```

3. **Test it**:
   ```bash
   python3 test_firebase.py
   ```

### Alternative: Tell me the path

If you know where you saved it, tell me the full path and I'll help you set it up!

### What the key file looks like:

It's a JSON file that starts with:
```json
{
  "type": "service_account",
  "project_id": "your-project-id",
  "private_key_id": "...",
  ...
}
```

Once you've placed it in `backend/firebase-key.json`, let me know and I'll test the connection!

