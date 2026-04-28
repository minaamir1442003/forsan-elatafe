import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forsan_eltafe/core/appcolors.dart';

class AboutElMontage extends StatefulWidget {
  const AboutElMontage({super.key});

  @override
  State<AboutElMontage> createState() => _AboutElMontageState();
}

class _AboutElMontageState extends State<AboutElMontage> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    String description =
        "مرحبًا بكم في مؤسسة فرسان التعافي، ملاذكم المتخصص في العلاج النفسي وعلاج الإدمان وإعادة التأهيل السلوكي. "
        "نقدم خدمات طبية ونفسية شاملة وآمنة بأعلى معايير الجودة، مع فريق من الأطباء والأخصائيين بخبرة تتجاوز 20 عامًا. "
        "نحرص على توفير بيئة علاجية آمنة تحترم الخصوصية، ونسعى إلى إحداث تغيير حقيقي في حياة النزلاء من خلال برامج علاجية عالمية متكاملة.";

    String shortText = description.length > 100
        ? "${description.substring(0, 100)}..."
        : description;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            // ignore: deprecated_member_use
            Colors.white.withOpacity(0.95),
            const Color(0xFFF8F9FA),
          ],
        ),
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Appcolors.accentColor.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// 🔹 Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          // ignore: deprecated_member_use
                          Appcolors.accentColor.withOpacity(0.1),
                          // ignore: deprecated_member_use
                          Appcolors.accentColor.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        // ignore: deprecated_member_use
                        color: Appcolors.accentColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      _expanded ? "عرض أقل" : "عرض المزيد",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Appcolors.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "عن مؤسسة فرسان التعافي",
                      style: TextStyle(
                        color: Appcolors.bluecolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      height: 20.w,
                      width: 5.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Appcolors.accentColor,
                            // ignore: deprecated_member_use
                            Appcolors.accentColor.withOpacity(0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 15.h),

            /// 🔹 Image with shadow
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/image/abut monatge.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180.h,
                ),
              ),
            ),

            SizedBox(height: 15.h),

            /// 🔹 Title with accent border
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Appcolors.accentColor,
                    width: 3.w,
                  ),
                ),
              ),
              child: Text(
                "مؤسسة متخصصة في الطب النفسي وعلاج الإدمان",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Appcolors.bluecolor,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
            ),

            SizedBox(height: 12.h),

            /// 🔹 Description
            Text(
              _expanded ? description : shortText,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14.sp,
                // ignore: deprecated_member_use
                color: Appcolors.bluecolor.withOpacity(0.9),
                height: 1.6,
              ),
            ),

            SizedBox(height: 20.h),

            /// 🔹 Divider with star
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.transparent,
                          Appcolors.greycolor,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        // ignore: deprecated_member_use
                        Appcolors.accentColor.withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.stars_outlined,
                    color: Appcolors.accentColor,
                    size: 20.sp,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.transparent,
                          Appcolors.greycolor,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.h),

            /// 🔹 Features Row with enhanced design
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFeatureItem(
                  icon: Icons.shield,
                  text: "مرخص من وزارة الصحة",
                ),
                _buildFeatureItem(
                  icon: Icons.workspace_premium,
                  text: "خصوصية تامة",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // ignore: deprecated_member_use
            Appcolors.accentColor.withOpacity(0.1),
            // ignore: deprecated_member_use
            Appcolors.accentColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          // ignore: deprecated_member_use
          color: Appcolors.accentColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 11.sp,
              color: Appcolors.bluecolor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 6.w),
          Icon(
            icon,
            size: 16.sp,
            color: Appcolors.accentColor,
          ),
        ],
      ),
    );
  }
}