#!/bin/bash
# Push to GitHub with authentication options

set -e

echo "📤 Pushing to GitHub"
echo "===================="
echo ""

cd "/Users/ajdorizas/Global Flight Leaderboard"

# Check if GitHub CLI is available
if command -v gh &> /dev/null; then
    echo "✅ GitHub CLI found"
    echo ""
    echo "Checking authentication..."
    if gh auth status &> /dev/null; then
        echo "✅ Already authenticated with GitHub CLI"
        echo ""
        echo "Pushing to GitHub..."
        git push -u origin main
        echo ""
        echo "✅ Successfully pushed to GitHub!"
    else
        echo "⚠️  Not authenticated"
        echo ""
        echo "Authenticating with GitHub..."
        gh auth login
        echo ""
        echo "Pushing to GitHub..."
        git push -u origin main
        echo ""
        echo "✅ Successfully pushed to GitHub!"
    fi
else
    echo "GitHub CLI not found"
    echo ""
    echo "Option 1: Install GitHub CLI (Recommended)"
    echo "  brew install gh"
    echo "  gh auth login"
    echo "  Then run this script again"
    echo ""
    echo "Option 2: Use Personal Access Token"
    echo "  1. Go to: https://github.com/settings/tokens"
    echo "  2. Generate new token (classic)"
    echo "  3. Select 'repo' scope"
    echo "  4. Copy the token"
    echo "  5. When pushing, use token as password"
    echo ""
    echo "Option 3: Try push with credential helper"
    echo ""
    read -p "Try pushing now? (y/n): " TRY_PUSH
    
    if [ "$TRY_PUSH" = "y" ] || [ "$TRY_PUSH" = "Y" ]; then
        echo ""
        echo "Pushing to GitHub..."
        echo "You may be prompted for username and password/token"
        git push -u origin main
    fi
fi

echo ""
echo "View your repository at:"
echo "https://github.com/ADORIZAS/FLTCHN-Leaderboard"

