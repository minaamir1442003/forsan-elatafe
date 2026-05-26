import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forsan_eltafe/core/appcolors.dart';
import 'package:url_launcher/url_launcher.dart';

class Conectus extends StatelessWidget {
  const Conectus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Appcolors.bluecolor,
            Appcolors.bluecolor.withOpacity(.95),
            const Color(0xFF1A3A55),
          ],
        ),
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Appcolors.accentColor.withOpacity(.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Padding(
        padding: EdgeInsets.all(18.w),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// TITLE
            Center(
              child: Text(
                "تواصل معنا",
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 25.h),

            /// WHATSAPP CARD
            Container(
              padding: EdgeInsets.all(16.w),

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.1),

                borderRadius: BorderRadius.circular(18.r),

                border: Border.all(color: Colors.green.withOpacity(.3)),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(.4),

                              blurRadius: 10,
                            ),
                          ],
                        ),

                        child: Icon(Icons.chat, color: Colors.white),
                      ),

                      Spacer(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,

                        children: [
                          Text(
                            "تواصل عبر واتساب",

                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,

                              fontSize: 15.sp,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "اضغط على أي رقم لبدء المحادثة",

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 18),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,

                    alignment: WrapAlignment.end,

                    children: [
                      _phoneChip("01105445839", "201105445839"),

                      _phoneChip("01155665660", "201155665660"),

                      _phoneChip("01105445838", "201105445838"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 18),

            /// WEBSITE CARD
            GestureDetector(
              onTap: () =>
                  _launchWebsite("https://recovery-knights.vercel.app/"),

              child: Container(
                padding: EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.1),

                  borderRadius: BorderRadius.circular(18.r),

                  border: Border.all(
                    color: Appcolors.accentColor.withOpacity(.3),
                  ),
                ),

                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: Appcolors.accentColor,

                        shape: BoxShape.circle,
                      ),

                      child: Icon(
                        Icons.public,
                        color: Appcolors.bluecolor,
                        size: 18.sp,
                      ),
                    ),

                    Spacer(),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Text(
                          "الموقع الإلكتروني",

                          style: TextStyle(
                            color: Colors.white,

                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "اضغط لزيارة الموقع",

                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _phoneChip(String phone, String internationalPhone) {
    return InkWell(
      onTap: () => _openWhatsApp(internationalPhone),

      borderRadius: BorderRadius.circular(30),

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),

        decoration: BoxDecoration(
          color: Colors.green.withOpacity(.15),

          borderRadius: BorderRadius.circular(30),

          border: Border.all(color: Colors.green),
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            Icon(Icons.chat, color: Colors.green, size: 18.sp),

            SizedBox(width: 8),

            Text(
              phone,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openWhatsApp(String phone) async {
    final Uri uri = Uri.parse("https://wa.me/$phone");

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _launchWebsite(String url) async {
    final Uri uri = Uri.parse(url);

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
