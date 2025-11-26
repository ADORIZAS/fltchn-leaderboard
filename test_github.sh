#!/bin/bash
# Test GitHub repository connection

set -e

echo "🔗 Testing GitHub Repository Connection"
echo "========================================"
echo ""

cd "/Users/ajdorizas/Global Flight Leaderboard"

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Git repository not initialized"
    echo ""
    echo "Initializing git repository..."
    git init
    echo "✅ Git initialized"
    echo ""
fi

# Check for remote
REMOTE_URL=$(git remote get-url origin 2>/dev/null || echo "")

if [ -z "$REMOTE_URL" ]; then
    echo "⚠️  No GitHub remote configured"
    echo ""
    echo "To set up GitHub connection:"
    echo "1. Create repository at https://github.com/new"
    echo "2. Then run:"
    echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git"
    echo ""
    read -p "Do you want to set up the remote now? (y/n): " SETUP_REMOTE
    
    if [ "$SETUP_REMOTE" = "y" ] || [ "$SETUP_REMOTE" = "Y" ]; then
        read -p "Enter your GitHub username: " GITHUB_USERNAME
        read -p "Enter your repository name: " REPO_NAME
        
        REMOTE_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
        git remote add origin "$REMOTE_URL"
        echo "✅ Remote added: $REMOTE_URL"
    else
        echo "Skipping remote setup"
        exit 0
    fi
else
    echo "✅ Remote configured: $REMOTE_URL"
fi

# Test connection
echo ""
echo "🔍 Testing connection to GitHub..."
echo ""

# Check if we can reach GitHub
if git ls-remote --heads origin > /dev/null 2>&1; then
    echo "✅ Successfully connected to GitHub!"
    echo ""
    
    # Show remote info
    echo "📋 Remote Information:"
    git remote -v
    echo ""
    
    # Check if there are commits
    if git rev-parse --verify HEAD > /dev/null 2>&1; then
        echo "✅ Local commits found"
        echo ""
        echo "📊 Repository Status:"
        git status --short
        echo ""
        
        # Check if we're ahead/behind
        git fetch origin 2>/dev/null || echo "⚠️  Could not fetch (repo might be new)"
        
        LOCAL_BRANCH=$(git branch --show-current 2>/dev/null || echo "main")
        if git rev-parse --verify "origin/$LOCAL_BRANCH" > /dev/null 2>&1; then
            AHEAD=$(git rev-list --count "origin/$LOCAL_BRANCH..HEAD" 2>/dev/null || echo "0")
            BEHIND=$(git rev-list --count "HEAD..origin/$LOCAL_BRANCH" 2>/dev/null || echo "0")
            
            if [ "$AHEAD" != "0" ]; then
                echo "📤 $AHEAD commit(s) ahead of remote"
            fi
            if [ "$BEHIND" != "0" ]; then
                echo "📥 $BEHIND commit(s) behind remote"
            fi
            if [ "$AHEAD" = "0" ] && [ "$BEHIND" = "0" ]; then
                echo "✅ Local and remote are in sync"
            fi
        else
            echo "ℹ️  Remote branch doesn't exist yet (new repository)"
        fi
    else
        echo "⚠️  No commits yet"
        echo ""
        echo "Would you like to create initial commit? (y/n): "
        read -p "" CREATE_COMMIT
        
        if [ "$CREATE_COMMIT" = "y" ] || [ "$CREATE_COMMIT" = "Y" ]; then
            echo ""
            echo "Creating initial commit..."
            git add .
            git commit -m "Initial commit: FLTCHN Global Aircraft Intelligence Leaderboard"
            echo "✅ Initial commit created"
            echo ""
            echo "To push to GitHub, run:"
            echo "  git branch -M main"
            echo "  git push -u origin main"
        fi
    fi
else
    echo "❌ Could not connect to GitHub"
    echo ""
    echo "Possible issues:"
    echo "1. Repository doesn't exist yet - create it at https://github.com/new"
    echo "2. Authentication required - you may need to:"
    echo "   - Set up SSH keys, or"
    echo "   - Use GitHub CLI: gh auth login"
    echo "   - Or use personal access token"
    echo ""
    echo "Remote URL: $REMOTE_URL"
fi

echo ""
echo "========================================"

