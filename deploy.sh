#!/bin/bash

# Quick Deployment Script for PropertiPro Landing
# Run this script to deploy to Coolify via GitHub

echo "🚀 PropertiPro Landing Deployment Script"
echo "========================================="

# Step 1: Check prerequisites
echo ""
echo "Step 1: Checking prerequisites..."
if ! command -v git &> /dev/null; then
    echo "❌ Git not installed"
    exit 1
fi
echo "✅ Git installed"

# Step 2: Create GitHub repository (manual)
echo ""
echo "Step 2: Create GitHub Repository"
echo "👉 Go to: https://github.com/new"
echo "👉 Repository name: propertipro-landing"
echo "👉 Description: Property Management System Landing Page"
echo "👉 Public or Private (your choice)"
echo "👉 DO NOT initialize with README (we have one)"
echo "👉 Click 'Create repository'"
echo ""
read -p "Press Enter after creating repository..."

# Step 3: Push to GitHub
echo ""
echo "Step 3: Pushing to GitHub..."
echo "👉 Run these commands:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/propertipro-landing.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
read -p "Press Enter after pushing to GitHub..."

# Step 4: Coolify deployment
echo ""
echo "Step 4: Deploy to Coolify"
echo "👉 Login to Coolify: https://your-coolify-domain.com"
echo "👉 Click 'New Application'"
echo "👉 Select 'Git Repository'"
echo "👉 Enter repository URL: https://github.com/YOUR_USERNAME/propertipro-landing"
echo "👉 Branch: main"
echo "👉 Build Pack: Nixpacks (or Docker)"
echo "👉 Port: 80"
echo "👉 Click 'Deploy'"
echo ""
read -p "Press Enter after deploying..."

# Step 5: Domain setup
echo ""
echo "Step 5: Domain Setup (Optional)"
echo "👉 In Coolify, go to Application → Configuration"
echo "👉 Set custom domain: propertipro.yourdomain.com"
echo "👉 Update DNS A record to your VPS IP"
echo "👉 Enable SSL (auto-configured by Coolify)"
echo ""

echo "✅ Deployment complete!"
echo ""
echo "Your landing page is now live at:"
echo "https://propertipro.yourdomain.com"
echo ""
echo "Next steps:"
echo "- Test all sections"
echo "- Verify screenshots load"
echo "- Check responsive design"
echo "- Share with client!"
echo ""
echo "Need help? Check DEPLOYMENT.md for detailed guide."