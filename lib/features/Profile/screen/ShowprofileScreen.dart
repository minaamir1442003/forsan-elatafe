import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan_eltafe/core/appcolors.dart';
import 'package:forsan_eltafe/features/Profile/screen/ProfilePage.dart';
import 'package:forsan_eltafe/features/Profile/widget/profile_header.dart';
import 'package:forsan_eltafe/features/Profile/widget/record_card.dart';
import 'package:forsan_eltafe/features/navigation_bar/navigation_bar.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class ShowprofileScreen extends StatelessWidget {
  final String token;
  final String patientName;

  const ShowprofileScreen({
    super.key,
    required this.token,
    required this.patientName,
  });

  Future<void> _logout(BuildContext context) async {
    final cubit = context.read<HomeCubit>();
    
    // محاولة تسجيل الخروج من الـ API
    final success = await cubit.logout(token);
    
    if (context.mounted) {
      if (success) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CustomBottomNavigationBar(initialIndex: 3)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم تسجيل الخروج بنجاح'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..getAllData(token),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Appcolors.background,
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.health_and_safety_rounded, color: Appcolors.accentColorNew, size: 28),
                  const SizedBox(width: 12),
                  const Text(
                    'فرسان التعافي',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: Appcolors.cardBackground,
              elevation: 0,
              toolbarHeight: 80,
              foregroundColor: Appcolors.primaryColor,
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: const Icon(Icons.logout_rounded, size: 28),
                    onPressed: () => _logout(context),
                  ),
                ),
              ],
            ),
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 4,
                          color: Appcolors.accentColorNew,
                        ),
                        SizedBox(height: 24),
                        Text(
                          'جاري تحميل ملفك الطبي...',
                          style: TextStyle(
                            fontSize: 18,
                            color: Appcolors.textLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (state is HomeSuccess) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await context.read<HomeCubit>().getAllData(token);
                    },
                    color: Appcolors.accentColorNew,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          ProfileHeader(
                            patientName: patientName,
                            profile: state.profile,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                            child: Row(
                              children: [
                                Container(
                                  width: 6,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Appcolors.accentColorNew,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  '📋 السجلات الطبية',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: Appcolors.primaryColor,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Appcolors.accentColorNew.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    '${state.records.length} سجل',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Appcolors.accentColorNew,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (state.records.isEmpty)
                            Container(
                              margin: const EdgeInsets.all(24),
                              padding: const EdgeInsets.all(50),
                              decoration: BoxDecoration(
                                color: Appcolors.cardBackground,
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.folder_open_rounded, size: 64, color: Colors.grey.shade400),
                                  const SizedBox(height: 16),
                                  Text(
                                    'لا توجد سجلات طبية',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Appcolors.textLight,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            ...state.records.map((record) => RecordCard(record: record)).toList(),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  );
                }

                if (state is HomeError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wifi_off_rounded, size: 80, color: Colors.grey.shade400),
                        const SizedBox(height: 24),
                        Text(
                          'عذراً، حدث خطأ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Appcolors.textDark,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            state.message,
                            style: TextStyle(
                              fontSize: 16,
                              color: Appcolors.textLight,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 32),
                        GestureDetector(
                          onTap: () {
                            context.read<HomeCubit>().getAllData(token);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                            decoration: BoxDecoration(
                              color: Appcolors.accentColorNew,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.refresh_rounded, size: 22, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'إعادة المحاولة',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          );
        },
      ),
    );
  }
}