// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:forsan_eltafe/core/appcolors.dart';
import 'package:intl/intl.dart';

class ProfileHeader extends StatelessWidget {
  final String patientName;
  final Map<String, dynamic> profile;

  const ProfileHeader({
    super.key,
    required this.patientName,
    required this.profile,
  });

  String _getFormattedDate(dynamic dateValue) {
    if (dateValue == null) return '--';
    final dateString = dateValue.toString();
    if (dateString.length >= 10) {
      return dateString.substring(5, 10);
    }
    return dateString;
  }

  String _formatDateTime(String dateTimeString) {
    try {
      final date = DateTime.parse(dateTimeString);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      return dateTimeString;
    }
  }

  String _getStageName(String stage) {
    switch (stage) {
      case 'acute':
        return 'المرحلة الحادة';
      case 'transitional':
        return 'المرحلة الانتقالية';
      case 'supportive':
        return 'المرحلة الداعمة';
      default:
        return stage;
    }
  }

  String _getStageIcon(String stage) {
    switch (stage) {
      case 'acute':
        return '⚠️';
      case 'transitional':
        return '🔄';
      case 'supportive':
        return '🌟';
      default:
        return '📌';
    }
  }

  String _getStageDescription(String stage) {
    switch (stage) {
      case 'acute':
        return 'العلاج المكثف والرعاية المستمرة';
      case 'transitional':
        return 'خطوة towards recovery';
      case 'supportive':
        return 'أنت في طريقك للتعافي الكامل 💪';
      default:
        return '';
    }
  }

  Color _getStageColor(String stage) {
    switch (stage) {
      case 'acute':
        return Colors.red;
      case 'transitional':
        return Colors.orange;
      case 'supportive':
        return Colors.green;
      default:
        return Appcolors.accentColorNew;
    }
  }

  int _getStageProgress(String stage) {
    switch (stage) {
      case 'acute':
        return 25;
      case 'transitional':
        return 60;
      case 'supportive':
        return 90;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final therapeuticHistory = profile['therapeuticHistory'] as List? ?? [];
    
    // عكس الترتيب عشان الأحدث يظهر أولاً
    final reversedHistory = therapeuticHistory.reversed.toList();

    return Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Welcome Card
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Appcolors.primaryColor,
                  // ignore: deprecated_member_use
                  Appcolors.primaryColor.withOpacity(0.95),
                ],
              ),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Appcolors.primaryColor.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Appcolors.accentColorNew.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    size: 48,
                    color: Appcolors.accentColorNew,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مرحباً بك',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade300,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        patientName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color: profile['status'] == 'resident'
                        ? Appcolors.successColor.withOpacity(0.15)
                        : Appcolors.warningColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: profile['status'] == 'resident'
                          ? Appcolors.successColor
                          : Appcolors.warningColor,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        profile['status'] == 'resident'
                            ? Icons.check_circle_rounded
                            : Icons.remove_circle_rounded,
                        size: 18,
                        color: profile['status'] == 'resident'
                            ? Appcolors.successColor
                            : Appcolors.warningColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        profile['status'] == 'resident' ? 'مقيم' : 'غير مقيم',
                        style: TextStyle(
                          color: profile['status'] == 'resident'
                              ? Appcolors.successColor
                              : Appcolors.warningColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ========== المراحل العلاجية (therapeuticHistory) بشكل محسن ==========
          if (reversedHistory.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Appcolors.cardBackground,
                    Appcolors.cardBackground,
                  ],
                ),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Appcolors.accentColorNew,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '🌟 رحلة التعافي',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Appcolors.primaryColor,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Appcolors.successColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.rocket_rounded, size: 16, color: Appcolors.successColor),
                            const SizedBox(width: 4),
                            Text(
                              'قيد التقدم',
                              style: TextStyle(
                                fontSize: 12,
                                color: Appcolors.successColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // خط زمني متدرج
                  ...reversedHistory.asMap().entries.map((entry) {
                    final index = entry.key;
                    final history = entry.value;
                    final stage = history['stage'] ?? '';
                    final changedBy = history['changedBy'] as Map?;
                    final name = changedBy?['name'] ?? '';
                    final role = changedBy?['role'] ?? '';
                    final changedAt = history['changedAt'] ?? '';
                    final isLast = index == reversedHistory.length - 1;
                    final isSupportive = stage == 'supportive';
                    
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // العمود الأيمن (الخط الزمني)
                            SizedBox(
                              width: 40,
                              child: Column(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: isSupportive
                                            ? [Appcolors.successColor, Colors.green.shade300]
                                            : [_getStageColor(stage), _getStageColor(stage).withOpacity(0.7)],
                                      ),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: _getStageColor(stage).withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        _getStageIcon(stage),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  if (!isLast)
                                    Container(
                                      margin: const EdgeInsets.symmetric(vertical: 4),
                                      width: 2,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            _getStageColor(stage),
                                            _getStageColor(reversedHistory[index + 1]['stage'] ?? ''),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            
                            // العمود الأيسر (المحتوى)
                            Expanded(
                              child: Container(
                                margin:  EdgeInsets.only(bottom: isLast ? 0 : 16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: isSupportive
                                      ? LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            _getStageColor(stage).withOpacity(0.12),
                                            _getStageColor(stage).withOpacity(0.06),
                                          ],
                                        )
                                      : null,
                                  color: isSupportive ? null : _getStageColor(stage).withOpacity(0.06),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: _getStageColor(stage).withOpacity(0.2),
                                    width: 1.5,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          _getStageName(stage),
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w800,
                                            color: _getStageColor(stage),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: _getStageColor(stage).withOpacity(0.15),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            _formatDateTime(changedAt),
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: _getStageColor(stage),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _getStageDescription(stage),
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(Icons.person_outline, size: 14, color: Colors.grey.shade500),
                                        const SizedBox(width: 4),
                                        Text(
                                          '$name - $role',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    
                                    // شريط التقدم (للمرحلة الداعمة فقط)
                                    if (isSupportive) ...[
                                      const SizedBox(height: 12),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: LinearProgressIndicator(
                                          value: 0.85,
                                          backgroundColor: Colors.grey.shade200,
                                          color: Appcolors.successColor,
                                          minHeight: 6,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        '85% مكتمل - قريباً من التعافي الكامل 🎉',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Appcolors.successColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Stats Card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Appcolors.cardBackground,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  Icons.cake_rounded,
                  "${profile['age'] ?? '--'}",
                  "العمر",
                ),
                Container(
                  width: 1.5,
                  height: 50,
                  color: Colors.grey.shade200,
                ),
                _buildStatItem(
                  Icons.work_rounded,
                  profile['occupation'] ?? '--',
                  "المهنة",
                ),
                Container(
                  width: 1.5,
                  height: 50,
                  color: Colors.grey.shade200,
                ),
                _buildStatItem(
                  Icons.calendar_today_rounded,
                  _getFormattedDate(profile['entryDate']),
                  "تاريخ الدخول",
                ),
              ],
            ),
          ),

          // المرفقات
          if (profile['images'] != null && (profile['images'] as List).isNotEmpty) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Appcolors.cardBackground,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.image_rounded, size: 28, color: Appcolors.accentColorNew),
                      const SizedBox(width: 12),
                      Text(
                        'المرفقات',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Appcolors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (profile['images'] as List).length,
                      itemBuilder: (context, i) {
                        final img = profile['images'][i];
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(img['url']),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: NetworkImage(img['url']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Appcolors.accentColorNew),
        const SizedBox(height: 12),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Appcolors.primaryColor,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Appcolors.textLight,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}