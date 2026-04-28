import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:forsan_eltafe/core/appcolors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutResortCard extends StatelessWidget {
  const AboutResortCard({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // العنوان
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "الإقامة الفندقية",
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Appcolors.bluecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                height: 30.h,
                width: 4.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Appcolors.accentColor,
                      Appcolors.accentColor.withOpacity(0.5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          
          // الوصف
          Text(
            "إقامة فاخرة تجمع بين الراحة والخصوصية، مصممة لدعم رحلتك نحو التعافي النفسي في بيئة هادئة ومريحة",
            style: TextStyle(
              fontSize: 14.sp,
              color: Appcolors.bluecolor.withOpacity(0.9),
              height: 1.5,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 20.h),
          
          // المميزات
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            alignment: WrapAlignment.center,
            children: const [
              FeatureItem(icon: Icons.watch_later_outlined, text: "خدمة ٢٤ ساعة"),
              FeatureItem(icon: Icons.wifi, text: "إنترنت سريع"),
              FeatureItem(icon: Icons.bed_outlined, text: "مراتب طبية"),
              FeatureItem(icon: Icons.spa_outlined, text: "مستحضرات عضوية"),
            ],
          ),
          
          SizedBox(height: 24.h),
          
          /// 🔹 إضافة الخريطة
          _buildMapSection(),
          
          SizedBox(height: 20.h),
          
          // قسم التواصل
          _buildContactSection(),
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
              "موقع المنتجع",
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
        Text(
          "أبو صير، الجيزة، مصر",
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
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
            "تواصل مع المنتجع",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Appcolors.bluecolor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "01155665660",
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
                number: "01155665660",
                isPhone: true,
              ),
              _buildContactButton(
                icon: Icons.message_outlined,
                label: "واتساب",
                number: "01155665660",
                isPhone: false,
              ),
            ],
          ),
          SizedBox(height: 8.h),
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12.h),
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
      "https://maps.app.goo.gl/qcsqbroZMTDc86qP7?g_st=iw",
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
    String url = "https://wa.me/$number";
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      debugPrint("Could not open WhatsApp");
    }
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const FeatureItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Appcolors.greycolor.withOpacity(0.3),
            Appcolors.greycolor.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Appcolors.accentColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: Appcolors.bluecolor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 6.w),
          Icon(icon, color: Appcolors.accentColor, size: 18.r),
        ],
      ),
    );
  }
}