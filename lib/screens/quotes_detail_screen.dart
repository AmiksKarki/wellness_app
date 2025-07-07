import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuotesDetailScreen extends StatefulWidget {
  const QuotesDetailScreen({super.key});

  @override
  State<QuotesDetailScreen> createState() => _QuotesDetailScreenState();
}

class _QuotesDetailScreenState extends State<QuotesDetailScreen> {
  int _currentQuoteIndex = 0;

  final List<Map<String, String>> _quotes = [
    {
      'quote': 'The only way to do great work is to love what you do.',
      'author': 'Steve Jobs',
    },
    {
      'quote': 'Innovation distinguishes between a leader and a follower.',
      'author': 'Steve Jobs',
    },
    {
      'quote': 'Your time is limited, don\'t waste it living someone else\'s life.',
      'author': 'Steve Jobs',
    },
    {
      'quote': 'Stay hungry, stay foolish.',
      'author': 'Steve Jobs',
    },
    {
      'quote': 'The journey of a thousand miles begins with one step.',
      'author': 'Lao Tzu',
    },
    {
      'quote': 'Believe you can and you\'re halfway there.',
      'author': 'Theodore Roosevelt',
    },
  ];

  void _nextQuote() {
    setState(() {
      _currentQuoteIndex = (_currentQuoteIndex + 1) % _quotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuote = _quotes[_currentQuoteIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main content
          Column(
            children: [
              // App bar
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24.w,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        'Motivation',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          '${_currentQuoteIndex + 1}/${_quotes.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Quote content
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Quote text
                        Text(
                          '"${currentQuote['quote']!}"',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32.h),
                        // Author
                        Text(
                          '– ${currentQuote['author']}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom controls
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
                child: Column(
                  children: [
                    // Swipe up indicator
                    GestureDetector(
                      onTap: _nextQuote,
                      child: Column(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 32.w,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Swipe up',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                    // Action buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Like button
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Quote liked!'),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 28.w,
                            ),
                          ),
                        ),
                        // Share button
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Quote shared!'),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 28.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Speaker button in top right
          Positioned(
            top: 80.h,
            right: 20.w,
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.volume_up,
                color: Colors.white,
                size: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
