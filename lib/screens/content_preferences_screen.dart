import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentPreferencesScreen extends StatefulWidget {
  const ContentPreferencesScreen({super.key});

  @override
  State<ContentPreferencesScreen> createState() => _ContentPreferencesScreenState();
}

class _ContentPreferencesScreenState extends State<ContentPreferencesScreen> {
  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'Meditation & Mindfulness',
      'icon': Icons.self_improvement,
      'isSelected': false,
    },
    {
      'title': 'Exercise & Fitness',
      'icon': Icons.fitness_center,
      'isSelected': false,
    },
    {
      'title': 'Nutrition & Diet',
      'icon': Icons.restaurant,
      'isSelected': false,
    },
    {
      'title': 'Sleep & Recovery',
      'icon': Icons.bedtime,
      'isSelected': false,
    },
    {
      'title': 'Mental Health',
      'icon': Icons.psychology,
      'isSelected': false,
    },
    {
      'title': 'Stress Management',
      'icon': Icons.spa,
      'isSelected': false,
    },
    {
      'title': 'Yoga & Stretching',
      'icon': Icons.accessibility_new,
      'isSelected': false,
    },
    {
      'title': 'Motivational Quotes',
      'icon': Icons.format_quote,
      'isSelected': false,
    },
  ];

  void _savePreferences() {
    final selectedCategories = _categories
        .where((category) => category['isSelected'] == true)
        .map((category) => category['title'])
        .toList();

    if (selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select at least one category'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // TODO: Save preferences to Firebase/local storage
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Preferences saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Content Preferences',
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
              SizedBox(height: 24.h),
              Text(
                'Customize your wellness journey',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Select topics you\'re interested in to personalize your content',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 32.h),
              Expanded(
                child: ListView.builder(
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            category['isSelected'] = !category['isSelected'];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: category['isSelected'] 
                              ? Color(0xFF4CAF50).withOpacity(0.2)
                              : Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: category['isSelected'] 
                                ? Color(0xFF4CAF50)
                                : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                category['icon'],
                                color: category['isSelected'] 
                                  ? Color(0xFF4CAF50)
                                  : Colors.white,
                                size: 24.w,
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Text(
                                  category['title'],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: category['isSelected'] 
                                      ? Color(0xFF4CAF50)
                                      : Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (category['isSelected'])
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF4CAF50),
                                  size: 24.w,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _savePreferences,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Save Preferences',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
