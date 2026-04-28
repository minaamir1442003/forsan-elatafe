import 'package:flutter/material.dart';
import 'package:forsan_eltafe/core/appcolors.dart';
import 'package:forsan_eltafe/features/MedicalUnit/screen/MedicalUnitPage.dart';
import 'package:forsan_eltafe/features/Profile/screen/ProfilePage.dart';
import 'package:forsan_eltafe/features/Resort/screen/ResortPage.dart';
import 'package:forsan_eltafe/features/home/screen/home.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex;  // 👈 أضف هذا
  
  const CustomBottomNavigationBar({
    super.key,
    this.initialIndex = 0,  // القيمة الافتراضية 0 (الرئيسية)
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;

  final List<Widget> _screens = [
    HomePage(),
    MedicalUnitPage(),
    ResortPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;  // 👈 استخدم القيمة اللي جات من الخارج
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 25,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNavItem(Icons.person, "حسابي", 3),
                    _buildNavItem(Icons.villa, "المنتجع", 2),
                    _buildNavItem(Icons.local_hospital, "الوحدة الطبية", 1),
                    _buildNavItem(Icons.home, "الرئيسية", 0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 4,
            width: isSelected ? 40 : 0,
            decoration: BoxDecoration(
              color: Appcolors.accentColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10),
          AnimatedScale(
            scale: isSelected ? 1.1 : 1,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              icon,
              size: 28,
              color: isSelected
                  ? Appcolors.primaryColor
                  : Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: 'Cairo',
              color: isSelected
                  ? Appcolors.primaryColor
                  : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}