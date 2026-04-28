import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forsan_eltafe/core/appcolors.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutmedical extends StatelessWidget {
  const Aboutmedical({super.key});

  @override
Widget build(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white,
          Colors.white.withOpacity(0.95),
          const Color(0xFFF8F9FA),
        ],
      ),
      borderRadius: BorderRadius.circular(25.r),
      boxShadow: [
        BoxShadow(
          color: Appcolors.accentColor.withOpacity(0.2),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    padding: EdgeInsets.all(20.w),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "عن صرحنا الطبي",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.bluecolor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "بيئة آمنة للتعافي المستدام",
                  style: TextStyle(
                    color: Appcolors.accentColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Appcolors.accentColor.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Icon(
                  Icons.security_rounded,
                  size: 28.sp,
                  color: Appcolors.accentColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Text(
          "تعتبر وحدة فرسان التعافي صرحاً طبياً متخصصاً يهدف إلى تقديم أرقى مستويات الرعاية النفسية وعلاج الإدمان. نلتزم بتوفير بيئة آمنة ومهنية تساعد المرضى على رحلة التعافي واستعادة توازنهم النفسي والاجتماعي.",
          style: TextStyle(
            fontSize: 14.sp,
            height: 1.6,
            color: Appcolors.bluecolor.withOpacity(0.9),
            letterSpacing: 0.3,
          ),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 20.h),
        
        /// 🔹 إضافة الخريطة
        _buildMapSection(),
        
        SizedBox(height: 20.h),
        
        /// 🔹 إضافة رقم التواصل
        _buildContactInfo(),
      ],
    ),
  );
}

  /// قسم الخريطة
  Widget _buildMapSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "موقع الوحدة الطبية",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Appcolors.bluecolor,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.location_on_outlined,
              size: 18.sp,
              color: Appcolors.accentColor,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: _openMap,
          child: Container(
            height: 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // صورة الخريطة (يمكنك استبدالها بصورة حقيقية للخريطة)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    "assets/image/Map location of Abu Sir.png", // ضع صورة الخريطة هنا
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      // في حالة عدم وجود الصورة، نعرض خلفية رمادية مع نص
                      return Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.map_outlined,
                                size: 40.sp,
                                color: Colors.grey[400],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "اضغط لعرض الموقع على الخريطة",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // علامة الموقع
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.location_on,
                    size: 28.sp,
                    color: Appcolors.accentColor,
                  ),
                ),
                // تدرج خفيف لتحسين ظهور العلامة
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 4.h),
        
      ],
    );
  }

  Widget _buildContactInfo() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Appcolors.accentColor.withOpacity(0.1),
            Appcolors.accentColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Appcolors.accentColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            "تواصل مع الوحدة الطبية",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Appcolors.bluecolor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "01105445838",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Appcolors.bluecolor,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContactButton(
                icon: Icons.phone_in_talk_outlined,
                label: "اتصال",
                number: "01105445838",
                isPhone: true,
              ),
              _buildContactButton(
                icon: Icons.message_outlined,
                label: "واتساب",
                number: "01105445838",
                isPhone: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required String number,
    required bool isPhone,
  }) {
    return GestureDetector(
      onTap: () {
        if (isPhone) {
          _callNumber(number);
        } else {
          _openWhatsApp(number);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Appcolors.bluecolor,
              Appcolors.bluecolor.withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Appcolors.accentColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// فتح الخريطة في Google Maps
  void _openMap() async {
    final Uri url = Uri.parse(
      "https://maps.app.goo.gl/26ZPdXBa6eiPmLi3A?g_st=ipc",
    );
    
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      debugPrint("Could not open map");
      // يمكن إضافة SnackBar للمستخدم
    }
  }

void _callNumber(String number) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    debugPrint("Call result: $res");
  }

void _openWhatsApp(String number) async {
  String internationalNumber = "2$number"; // مصر = 20

  final Uri whatsappUri = Uri.parse(
    "https://wa.me/$internationalNumber",
  );

  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(
      whatsappUri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    debugPrint("Could not open WhatsApp");
  }
}
}