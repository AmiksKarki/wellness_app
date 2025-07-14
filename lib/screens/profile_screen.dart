import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_wellness_app/service/auth_service.dart';
import 'package:my_wellness_app/core/route_config/route_name.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _authService = AuthService();
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = _authService.currentUser;
  }

  void _logout() async {
    try {
      await _authService.signOut();
      // Navigation will be handled by AuthWrapper automatically
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error signing out: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _forgotPassword() async {
    if (_currentUser?.email != null) {
      try {
        await _authService.sendPasswordResetEmail(email: _currentUser!.email!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password reset email sent successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _getUserDisplayName() {
    if (_currentUser?.displayName != null && _currentUser!.displayName!.isNotEmpty) {
      return _currentUser!.displayName!;
    } else if (_currentUser?.email != null) {
      // Extract name from email (everything before @)
      String emailPrefix = _currentUser!.email!.split('@')[0];
      // Capitalize first letter
      return emailPrefix.substring(0, 1).toUpperCase() + emailPrefix.substring(1);
    }
    return 'User';
  }

  String _getUserEmail() {
    return _currentUser?.email ?? 'No email';
  }

  final List<Map<String, dynamic>> _makeItYoursOptions = [
    {
      'title': 'Content preferences',
      'icon': Icons.book,
      'onTap': 'content_preferences',
    },
  ];

  final List<Map<String, dynamic>> _accountOptions = [
    {
      'title': 'Theme',
      'icon': Icons.edit,
      'onTap': null,
    },
    {
      'title': 'Forgot Password',
      'icon': Icons.lock,
      'onTap': 'forgot_password',
    },
    {
      'title': 'Logout',
      'icon': Icons.logout,
      'onTap': 'logout',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24.w,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              // Profile Info Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/bachaamiks.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              color: Colors.grey.shade600,
                              size: 40.w,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getUserDisplayName(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          _getUserEmail(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              // Make It Yours Section
              Text(
                'MAKE IT YOURS',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 16.h),
              ..._makeItYoursOptions.map((option) => Container(
                margin: EdgeInsets.only(bottom: 12.h),
                child: GestureDetector(
                  onTap: () {
                    if (option['onTap'] == 'content_preferences') {
                      Navigator.pushNamed(context, RoutesName.contentPreferencesScreen);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          option['icon'],
                          color: Colors.white,
                          size: 20.w,
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          option['title'],
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.w,
                        ),
                      ],
                    ),
                  ),
                ),
              )).toList(),
              SizedBox(height: 32.h),
              // Account Section
              Text(
                'ACCOUNT',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 16.h),
              ..._accountOptions.map((option) => Container(
                margin: EdgeInsets.only(bottom: 12.h),
                child: GestureDetector(
                  onTap: () {
                    if (option['onTap'] == 'logout') {
                      _logout();
                    } else if (option['onTap'] == 'forgot_password') {
                      _forgotPassword();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          option['icon'],
                          color: Colors.white,
                          size: 20.w,
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          option['title'],
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.w,
                        ),
                      ],
                    ),
                  ),
                ),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}