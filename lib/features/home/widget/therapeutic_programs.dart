import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forsan_eltafe/core/appcolors.dart';

class TherapeuticPrograms extends StatefulWidget {
  const TherapeuticPrograms({super.key});

  @override
  State<TherapeuticPrograms> createState() => _TherapeuticProgramsState();
}

class _TherapeuticProgramsState extends State<TherapeuticPrograms> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> programs = [
    {
      "title": "برنامج الماتريكس",
      "sub": "Matrix Program",
      "icon": Icons.psychology_alt_rounded,
      "desc":
          "برنامج علاجي متكامل يعتمد على الإرشاد السلوكي والتعليم النفسي وإدارة الانتكاسة ويُعد من أكثر البرامج فعالية لعلاج إدمان المنشطات.",

      "colors": [Color(0xff0F4C81), Color(0xff4B86B4)],
    },

    {
      "title": "العلاج المعرفي السلوكي",
      "sub": "CBT",
      "icon": Icons.lightbulb_outline_rounded,
      "desc":
          "يهدف إلى تعديل أنماط التفكير والسلوك غير الصحية ومساعدة المريض على اكتساب مهارات جديدة للتعامل مع الضغوط.",

      "colors": [Color(0xff7F00FF), Color(0xffB16CEA)],
    },

    {
      "title": "العلاج الجدلي السلوكي",
      "sub": "DBT",
      "icon": Icons.favorite_border_rounded,
      "desc":
          "برنامج متطور لدعم المصابين باضطرابات الشخصية والانفعالات وتحسين العلاقات وتنظيم المشاعر.",

      "colors": [Color(0xffFF416C), Color(0xffFF6A88)],
    },

    {
      "title": "برنامج الخطوات الاثنتي عشرة",
      "sub": "12 Step",
      "icon": Icons.groups_rounded,
      "desc":
          "أحد أشهر النماذج العلاجية في العالم يعتمد على الدعم الجماعي والنمو النفسي والروحي.",

      "colors": [Color(0xff11998E), Color(0xff38EF7D)],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),

        gradient: LinearGradient(colors: [Colors.white, Color(0xffF6F8FC)]),

        boxShadow: [
          BoxShadow(
            color: Appcolors.accentColor.withOpacity(.15),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          /// HEADER
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  gradient: LinearGradient(
                    colors: [
                      Appcolors.accentColor,
                      Appcolors.accentColor.withOpacity(.6),
                    ],
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Appcolors.accentColor.withOpacity(.4),

                      blurRadius: 12,
                    ),
                  ],
                ),

                child: Icon(Icons.medical_services, color: Appcolors.bluecolor),
              ),

              Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Text(
                    "البرامج العلاجية",

                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.bluecolor,
                    ),
                  ),

                  Text(
                    "برامج مصممة خصيصاً لكل حالة",

                    style: TextStyle(fontSize: 13.sp, color: const Color.fromARGB(255, 100, 97, 97)),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 25),

          ...List.generate(programs.length, (index) {
            bool selected = selectedIndex == index;

            List<Color> cardColors = List<Color>.from(
              programs[index]['colors'],
            );

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = selected ? -1 : index;
                });
              },

              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),

                margin: EdgeInsets.only(bottom: 18.h),

                padding: EdgeInsets.all(16.w),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),

                  gradient: LinearGradient(
                    begin: Alignment.topLeft,

                    end: Alignment.bottomRight,

                    colors: selected
                        ? cardColors
                        : [Colors.white, Colors.grey.shade50],
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: selected
                          ? cardColors.first.withOpacity(.4)
                          : Colors.grey.withOpacity(.33),

                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        AnimatedRotation(
                          turns: selected ? .5 : 0,

                          duration: Duration(milliseconds: 400),

                          child: Icon(
                            Icons.keyboard_arrow_down,

                            color: selected
                                ? Colors.white
                                : Appcolors.bluecolor,
                          ),
                        ),

                        Spacer(),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Text(
                              programs[index]['title'],

                              style: TextStyle(
                                fontWeight: FontWeight.bold,

                                fontSize: 14.sp,

                                color: selected
                                    ? Colors.white
                                    : Appcolors.bluecolor,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              programs[index]['sub'],

                              style: TextStyle(
                                color: selected ? Colors.white70 : Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: 15),

                        Container(
                          padding: EdgeInsets.all(14),

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            color: selected
                                ? Colors.white.withOpacity(.2)
                                : cardColors.first,

                            boxShadow: [
                              BoxShadow(
                                color: cardColors.first.withOpacity(.5),

                                blurRadius: 12,
                              ),
                            ],
                          ),

                          child: Icon(
                            programs[index]['icon'],

                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    AnimatedCrossFade(
                      duration: Duration(milliseconds: 500),

                      crossFadeState: selected
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,

                      firstChild: SizedBox(),

                      secondChild: Padding(
                        padding: EdgeInsets.only(top: 18.h),

                        child: Container(
                          width: double.infinity,

                          padding: EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.12),

                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Text(
                            programs[index]['desc'],

                            textAlign: TextAlign.right,

                            style: TextStyle(
                              color: Colors.white,

                              height: 1.7,

                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
