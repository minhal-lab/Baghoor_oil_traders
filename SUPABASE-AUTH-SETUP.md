# Supabase Auth Setup Guide

## ⚠️ IMPORTANT: Setup Steps Required

Before the new auth system works, you MUST configure Supabase:

---

## 🔧 Step 1: Enable Email Auth in Supabase

1. Go to: https://supabase.com/dashboard/project/druxbksscacocuclnzxs
2. Navigate to: **Authentication** → **Providers**
3. Enable **Email** provider
4. Configure email templates (optional but recommended)

---

## 📧 Step 2: Configure Email Settings

### Option A: Use Supabase Default (Quick Start)
- Already enabled
- Uses Supabase email service
- Limited to 3 emails/hour in free tier
- Good for testing

### Option B: Use Custom SMTP (Production)
1. Go to: **Authentication** → **Email Settings**
2. Add your SMTP details:
   - Host: smtp.gmail.com (or your provider)
   - Port: 587
   - Username: your-email@gmail.com
   - Password: your-app-password
3. **Recommended for production**

---

## 🔐 Step 3: Setup Row Level Security (RLS)

Run these SQL commands in Supabase SQL Editor:

```sql
-- Enable RLS on BOTs table
ALTER TABLE "BOTs" ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users to read their own organization's data
CREATE POLICY "Users can read own org data"
ON "BOTs"
FOR SELECT
TO authenticated
USING (
  -- For now, allow all authenticated users
  -- Later, add: org_id = auth.jwt() -> 'org_id'
  true
);

-- Allow authenticated users to insert/update their org's data
CREATE POLICY "Users can modify own org data"
ON "BOTs"
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- Allow public read for initial setup (remove in production)
CREATE POLICY "Allow public read during migration"
ON "BOTs"
FOR SELECT
TO anon
USING (true);
```

---

## 🎨 Step 4: Customize Email Templates (Optional)

1. Go to: **Authentication** → **Email Templates**
2. Customize:
   - **Confirm Signup** - Welcome email
   - **Magic Link** - Passwordless login
   - **Reset Password** - Password recovery
   - **Change Email** - Email change confirmation

### Example Template:
```html
<h2>Welcome to Baghoor Oil Traders!</h2>
<p>Click the link below to confirm your email:</p>
<p><a href="{{ .ConfirmationURL }}">Confirm Email</a></p>
```

---

## 🔄 Step 5: Configure URL Settings

1. Go to: **Authentication** → **URL Configuration**
2. Set **Site URL**: `http://localhost:8000` (for development)
3. Add **Redirect URLs**:
   - `http://localhost:8000`
   - `http://localhost:8000/index.html`
   - Your production domain when ready

---

## 👥 Step 6: Migrate Existing Users (After Auth is Live)

The new system will:
1. Check if user exists in Supabase Auth
2. If not, create them automatically on first login
3. Old passwords won't work (users must reset)

### Migration Options:

**Option A: Automatic Migration (Recommended)**
- Users login with old credentials
- System creates Supabase Auth account
- Sends password reset email
- User sets new password

**Option B: Manual Migration**
- Admin creates all users in Supabase
- Sends invitation emails
- Users set passwords on first login

---

## 🎯 Step 7: Test Authentication

### Test Users to Create:
```javascript
// In Supabase Dashboard → Authentication → Users
// Click "Add User" for each:

1. admin@baghoor.com (password: newadmin123)
2. manager@baghoor.com (password: newmanager123)
3. accountant@baghoor.com (password: newaccount123)
```

### Or use SQL:
```sql
-- This creates test users (run in Supabase SQL Editor)
-- Note: You'll need to confirm emails or disable email confirmation

INSERT INTO auth.users (email, encrypted_password, email_confirmed_at)
VALUES
  ('admin@baghoor.com', crypt('admin123', gen_salt('bf')), now()),
  ('manager@baghoor.com', crypt('manager123', gen_salt('bf')), now()),
  ('accountant@baghoor.com', crypt('accountant123', gen_salt('bf')), now());
```

---

## ✅ Verification Checklist

Before going live:

- [ ] Email provider enabled in Supabase
- [ ] RLS policies created on BOTs table
- [ ] Site URL configured
- [ ] Redirect URLs added
- [ ] Email templates customized (optional)
- [ ] Test users created
- [ ] Password reset flow tested
- [ ] Email verification tested
- [ ] Login/Logout tested
- [ ] Data isolation tested (if multi-tenant)

---

## 🚨 Security Notes

### Current Setup:
- ✅ Supabase Auth handles password hashing
- ✅ JWT tokens for session management
- ✅ Rate limiting on auth endpoints
- ✅ Email verification available
- ✅ Password reset available

### What You Get:
- Professional authentication
- Industry-standard security
- Automatic security updates
- No plain text passwords
- Session management
- 2FA support (can enable later)

---

## 📱 Features Available

### Included in New System:
- ✅ Email/Password login
- ✅ Email verification
- ✅ Password reset via email
- ✅ Session management
- ✅ JWT tokens
- ✅ User metadata (roles)
- ✅ Automatic logout on token expiry

### Can Add Later:
- 🔜 Social login (Google, GitHub)
- 🔜 Magic links (passwordless)
- 🔜 2FA/MFA
- 🔜 Phone authentication

---

## 🎓 How It Works

### Old System:
```
User → Enter password → Check localStorage → Login
(Passwords stored in plain text ❌)
```

### New System:
```
User → Enter password → Supabase Auth → JWT Token → Login
(Passwords hashed with bcrypt ✅)
```

### Data Flow:
```
1. User logs in
2. Supabase verifies credentials
3. Returns JWT token
4. Token stored in session
5. All requests include token
6. Supabase validates token
7. RLS policies enforce data access
```

---

## 💡 Pro Tips

### For Development:
- Disable email confirmation temporarily
- Use localhost in Site URL
- Keep Supabase logs open for debugging

### For Production:
- Enable email confirmation
- Use custom SMTP
- Set up proper redirect URLs
- Enable 2FA for admin users
- Monitor auth logs regularly

---

## 🆘 Troubleshooting

### "Email not confirmed"
- Check email templates are set up
- Check SMTP settings
- Check spam folder
- Manually confirm in Supabase dashboard

### "Invalid login credentials"
- User might not exist in Supabase Auth yet
- Old passwords don't work - need password reset
- Check email is correct

### "Site URL mismatch"
- Add URL to allowed redirects
- Check Site URL matches exactly

### "RLS policy error"
- Check RLS policies are created
- Verify user is authenticated
- Check token is valid

---

## 📞 Next Steps

After setup:
1. Test with development credentials
2. Migrate existing users
3. Train users on new login flow
4. Monitor for issues
5. Enable additional features as needed

---

**Setup Time: 30-45 minutes**
**Ready to go live!** 🚀
