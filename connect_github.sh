#!/bin/bash
# Connect to GitHub repository

set -e

echo "🔗 Connect to GitHub Repository"
echo "================================="
echo ""

read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter your repository name (default: fltchn-leaderboard): " REPO_NAME
REPO_NAME=${REPO_NAME:-fltchn-leaderboard}

REMOTE_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

echo ""
echo "📋 Repository URL: $REMOTE_URL"
echo ""

# Check if remote already exists
if git remote get-url origin > /dev/null 2>&1; then
    CURRENT_URL=$(git remote get-url origin)
    if [ "$CURRENT_URL" != "$REMOTE_URL" ]; then
        echo "⚠️  Remote already exists with different URL:"
        echo "   Current: $CURRENT_URL"
        read -p "Update to new URL? (y/n): " UPDATE_REMOTE
        if [ "$UPDATE_REMOTE" = "y" ] || [ "$UPDATE_REMOTE" = "Y" ]; then
            git remote set-url origin "$REMOTE_URL"
            echo "✅ Remote URL updated"
        else
            echo "Keeping existing remote"
            REMOTE_URL="$CURRENT_URL"
        fi
    else
        echo "✅ Remote already configured correctly"
    fi
else
    git remote add origin "$REMOTE_URL"
    echo "✅ Remote added"
fi

echo ""
echo "🔍 Testing connection..."
echo ""

# Test connection
if git ls-remote --heads origin > /dev/null 2>&1; then
    echo "✅ Successfully connected to GitHub!"
    echo ""
    echo "📊 Repository Information:"
    git remote -v
    echo ""
    
    # Check branch
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "main")
    echo "Current branch: $CURRENT_BRANCH"
    echo ""
    
    # Check if we need to push
    if git rev-parse --verify "origin/$CURRENT_BRANCH" > /dev/null 2>&1; then
        echo "Remote branch exists. Checking status..."
        git fetch origin 2>/dev/null || true
    else
        echo "Remote branch doesn't exist yet (new repository)"
    fi
    
    echo ""
    echo "📤 Ready to push! Run:"
    echo "   git branch -M main"
    echo "   git push -u origin main"
    echo ""
    read -p "Push now? (y/n): " PUSH_NOW
    
    if [ "$PUSH_NOW" = "y" ] || [ "$PUSH_NOW" = "Y" ]; then
        echo ""
        echo "Pushing to GitHub..."
        git branch -M main
        git push -u origin main
        echo ""
        echo "✅ Successfully pushed to GitHub!"
        echo ""
        echo "View your repository at:"
        echo "https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    fi
else
    echo "❌ Could not connect to GitHub"
    echo ""
    echo "Possible issues:"
    echo "1. Repository doesn't exist - create it at:"
    echo "   https://github.com/new"
    echo "   Name: $REPO_NAME"
    echo "   Don't initialize with README"
    echo ""
    echo "2. Authentication required:"
    echo "   - Install GitHub CLI: brew install gh"
    echo "   - Then run: gh auth login"
    echo "   - Or set up SSH keys"
    echo ""
    echo "After creating the repository, run this script again."
fi

echo ""
echo "================================="

