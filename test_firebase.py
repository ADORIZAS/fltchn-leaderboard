#!/usr/bin/env python3
"""Test Firebase connection and configuration."""

import os
import sys
import json
from pathlib import Path

def test_firebase():
    """Test Firebase connection."""
    print("🔥 Testing Firebase Connection")
    print("=" * 50)
    
    # Check for service account key
    print("\n1. Checking for Firebase service account key...")
    key_paths = [
        "backend/firebase-key.json",
        "firebase-key.json",
        os.getenv("FIREBASE_SERVICE_ACCOUNT_KEY", ""),
    ]
    
    key_file = None
    for path in key_paths:
        if path and os.path.exists(path):
            key_file = path
            print(f"   ✅ Found: {path}")
            break
    
    if not key_file:
        print("   ❌ Service account key not found!")
        print("\n   Please:")
        print("   1. Download service account key from Firebase Console")
        print("   2. Save it as 'backend/firebase-key.json'")
        print("   3. Or set FIREBASE_SERVICE_ACCOUNT_KEY environment variable")
        return False
    
    # Check key is valid JSON
    try:
        with open(key_file, 'r') as f:
            key_data = json.load(f)
        print(f"   ✅ Key file is valid JSON")
        print(f"   📋 Project ID: {key_data.get('project_id', 'Not found')}")
    except json.JSONDecodeError:
        print("   ❌ Key file is not valid JSON!")
        return False
    
    # Check for .env file
    print("\n2. Checking backend/.env file...")
    env_file = "backend/.env"
    if os.path.exists(env_file):
        print(f"   ✅ Found: {env_file}")
        with open(env_file, 'r') as f:
            env_content = f.read()
            if "FIREBASE_SERVICE_ACCOUNT_KEY" in env_content:
                print("   ✅ FIREBASE_SERVICE_ACCOUNT_KEY is set")
            if "FIREBASE_PROJECT_ID" in env_content:
                print("   ✅ FIREBASE_PROJECT_ID is set")
    else:
        print(f"   ⚠️  Not found: {env_file}")
        print("   Will create it...")
    
    # Try to import and test Firebase
    print("\n3. Testing Firebase Admin SDK connection...")
    try:
        import firebase_admin
        from firebase_admin import credentials, firestore
        
        # Initialize if not already initialized
        if not firebase_admin._apps:
            cred = credentials.Certificate(key_file)
            project_id = key_data.get('project_id')
            firebase_admin.initialize_app(cred, {'projectId': project_id})
            print("   ✅ Firebase Admin SDK initialized")
            app_cred = cred
        else:
            print("   ✅ Firebase Admin SDK already initialized")
            app_cred = firebase_admin.get_app().credential
        
        # Test Firestore connection using the initialized app
        project_id = key_data.get('project_id')
        # Get Firestore client - it will use the app's credentials
        from google.cloud import firestore as gcp_firestore
        from google.oauth2 import service_account
        
        # Create credentials from the key file
        creds = service_account.Credentials.from_service_account_file(key_file)
        db = gcp_firestore.Client(project=project_id, credentials=creds)
        print("   ✅ Firestore client created")
        
        # Try a simple read operation
        print("\n4. Testing Firestore read operation...")
        test_collection = db.collection('_test')
        test_docs = list(test_collection.limit(1).stream())
        print("   ✅ Can read from Firestore")
        
        # Try a simple write operation (will delete immediately)
        print("\n5. Testing Firestore write operation...")
        test_doc = test_collection.document('connection_test')
        test_doc.set({'test': True, 'timestamp': gcp_firestore.SERVER_TIMESTAMP})
        print("   ✅ Can write to Firestore")
        
        # Clean up test document
        test_doc.delete()
        print("   ✅ Test document cleaned up")
        
        print("\n" + "=" * 50)
        print("✅ Firebase connection test PASSED!")
        print("=" * 50)
        return True
        
    except ImportError:
        print("   ❌ firebase-admin not installed")
        print("   Run: pip install firebase-admin")
        return False
    except Exception as e:
        print(f"   ❌ Error: {e}")
        print(f"   Error type: {type(e).__name__}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    success = test_firebase()
    sys.exit(0 if success else 1)

