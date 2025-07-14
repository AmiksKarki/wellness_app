import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wellness_app/core/route_config/route_name.dart';
import 'package:my_wellness_app/service/auth_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService _authService = AuthService();
  
  final List<Map<String, dynamic>> _quoteCategories = [
    {
      'title': 'Feeling blessed',
      'icon': Icons.wb_sunny,
    },
    {
      'title': 'Pride Month',
      'icon': Icons.favorite,
    },
    {
      'title': 'Self-worth',
      'icon': Icons.star,
    },
    {
      'title': 'Love',
      'icon': Icons.favorite_border,
    },
  ];

  final List<Map<String, dynamic>> _healthTips = [
    {
      'title': 'Breathe to Reset',
      'icon': Icons.air,
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                // Header with title and profile image
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        // Logout Button
                        GestureDetector(
                          onTap: _logout,
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 24.w,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // Admin Dashboard Button
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/admin_dashboard_screen');
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.admin_panel_settings,
                              color: Colors.white,
                              size: 24.w,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // Profile Image
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.profileScreen);
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.h,
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
                                    size: 24.w,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // My favorites and Remind Me buttons
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 16.w,
                            ),
                            SizedBox(width: 6.w),
                            Flexible(
                              child: Text(
                                'My favorites',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                              size: 16.w,
                            ),
                            SizedBox(width: 6.w),
                            Flexible(
                              child: Text(
                                'Remind Me',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // Today's Quotes section
                Text(
                  'Today\'s Quotes',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"Your wellness is an investment, not an expense."',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '- Author Name',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                // Quotes section
                Text(
                  'Quotes',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12.h),
                // Quote categories
                Column(
                  children: [
                    ..._quoteCategories.map((category) => Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/quotes');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                category['icon'],
                                color: Colors.white,
                                size: 18.w,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                category['title'],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 14.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )).toList(),
                    SizedBox(height: 16.h),
                    // Health Tips section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Health Tips',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ..._healthTips.map((tip) => Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              tip['icon'],
                              color: Colors.white,
                              size: 18.w,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              tip['title'],
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 14.w,
                            ),
                          ],
                        ),
                      ),
                    )).toList(),
                    SizedBox(height: 16.h),
                    // Products section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Products',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.productScreen);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: 18.w,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                'Browse Products',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 14.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
