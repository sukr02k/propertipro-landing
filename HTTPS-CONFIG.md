# HTTPS/SSL Configuration Guide for Coolify

## Problem: Smartphone Shows "no available server"

**Root Cause:** HTTPS not enabled for sslip.io domain

---

## Understanding sslip.io

**sslip.io** is a service that provides:
- Wildcard DNS for IP addresses
- Auto SSL certificates (HTTPS)
- Format: `*.IP.sslip.io`

**Your domain:**
```
n140tnfbvnbw8w9xmh3p2toa.116.203.214.59.sslip.io

Current: HTTP only
Needed: HTTPS enabled
```

---

## Coolify HTTPS Settings Location

### Where to Find:

```
Coolify Dashboard
  → Applications
    → Landing PropertiPro (localhost)
      → Configuration (tab)
        → Look for SSL/HTTPS section
```

### Possible Locations:

**Location A: General Settings**
```
Configuration → General
  → Domain settings
    → HTTPS toggle/checkbox
```

**Location B: Network Settings**
```
Configuration → Network
  → SSL/HTTPS settings
    → Enable SSL
```

**Location C: Separate SSL Tab**
```
Configuration → SSL/TLS
  → Enable HTTPS
  → Certificate type
```

---

## How to Enable HTTPS

### Step-by-Step:

**1. Login Coolify Dashboard**
```
URL: https://your-coolify-domain.com
Login with your credentials
```

**2. Navigate to Application**
```
Dashboard → Applications
Find: Landing PropertiPro (localhost)
Click on application name
```

**3. Open Configuration**
```
Click "Configuration" tab
Look for SSL/HTTPS settings
```

**4. Enable HTTPS**
```
Find these toggles/checkboxes:
┌────────────────────────────────────┐
│ • Enable HTTPS: ON                 │
│ • Force HTTPS: ON                  │
│ • SSL Certificate: Let's Encrypt   │
│   OR                                │
│ • SSL Certificate: sslip.io        │
└────────────────────────────────────┘
```

**5. Domain Settings**
```
If domain shows "unknown":
┌────────────────────────────────────┐
│ Domain:                             │
│ n140tnfbvnbw8w9xmh3p2toa.          │
│ 116.203.214.59.sslip.io             │
│                                      │
│ OR click "Generate Domain"          │
│ to get new auto-domain              │
└────────────────────────────────────┘
```

**6. Save & Redeploy**
```
Click "Save" or "Update"
Click "Deploy" button
Wait 2-3 minutes
```

**7. Test HTTPS URL**
```
Try on smartphone:
https://n140tnfbvnbw8w9xmh3p2toa.116.203.214.59.sslip.io/

Should work now!
```

---

## Coolify Version Differences

### Latest Coolify (v4.x):

```
SSL Features:
✓ Auto-SSL for sslip.io domains
✓ Let's Encrypt integration
✓ Force HTTPS option
✓ SSL status indicators

Steps:
1. Configuration → Domain
2. Enable "HTTPS" toggle
3. Coolify auto-configures SSL
4. Redeploy
```

### Older Coolify (v3.x):

```
SSL Features:
• Manual SSL configuration
• Custom certificate upload
• Limited auto-SSL

Steps:
1. Configuration → SSL
2. Select "Let's Encrypt" or upload cert
3. Enable HTTPS
4. Redeploy
```

---

## Certificate Options

### Option 1: Let's Encrypt (Recommended)

```
✓ Free SSL certificate
✓ Auto-renewal
✓ 90-day validity
✓ Coolify auto-configures

Select in Coolify:
• Certificate Type: Let's Encrypt
• Domain: your sslip.io domain
```

### Option 2: sslip.io Built-in

```
✓ Wildcard SSL from sslip.io
✓ No configuration needed
✓ May need manual enable

How to use:
• Just enable HTTPS in Coolify
• sslip.io handles SSL automatically
```

### Option 3: Custom Certificate

```
• Upload your own SSL cert
• For advanced users
• Not needed for sslip.io
```

---

## Troubleshooting

### HTTPS Still Not Working?

**Check 1: Domain Configuration**
```
Configuration → Domain
Ensure domain is set:
n140tnfbvnbw8w9xmh3p2toa.116.203.214.59.sslip.io
```

**Check 2: Port Settings**
```
Configuration → Network
Port should be:
• 80 (HTTP)
• 443 (HTTPS)

Both ports needed for SSL
```

**Check 3: Coolify Proxy**
```
Coolify uses Traefik proxy
Traefik handles SSL termination
Ensure Traefik configured properly
```

**Check 4: Firewall**
```
VPS firewall rules:
• Port 80 open ✓
• Port 443 open ✓

SSH to VPS:
sudo ufw allow 443
sudo ufw status
```

---

## Verification

### How to Verify HTTPS Working:

**Desktop Browser:**
```
1. Open: https://n140...sslip.io/
2. Check for:
   • 🔒 Lock icon in URL bar
   • "Secure" label
   • Certificate valid
```

**Smartphone Browser:**
```
1. Open: https://n140...sslip.io/
2. Should load without errors
3. All sections visible
4. Screenshots loaded
```

**SSL Certificate Check:**
```
Browser → Click lock icon
→ Certificate details
→ Should show:
   • Issued to: *.116.203.214.59.sslip.io
   • Issued by: Let's Encrypt or sslip.io
   • Valid: Yes
```

---

## Common Issues

### Issue 1: "SSL Certificate Not Found"

**Fix:**
```
Configuration → SSL
→ Request new certificate
→ Wait for generation (1-2 min)
→ Redeploy
```

### Issue 2: "Mixed Content Warning"

**Fix:**
```
HTML uses HTTP resources
→ Check HTML file
→ Ensure all resources HTTPS
→ Our landing page uses CDN HTTPS ✓
→ Should be fine
```

### Issue 3: "Domain Unknown"

**Fix:**
```
Configuration → Domain
→ Enter manually:
n140tnfbvnbw8w9xmh3p2toa.116.203.214.59.sslip.io
→ Save
→ Redeploy
```

---

## Quick Checklist

```
□ Login Coolify dashboard
□ Find application
□ Open Configuration tab
□ Check domain setting
□ Enable HTTPS/SSL
□ Save configuration
□ Redeploy application
□ Wait 2-3 minutes
□ Test HTTPS URL on desktop
□ Test HTTPS URL on smartphone
□ Verify lock icon (🔒)
□ Check certificate valid
□ Landing page loads successfully
```

---

## Expected Timeline

```
Enable HTTPS: 30 seconds
Save config: 10 seconds
Redeploy: 2-3 minutes
SSL generation: 1-2 minutes (if new cert)
Total: 5-7 minutes
```

---

## Result After Fix

```
✓ HTTPS URL working
✓ Smartphone can access
✓ Desktop can access
✓ SSL certificate valid
✓ Lock icon visible (🔒)
✓ No "no available server" error
✓ All 12 screenshots loaded
✓ Professional presentation to client
```

---

## Why HTTP Works on Desktop but Not Mobile

**Desktop Browser:**
```
• More lenient security
• Accepts HTTP connections
• Works with http:// URL
```

**Smartphone Browser:**
```
• Modern security standards
• Prefers HTTPS
• Some carriers block HTTP
• Better SSL validation
• Shows "no available server" for HTTP
```

---

## Additional Notes

**sslip.io SSL:**
```
sslip.io provides wildcard SSL for:
*.IP.sslip.io

Example:
https://anything.116.203.214.59.sslip.io/
→ Should have SSL automatically

But Coolify needs to enable HTTPS routing
```

**Coolify Traefik:**
```
Coolify uses Traefik as reverse proxy
Traefik handles:
• SSL termination
• HTTPS routing
• Certificate management

Traefik needs HTTPS enabled in Coolify config
```

---

## Support

If still not working after following guide:

**Coolify Community:**
- Discord: https://discord.gg/coolify
- GitHub: https://github.com/coollabsio/coolify

**sslip.io Documentation:**
- https://sslip.io/

---

**Summary:** Enable HTTPS in Coolify Configuration → SSL/HTTPS settings → Redeploy → Test HTTPS URL on smartphone. Time: 5-7 minutes.