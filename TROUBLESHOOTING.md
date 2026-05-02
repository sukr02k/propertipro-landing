# TROUBLESHOOTING: "No Available Server" Error

## Error Message
```
no available server
```

This error appears when Coolify cannot reach your application container.

---

## POSSIBLE CAUSES

### 1. Container Stopped/Crashed ❌
**Most Common Cause**

#### Check:
- Coolify Dashboard → Application → Status
- Look for "Stopped" or "Error" status

#### Fix:
```
1. Click "Restart" button in Coolify
2. Check deployment logs for errors
3. If still fails, check container logs
```

---

### 2. Port Configuration Wrong ❌

#### Check:
- Coolify Dashboard → Application → Configuration → Port
- Should be: `80` (for Nginx)

#### Fix:
```
1. Set port to 80
2. Save configuration
3. Redeploy
```

---

### 3. Resource Limits Exceeded ❌

#### Check:
- Coolify Dashboard → Application → Configuration → Resources
- Memory limit too low?

#### Fix:
```
Memory: Set to 256MB or 512MB minimum
CPU: Set to 0.5 core minimum
```

---

### 4. Health Check Failed ❌

#### Check:
- Coolify Dashboard → Application → Configuration → Health Check
- Is health check enabled?

#### Fix:
```
Option A: Disable health check (simple)
Option B: Configure proper health check path:
  - Path: /
  - Port: 80
  - Interval: 30s
```

---

### 5. Build Failed ❌

#### Check:
- Coolify Dashboard → Application → Deployment Logs
- Look for build errors

#### Common Build Errors:
```
- Dockerfile syntax error
- Missing files
- Nixpacks detection failed
```

#### Fix:
```
Check logs, identify error, fix Dockerfile or build config
```

---

### 6. Network Issue ❌

#### Check:
- VPS firewall rules
- Coolify proxy configuration

#### Fix:
```
Ensure port 80/443 open in firewall:
  sudo ufw allow 80
  sudo ufw allow 443
```

---

## QUICK FIX STEPS

### Step 1: Restart Application
```
Coolify Dashboard → Application → Restart button
Wait 1-2 minutes
Check if error resolved
```

### Step 2: Check Logs
```
Coolify Dashboard → Application → Logs
Look for error messages
Identify root cause
```

### Step 3: Check Configuration
```
Port: 80 ✓
Build Pack: Nixpacks or Docker ✓
Resources: Memory 256MB+, CPU 0.5+ ✓
Health Check: Disabled or configured ✓
```

### Step 4: Redeploy
```
Coolify Dashboard → Application → Deploy
Wait 2-3 minutes
Check deployment logs
```

---

## COMMON FIXES BY BUILD PACK

### Nixpacks (Static Files)
```
Configuration:
- Build Pack: Nixpacks
- Port: 80 (auto-detect)
- No Dockerfile needed

If fails:
- Try Docker build pack instead
```

### Docker (Custom Dockerfile)
```
Configuration:
- Build Pack: Docker
- Dockerfile: Provided
- Port: 80 (EXPOSE in Dockerfile)

If fails:
- Check Dockerfile syntax
- Verify EXPOSE 80
- Check nginx.conf (if custom)
```

---

## RECOMMENDED SETTINGS

```
Build Pack: Docker (more reliable)
Port: 80
Memory: 512MB
CPU: 0.5 cores
Health Check: Disabled (for static sites)
Auto-deploy: Enabled
```

---

## CHECK CONTAINER STATUS

### Via Coolify Dashboard:
```
Application → Status
- Running ✓
- Stopped ❌
- Error ❌
```

### Via SSH (if accessible):
```bash
# List containers
docker ps

# Check specific container
docker logs <container-id>

# Restart container
docker restart <container-id>
```

---

## VERIFICATION STEPS

After fix, verify:

1. **Status**: Running
2. **URL**: Accessible
3. **Logs**: No errors
4. **Health**: Healthy (if enabled)
5. **Response**: HTML returned

---

## IF STILL FAILS

### Try Clean Redeploy:
```
1. Delete application in Coolify
2. Create new application
3. Git Repository: https://github.com/sukr02k/propertipro-landing
4. Build Pack: Docker
5. Port: 80
6. Deploy
```

### Try Alternative Build Pack:
```
If Nixpacks fails → Try Docker
If Docker fails → Try Static (if available)
```

---

## CONTACT SUPPORT

If all above fail:
- Coolify Discord: https://discord.gg/coolify
- Coolify GitHub: https://github.com/coollabsio/coolify/issues
- Check Coolify docs: https://coolify.io/docs

---

## EXPECTED RESULT

After successful deployment:
```
Status: Running
URL: Working
HTML: Loaded
Screenshots: Accessible
No "no available server" error
```

---

## QUICK DIAGNOSTIC COMMANDS (SSH)

If you have SSH access to VPS:

```bash
# Check Coolify status
docker ps | grep coolify

# Check application container
docker ps | grep propertipro

# Check container logs
docker logs <container-name>

# Check nginx
docker exec <container-name> nginx -t

# Restart container
docker restart <container-name>

# Check port
netstat -tulpn | grep :80
```

---

**Most likely fix: Restart application in Coolify dashboard**