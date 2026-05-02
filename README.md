# PropertiPro Landing Page

Property Management System Landing Page untuk PH Group.

## Files

```
├── index.html                (Main landing page)
├── assets/images/mockups/    (Screenshots)
│   ├── screenshot-rocks.png
│   ├── screenshot-rocks (1).png
│   ├── screenshot-rocks (2).png
│   ├── ...
│   └── screenshot-rocks (12).png
├── Dockerfile                (Nginx container)
├── package.json              (Optional - for serve)
└── README.md                 (This file)
```

## Deploy to Coolify

### Option 1: Git Repository (Recommended)

1. Push to GitHub/GitLab:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin <your-repo-url>
   git push -u origin main
   ```

2. Coolify Dashboard:
   - Create new application
   - Select "Git Repository"
   - Enter repository URL
   - Build pack: "Nixpacks" or "Docker"
   - Port: 80 (nginx) or 3000 (serve)
   - Deploy

### Option 2: Docker Image

1. Build Docker image:
   ```bash
   docker build -t propertipro-landing .
   ```

2. Push to Docker Hub:
   ```bash
   docker tag propertipro-landing <username>/propertipro-landing
   docker push <username>/propertipro-landing
   ```

3. Coolify Dashboard:
   - Create new application
   - Select "Docker Image"
   - Enter image name
   - Deploy

### Option 3: Static Files (Simple)

1. Coolify Dashboard:
   - Create new application
   - Select "Static Website"
   - Upload files via Git or manual
   - Deploy

## Local Testing

### Using Docker:
```bash
docker build -t propertipro-landing .
docker run -p 8080:80 propertipro-landing
# Open: http://localhost:8080
```

### Using serve (Node.js):
```bash
npx serve -s . -p 3000
# Open: http://localhost:3000
```

### Direct:
```bash
# Just open index.html in browser
```

## Tech Stack

- HTML5
- CSS3 (inline)
- Font Awesome 6.4.0 (CDN)
- Screenshots (PNG)

## Features

- Hero section with brand & features
- Feature cards (6 items)
- Comparison table
- 12 screenshot gallery
- Tech stack section
- Deliverables section
- Budget breakdown
- CTA (WhatsApp)
- Footer

## Total Size

- index.html: ~30KB
- Screenshots: ~8MB (12 files)
- Total: ~8.03MB

## Author

PH Group - 2026

## License

ISC