import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> _makeItYoursOptions = [
    {
      'title': 'Content preferences',
      'icon': Icons.book,
    },
  ];

  final List<Map<String, dynamic>> _accountOptions = [
    {
      'title': 'Theme',
      'icon': Icons.edit,
    },
    {
      'title': 'Forgot Password',
      'icon': Icons.lock,
    },
    {
      'title': 'Logout',
      'icon': Icons.logout,
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
                          'Amiks Karki',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'karkiamiks02@gmail.com',
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
                    if (option['title'] == 'Logout') {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
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