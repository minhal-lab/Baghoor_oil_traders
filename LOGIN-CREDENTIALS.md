# 🔐 Baghoor Oil Traders - Login Credentials

## System Access Information

**Important:** Login is now REQUIRED every time you open the application for enhanced security.

---

## 📝 Default Login Credentials

### 1. Admin Account (Full Access)
```
Username: admin
Password: admin123
Role: Administrator
```

**Permissions:**
- ✅ Full access to all features
- ✅ Can view and edit everything
- ✅ Can manage users (add/edit/delete)
- ✅ Can access admin settings
- ✅ Can clear all data
- ✅ Can view all reports

---

### 2. Manager Account (Management Access)
```
Username: manager
Password: manager123
Role: Manager
```

**Permissions:**
- ✅ Can view all data
- ✅ Can create/edit transactions
- ✅ Can manage customers and suppliers
- ✅ Can generate reports
- ✅ Can view ledgers
- ❌ Cannot manage users
- ❌ Cannot access admin settings

---

### 3. Accountant Account (Limited Access)
```
Username: accountant
Password: accountant123
Role: Accountant
```

**Permissions:**
- ✅ Can view transactions
- ✅ Can create transactions
- ✅ Can generate reports
- ✅ Can view ledgers
- ❌ Cannot delete transactions
- ❌ Cannot manage users
- ❌ Cannot clear data

---

## 🔒 Security Features Enabled

### ✅ What Changed (November 5, 2025):

1. **Auto-Login DISABLED**
   - Users must log in every time they open the application
   - Previous sessions are NOT saved
   - Login screen appears on every page load

2. **Session Security**
   - No persistent login sessions
   - Closing browser/tab requires re-login
   - Refreshing page requires re-login

3. **Data Protection**
   - Login required to access any data
   - Credentials validated against system users
   - Invalid login attempts show error message

---

## 🛠️ How to Change Passwords

### Method 1: Through Admin Panel (Recommended)

1. **Login as admin**
2. Click on **"⚙️ Settings"** (top right)
3. Click **"👥 User Management"**
4. Find the user you want to change
5. Click **"🔐 Change Password"**
6. Enter new password
7. Click OK

### Method 2: Edit Code Directly

⚠️ **Not recommended unless you're a developer**

1. Open `index.html` in text editor
2. Search for: `DEFAULT_USERS`
3. Find line ~2041-2044
4. Change the password value
5. Save file

**Example:**
```javascript
const DEFAULT_USERS = [
    { id: 'user_1', username: 'admin', password: 'YOUR_NEW_PASSWORD', role: 'admin', createdAt: new Date().toISOString() },
    // ... other users
];
```

---

## 👥 How to Add New Users

### Option 1: Through Admin Panel

1. **Login as admin**
2. Go to **Settings → User Management**
3. Click **"+ Add New User"**
4. Enter username, password, and select role
5. Click **Save**

### Option 2: Quick Reference

New users can also be added programmatically by admins through the user management interface in the application.

---

## 🔐 Password Security Best Practices

### ⚠️ IMPORTANT: Change Default Passwords!

The default passwords (`admin123`, `manager123`, `accountant123`) should be changed immediately for security.

### Recommended Password Guidelines:

1. **Minimum Length:** 8 characters
2. **Include:**
   - Uppercase letters (A-Z)
   - Lowercase letters (a-z)
   - Numbers (0-9)
   - Special characters (!@#$%^&*)

3. **Examples of Strong Passwords:**
   - `Baghoor@2025!`
   - `OilTrade$Secure99`
   - `MyP@ssw0rd2025`

### What NOT to Use:
- ❌ Common words (password, 123456)
- ❌ Personal info (names, birthdays)
- ❌ Sequential characters (abc123, qwerty)

---

## 🚨 Security Warnings

### ⚠️ If You Forget Your Password:

**There is NO password recovery option!**

If you forget the admin password:
1. You'll need to edit the code manually
2. OR restore from a backup
3. OR recreate the user database

**Prevention:**
- Write down admin password in a safe place
- Keep a backup of the credentials
- Don't share admin credentials

---

## 📊 User Role Comparison

| Feature | Admin | Manager | Accountant |
|---------|-------|---------|------------|
| View Data | ✅ | ✅ | ✅ |
| Create Transactions | ✅ | ✅ | ✅ |
| Edit Transactions | ✅ | ✅ | ❌ |
| Delete Transactions | ✅ | ✅ | ❌ |
| Manage Customers | ✅ | ✅ | ❌ |
| Manage Suppliers | ✅ | ✅ | ❌ |
| View Reports | ✅ | ✅ | ✅ |
| Generate Ledgers | ✅ | ✅ | ✅ |
| User Management | ✅ | ❌ | ❌ |
| Admin Settings | ✅ | ❌ | ❌ |
| Clear All Data | ✅ | ❌ | ❌ |

---

## 🔄 Login Process

### How It Works:

1. **Open Application:**
   - Website loads
   - Login screen appears
   - No data is visible

2. **Enter Credentials:**
   - Type username
   - Type password
   - Select role (optional - auto-detected)

3. **Click Login:**
   - System validates credentials
   - If correct: Dashboard loads ✅
   - If incorrect: Error message ❌

4. **Work Session:**
   - Use application normally
   - All features available based on role
   - Data saves automatically

5. **End Session:**
   - Close browser/tab
   - OR click "Logout" button
   - Next time: Must login again

---

## 💡 Pro Tips

### Tip 1: Use Admin for Setup
Start with admin account to:
- Set up initial data
- Create custom users
- Configure settings

### Tip 2: Create Role-Based Users
For team members:
- Give managers their own accounts
- Give accountants limited access
- Track who made what changes

### Tip 3: Change Passwords Regularly
Security best practice:
- Change admin password monthly
- Update all passwords quarterly
- Remove old user accounts

### Tip 4: Keep Credentials Safe
Store securely:
- Use password manager
- Write in secure notebook
- Don't share via email/WhatsApp

### Tip 5: Log Out When Done
Security measure:
- Click logout before closing
- Prevents unauthorized access
- Good security habit

---

## 🆘 Troubleshooting Login Issues

### Problem 1: "Invalid username or password"

**Solution:**
- Check caps lock is OFF
- Verify username is correct (lowercase)
- Try default credentials first
- Username: `admin` Password: `admin123`

---

### Problem 2: Login screen doesn't appear

**Solution:**
1. Clear browser cache (Ctrl + Shift + Delete)
2. Hard refresh (Ctrl + Shift + R)
3. Close and reopen browser
4. Try different browser

---

### Problem 3: Forgot admin password

**Solution:**
1. Open `index.html` in text editor
2. Search for: `DEFAULT_USERS`
3. Find admin line (~2041)
4. Change password to something you remember
5. Save and reload page

---

### Problem 4: Cannot create new users

**Solution:**
- Must be logged in as **admin** role
- Other roles cannot manage users
- Check you're in User Management section

---

## 📅 Quick Reference Card

**Print this and keep handy:**

```
═══════════════════════════════════════
  BAGHOOR OIL TRADERS - LOGIN INFO
═══════════════════════════════════════

ADMIN ACCESS:
  Username: admin
  Password: admin123

MANAGER ACCESS:
  Username: manager
  Password: manager123

ACCOUNTANT ACCESS:
  Username: accountant
  Password: accountant123

SUPPORT:
  - Login required every time
  - Change passwords in Settings
  - Contact admin for help

═══════════════════════════════════════
```

---

## 🔄 Version History

### Version 1.1 - November 5, 2025
- ✅ Disabled auto-login feature
- ✅ Enabled mandatory login on every access
- ✅ Improved security by clearing sessions
- ✅ Login required to view any data

### Version 1.0 - October 26, 2025
- Initial release with auto-login enabled
- Basic user authentication

---

## ⚡ Quick Start for First Time Users

```
1. Open the application
   ↓
2. You'll see login screen
   ↓
3. Enter: admin / admin123
   ↓
4. Click Login
   ↓
5. Dashboard opens - You're in! ✅
   ↓
6. Go to Settings → Change admin password
   ↓
7. Create users for your team members
   ↓
8. Start using the system!
```

---

**🔐 Security is ON! Login Required for Every Access.**

---

*Last Updated: November 5, 2025*
*Login Required Feature - Enabled*
*Document Version: 1.0*
