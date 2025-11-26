#!/bin/bash
# Complete setup script - Recreates structure and tests Firebase

set -e

echo "🚀 FLTCHN Complete Setup"
echo "========================"
echo ""

# Create backend structure
echo "📁 Creating backend structure..."
mkdir -p backend/app/api/v1
mkdir -p backend/app/models
mkdir -p backend/app/services/ingestion
mkdir -p backend/app/services/processing
mkdir -p backend/app/workers
mkdir -p backend/app/utils
mkdir -p backend/tests
mkdir -p backend/scripts

# Create frontend structure
echo "📁 Creating frontend structure..."
mkdir -p frontend/src/app
mkdir -p frontend/src/components
mkdir -p frontend/src/lib
mkdir -p frontend/src/types
mkdir -p frontend/src/styles
mkdir -p frontend/public

echo "✅ Directory structure created"
echo ""

# Check for Firebase key
echo "🔍 Looking for Firebase service account key..."
if [ -f "backend/firebase-key.json" ]; then
    echo "✅ Found: backend/firebase-key.json"
elif [ -f "firebase-key.json" ]; then
    echo "✅ Found: firebase-key.json (will move to backend/)"
    mv firebase-key.json backend/firebase-key.json
else
    echo "⚠️  Firebase key not found in expected locations"
    echo ""
    echo "Please:"
    echo "1. Locate your Firebase service account JSON file"
    echo "2. Copy it to: backend/firebase-key.json"
    echo "   Or run: cp /path/to/your-key.json backend/firebase-key.json"
    echo ""
    read -p "Press Enter after you've placed the key file, or Ctrl+C to exit..."
fi

echo ""
echo "Next: Testing Firebase connection..."
echo ""

