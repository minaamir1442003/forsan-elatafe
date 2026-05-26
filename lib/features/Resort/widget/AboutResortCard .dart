import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              SizedBox(width: 8),
              Container(
                height: 30,
                width: 4,
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
          SizedBox(height: 12),

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
          SizedBox(height: 20),

          // المميزات
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: const [
              FeatureItem(
                icon: Icons.watch_later_outlined,
                text: "خدمة ٢٤ ساعة",
              ),
              FeatureItem(icon: Icons.wifi, text: "إنترنت سريع"),
              FeatureItem(icon: Icons.bed_outlined, text: "مراتب طبية"),
              FeatureItem(icon: Icons.spa_outlined, text: "مستحضرات عضوية"),
            ],
          ),

          SizedBox(height: 24),

          _buildMedicalSection(),

          SizedBox(height: 24),

          _buildMapSection(),

          SizedBox(height: 24),

          _buildSocialSection(),

          SizedBox(height: 24),

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
            SizedBox(width: 8),
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
            height: 160,
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
                              SizedBox(height: 8),
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
                  padding: EdgeInsets.all(12),
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
        SizedBox(height: 4),
        Text(
          "أبو صير، الجيزة، مصر",
          style: TextStyle(fontSize: 11.sp, color: Colors.grey[600]),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Appcolors.accentColor.withOpacity(.05)],
        ),
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Appcolors.accentColor.withOpacity(.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "تواصل مع المنتجع",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.bluecolor,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "دعم وإشراف متاح 24 ساعة",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Appcolors.accentColor,
                    ),
                  ),
                ],
              ),

              SizedBox(width: 10),

              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Appcolors.accentColor.withOpacity(.12),
                ),
                child: Icon(
                  Icons.support_agent_rounded,
                  color: Appcolors.accentColor,
                  size: 28.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          /// Phone Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.r),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 10),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "01155665660",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.bluecolor,
                    letterSpacing: 1.2,
                  ),
                ),

                SizedBox(height: 14),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _callNumber("01155665660");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Appcolors.bluecolor,
                                Appcolors.bluecolor.withOpacity(.85),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 18.sp,
                              ),

                              SizedBox(width: 6),

                              Text(
                                "اتصال",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _openWhatsApp("01155665660");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.green.withOpacity(.8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chat,
                                color: Colors.white,
                                size: 18.sp,
                              ),

                              SizedBox(width: 6),

                              Text(
                                "واتساب",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
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

          SizedBox(height: 12),

          Text(
            "يمكنك التواصل معنا في أي وقت وسيتم الرد في أسرع وقت",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11.sp),
          ),
        ],
      ),
    );
  }

  
  Widget _buildMedicalSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Appcolors.bluecolor.withOpacity(0.08),
            Appcolors.accentColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: Appcolors.accentColor.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Appcolors.accentColor.withOpacity(.08),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "الرعاية الطبية والإشراف",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.bluecolor,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.health_and_safety, color: Appcolors.accentColor),
            ],
          ),

          SizedBox(height: 15),

          _infoRow(Icons.verified_user, "مرخص من وزارة الصحة والسكان المصرية"),

          _infoRow(Icons.medical_services, "إشراف طبي كامل على مدار الساعة"),

          _infoRow(
            Icons.psychology_alt,
            "فريق من الأطباء والأخصائيين النفسيين والمعالجين السلوكيين",
          ),

          _infoRow(Icons.workspace_premium, "خبرة تمتد لأكثر من 15 عاماً"),
        ],
      ),
    );
  }

  /// ================= SOCIAL =================
  Widget _buildSocialSection() {
    return Center(
      child: Column(
        children: [
          Text(
            "تابع المنتجع على السوشيال ميديا",
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
      
          SizedBox(height: 12),
      
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _social(
                FontAwesomeIcons.facebook,
                "https://www.facebook.com/RecoverykNightsResort/",
                Colors.blue,
              ),
      
              _social(
                FontAwesomeIcons.instagram,
                "https://www.instagram.com/recoveryknightsresortgiza/",
                Colors.purple,
              ),
      
              _social(
                FontAwesomeIcons.snapchat,
                "https://www.snapchat.com/add/recoverynights",
                Colors.amber,
              ),
      
              _social(
                FontAwesomeIcons.tiktok,
                "https://www.tiktok.com/@recoverynightsresort",
                Colors.black,
              ),
      
              _social(
                FontAwesomeIcons.youtube,
                "https://www.youtube.com/@RecoverykNightsResort",
                Colors.red,
              ),
            ],
          ),
      
          SizedBox(height: 10.h),
      
          Text(
            "اضغط على أي أيقونة للانتقال للصفحة الرسمية",
            style: TextStyle(fontSize: 11.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _social(IconData icon, String url, Color color) {
    return GestureDetector(
      onTap: () => _openUrl(url),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 10),
          ],
        ),
        child: Icon(icon, size: 28.sp, color: color),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13.sp,
                color: Appcolors.bluecolor,
                height: 1.5,
              ),
            ),
          ),

          SizedBox(width: 10),

          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Appcolors.accentColor.withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18.sp, color: Appcolors.accentColor),
          ),
        ],
      ),
    );
  }

  void _openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// فتح الخريطة في Google Maps
  void _openMap() async {
    final Uri url = Uri.parse(
      "https://maps.app.goo.gl/qcsqbroZMTDc86qP7?g_st=iw",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
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
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
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
            // ignore: deprecated_member_use
            Appcolors.greycolor.withOpacity(0.3),
            // ignore: deprecated_member_use
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
