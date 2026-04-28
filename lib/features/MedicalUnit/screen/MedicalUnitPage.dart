import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forsan_eltafe/core/appcolors.dart';
import 'package:forsan_eltafe/features/MedicalUnit/widget/Aboutmedical.dart';
import 'package:forsan_eltafe/features/MedicalUnit/widget/Medical_cards.dart';
import 'package:forsan_eltafe/features/MedicalUnit/widget/VideoWidget.dart';
import 'package:forsan_eltafe/features/MedicalUnit/widget/daily_schedule.dart';
import 'package:forsan_eltafe/features/MedicalUnit/widget/vision_section.dart';

class MedicalUnitPage extends StatefulWidget {
  @override
  State<MedicalUnitPage> createState() => _MedicalUnitPageState();
}

class _MedicalUnitPageState extends State<MedicalUnitPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth > 500 ? 30 : 20;
    
    return Scaffold(
      backgroundColor: Appcolors.greycolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  VideoWidget(),
                  SizedBox(height: 20),
                  _buildHeaderSection(),
                  SizedBox(height: 20),
                  MedicalCards(),
                  SizedBox(height: 20),
                  Aboutmedical(),
                  SizedBox(height: 20),
                  TaskTimelineWidget(),
                  SizedBox(height: 20),
                  VisionSection(),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.95),
          ],
        ),
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Appcolors.accentColor.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "وحده فرسان التعافي",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Appcolors.bluecolor,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "للطب النفسي و علاج الادمان",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Appcolors.accentColor,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 80.w,
            height: 3.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Appcolors.accentColor,
                  Appcolors.accentColor.withOpacity(0.3),
                ],
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ],
      ),
    );
  }
}