#!/bin/bash
# Script to help set up GitHub repository

echo "🔗 GitHub Repository Setup"
echo "=========================="
echo ""

read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter your repository name (default: fltchn-leaderboard): " REPO_NAME
REPO_NAME=${REPO_NAME:-fltchn-leaderboard}

echo ""
echo "📋 Next steps:"
echo ""
echo "1. Create repository on GitHub:"
echo "   Go to: https://github.com/new"
echo "   Name: $REPO_NAME"
echo "   Don't initialize with README"
echo "   Click 'Create repository'"
echo ""
echo "2. After creating, run these commands:"
echo ""
echo "   cd \"/Users/ajdorizas/Global Flight Leaderboard\""
echo "   git init"
echo "   git add ."
echo "   git commit -m 'Initial commit: FLTCHN Global Aircraft Intelligence Leaderboard'"
echo "   git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "Or I can run these for you - just say 'yes' after you've created the repo!"
echo ""

