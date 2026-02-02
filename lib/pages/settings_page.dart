import 'package:book_shop/theme/colors.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkModeEnabled ? Colors.grey[900] : Colors.transparent,
      appBar: AppBar(
        backgroundColor: _darkModeEnabled ? Colors.grey[800] : appBgColor,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(color: _darkModeEnabled ? Colors.white : primary, fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: _darkModeEnabled ? Colors.white : primary),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Account'),
            _buildSettingItem(
              'Profile',
              Icons.person_outline,
              onTap: () => _showProfileDialog(),
              isDark: _darkModeEnabled,
            ),
            _buildSettingItem(
              'Change Password',
              Icons.lock_outline,
              onTap: () => _showChangePasswordDialog(),
              isDark: _darkModeEnabled,
            ),
            SizedBox(height: 30),
            _buildSectionTitle('Preferences'),
            _buildSwitchItem(
              'Push Notifications',
              Icons.notifications_outlined,
              _notificationsEnabled,
              (value) {
                setState(() => _notificationsEnabled = value);
                _showMessage(_notificationsEnabled ? 'Notifications enabled' : 'Notifications disabled');
              },
            ),
            _buildSwitchItem(
              'Dark Mode',
              Icons.dark_mode_outlined,
              _darkModeEnabled,
              (value) {
                setState(() => _darkModeEnabled = value);
                _showMessage(_darkModeEnabled ? 'Dark mode enabled' : 'Dark mode disabled');
                // In a real app, you would update the theme here
              },
            ),
            _buildDropdownItem(
              'Language',
              Icons.language,
              _selectedLanguage,
              ['English', 'Spanish', 'French', 'German'],
              (value) {
                setState(() => _selectedLanguage = value!);
                _showMessage('Language changed to $value');
              },
            ),
            _buildDropdownItem(
              'Currency',
              Icons.attach_money,
              _selectedCurrency,
              ['USD', 'EUR', 'GBP', 'JPY'],
              (value) {
                setState(() => _selectedCurrency = value!);
                _showMessage('Currency changed to $value');
              },
            ),
            SizedBox(height: 30),
            _buildSectionTitle('Support'),
            _buildSettingItem(
              'Help & Support',
              Icons.help_outline,
              onTap: () => _showHelpDialog(),
              isDark: _darkModeEnabled,
            ),
            _buildSettingItem(
              'About',
              Icons.info_outline,
              onTap: () => _showAboutDialog(),
              isDark: _darkModeEnabled,
            ),
            _buildSettingItem(
              'Privacy Policy',
              Icons.privacy_tip_outlined,
              onTap: () => _showPrivacyDialog(),
              isDark: _darkModeEnabled,
            ),
            SizedBox(height: 30),
            _buildSectionTitle('Account Actions'),
            _buildSettingItem(
              'Logout',
              Icons.logout,
              color: Colors.red,
              onTap: () => _showLogoutDialog(),
              isDark: _darkModeEnabled,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: _darkModeEnabled ? Colors.white : primary,
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon, {
    VoidCallback? onTap,
    Color? color,
    bool isDark = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: color ?? (isDark ? Colors.white : primary)),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: color ?? (isDark ? Colors.white : Colors.black87),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: isDark ? Colors.white70 : Colors.grey),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchItem(String title, IconData icon, bool value, Function(bool) onChanged, {bool isDark = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: isDark ? Colors.white : primary),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: primary,
        ),
      ),
    );
  }

  Widget _buildDropdownItem(String title, IconData icon, String value,
      List<String> options, Function(String?) onChanged, {bool isDark = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: isDark ? Colors.white : primary),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        trailing: DropdownButton<String>(
          value: value,
          dropdownColor: isDark ? Colors.grey[800] : Colors.white,
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option, style: TextStyle(color: isDark ? Colors.white : Colors.black87)),
            );
          }).toList(),
          onChanged: onChanged,
          underline: SizedBox(),
        ),
      ),
    );
  }

  void _showRestartDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Theme Changed'),
        content: Text('The app needs to restart to apply the theme change. Please restart the app manually.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Profile Settings'),
        content: Text('Profile settings functionality will be implemented soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Password'),
        content: Text('Password change functionality will be implemented soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Help & Support'),
        content: Text('Help and support functionality will be implemented soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('About BookStore'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Version: 1.0.0'),
            SizedBox(height: 10),
            Text('A beautiful book shopping app built with Flutter.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Privacy Policy'),
        content: Text('Privacy policy content would be displayed here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (context) => LoginPage()),
  (Route<dynamic> route) => false, 
);
              _showMessage('Logged out successfully');
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _showMessage(String message) {
    // Use Future.delayed to ensure the dialog context is cleared
    Future.delayed(Duration.zero, () {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }
}