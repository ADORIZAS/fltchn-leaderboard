#!/bin/bash
# Automated setup script for FLTCHN Leaderboard
# Run this script to set up the local development environment

set -e  # Exit on error

echo "🚀 FLTCHN Leaderboard - Automated Setup"
echo "========================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check prerequisites
echo "📋 Checking prerequisites..."

if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ Python 3 is not installed${NC}"
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed${NC}"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm is not installed${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Prerequisites check passed${NC}"
echo ""

# Setup Backend
echo "🔧 Setting up backend..."
cd "$(dirname "$0")/backend" || exit 1

if [ ! -d "venv" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv venv
fi

echo "Activating virtual environment..."
source venv/bin/activate

echo "Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo -e "${GREEN}✅ Backend setup complete${NC}"
echo ""

# Setup Frontend
echo "🔧 Setting up frontend..."
cd "$(dirname "$0")/frontend" || exit 1

if [ ! -d "node_modules" ]; then
    echo "Installing Node.js dependencies..."
    npm install
fi

echo -e "${GREEN}✅ Frontend setup complete${NC}"
echo ""

# Create .env files if they don't exist
cd "$(dirname "$0")" || exit 1

echo "📝 Creating environment files..."

if [ ! -f "backend/.env" ]; then
    echo "Creating backend/.env from template..."
    cp backend/.env.example backend/.env
    echo -e "${YELLOW}⚠️  Please edit backend/.env with your API keys${NC}"
fi

if [ ! -f "frontend/.env.local" ]; then
    echo "Creating frontend/.env.local..."
    echo "NEXT_PUBLIC_API_BASE_URL=http://localhost:8000/api/v1" > frontend/.env.local
    echo -e "${GREEN}✅ Frontend environment file created${NC}"
fi

echo ""
echo -e "${GREEN}✅ Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Edit backend/.env with your Firebase and API keys"
echo "2. Run 'source backend/venv/bin/activate && uvicorn app.main:app --reload' to start backend"
echo "3. Run 'cd frontend && npm run dev' to start frontend"
echo ""

