# COOLIFY DEPLOYMENT GUIDE

## Prerequisites

- VPS with Coolify installed
- GitHub/GitLab account (optional, for Git deployment)
- Docker Hub account (optional, for Docker deployment)

---

## DEPLOYMENT OPTIONS

### Option 1: Git Repository (Recommended) ✅

#### Step 1: Push to GitHub/GitLab

```bash
# In deploy-landing folder
git remote add origin https://github.com/YOUR_USERNAME/propertipro-landing.git
git branch -M main
git push -u origin main
```

#### Step 2: Coolify Dashboard

1. Login to Coolify dashboard (e.g., https://coolify.yourdomain.com)
2. Click "New Application"
3. Select "Git Repository"
4. Fill form:
   - **Name**: PropertiPro Landing
   - **Repository**: https://github.com/YOUR_USERNAME/propertipro-landing
   - **Branch**: main
   - **Build Pack**: Nixpacks (auto-detect) or Docker
   - **Port**: 80 (nginx) or 3000 (serve)
5. Click "Deploy"
6. Wait ~2-3 minutes
7. Access at: https://propertipro.yourdomain.com

---

### Option 2: Docker Image

#### Step 1: Build & Push Docker Image

```bash
# Build locally
docker build -t propertipro-landing .

# Tag for Docker Hub
docker tag propertipro-landing YOUR_DOCKERHUB_USERNAME/propertipro-landing:latest

# Push to Docker Hub
docker push YOUR_DOCKERHUB_USERNAME/propertipro-landing:latest
```

#### Step 2: Coolify Dashboard

1. Login to Coolify dashboard
2. Click "New Application"
3. Select "Docker Image"
4. Fill form:
   - **Name**: PropertiPro Landing
   - **Image**: YOUR_DOCKERHUB_USERNAME/propertipro-landing:latest
5. Click "Deploy"
6. Access at assigned domain

---

### Option 3: Manual Upload (Simple)

#### Step 1: Zip Files

```bash
# In deploy-landing folder
zip -r propertipro-landing.zip . -x ".git/*"
```

#### Step 2: Coolify Dashboard

1. Login to Coolify dashboard
2. Click "New Application"
3. Select "Static Website"
4. Upload zip file or paste files
5. Click "Deploy"

---

## CONFIGURATION

### Environment Variables (Optional)

No environment variables needed (static website).

### Domain Setup

1. Coolify Dashboard → Application → Configuration
2. Set custom domain: `propertipro.yourdomain.com`
3. Update DNS A record to VPS IP
4. Enable SSL (Coolify auto-configures Let's Encrypt)

### Port Configuration

- **Nginx (Dockerfile)**: Port 80
- **Serve (package.json)**: Port 3000

Coolify will auto-detect from Dockerfile EXPOSE.

---

## TESTING

### Local Test (Docker)

```bash
docker build -t propertipro-landing .
docker run -p 8080:80 propertipro-landing
# Open: http://localhost:8080
```

### Local Test (Serve)

```bash
npx serve -s . -p 3000
# Open: http://localhost:3000
```

---

## FILE STRUCTURE

```
deploy-landing/
├── index.html                (30KB - Main page)
├── assets/images/mockups/    (7.9MB - Screenshots)
│   ├── screenshot-rocks.png
│   ├── screenshot-rocks (1).png
│   ├── ...
│   └── screenshot-rocks (12).png
├── Dockerfile                (Nginx container)
├── package.json              (Serve option)
├── README.md                 (Documentation)
├── .gitignore                (Git ignore)
└── .dockerignore             (Docker ignore)

Total size: 16MB
Files: 19
```

---

## COOLIFY FEATURES USED

- ✅ Auto SSL (Let's Encrypt)
- ✅ Custom domain
- ✅ Auto-deploy on push (Git)
- ✅ Health checks
- ✅ Logs viewer
- ✅ Resource limits

---

## TROUBLESHOOTING

### Issue: 502 Bad Gateway

**Solution**: Check port configuration
- Dockerfile: EXPOSE 80
- Coolify: Set port 80

### Issue: Images not loading

**Solution**: Verify asset paths
- Path in HTML: `assets/images/mockups/screenshot-rocks.png`
- File location: `assets/images/mockups/screenshot-rocks.png`
- Should match exactly

### Issue: Slow loading

**Solution**: Optimize images
- Current: 7.9MB (12 screenshots)
- Target: <2MB (compress PNG)
- Use TinyPNG or ImageOptim

---

## UPDATES

### Update Landing Page

1. Edit `index.html` locally
2. Commit & push:
   ```bash
   git add index.html
   git commit -m "Update landing page"
   git push
   ```
3. Coolify will auto-deploy (if webhook enabled)

### Update Screenshots

1. Replace files in `assets/images/mockups/`
2. Commit & push:
   ```bash
   git add assets/images/mockups/
   git commit -m "Update screenshots"
   git push
   ```

---

## COST ESTIMATION

### Coolify (Self-hosted)
- VPS: $5-20/month (DigitalOcean, Linode, etc.)
- Coolify: FREE
- Total: $5-20/month

### Resources Needed
- CPU: 1 core
- RAM: 512MB-1GB
- Storage: 20GB (for landing + Coolify)
- Bandwidth: Minimal (~8MB per visit)

---

## NEXT STEPS

1. Push to GitHub/GitLab
2. Login to Coolify dashboard
3. Create new application (Git Repository)
4. Deploy
5. Set custom domain
6. Test & verify
7. Share with client!

---

## SUPPORT

- Coolify Docs: https://coolify.io/docs
- Coolify GitHub: https://github.com/coollabsio/coolify
- Coolify Discord: https://discord.gg/coolify

---

**Deployment time: ~5 minutes**
**Difficulty: Easy (Beginner friendly)**