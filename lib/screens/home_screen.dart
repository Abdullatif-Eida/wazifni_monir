import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/stat_card.dart';
import '../widgets/status_badge.dart';
import '../widgets/avatar_circle.dart';
import 'notifications_screen.dart';
import 'applications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: 'الرئيسية',
        onNotificationsTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const NotificationsScreen()),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _WelcomeCard(
            onReview: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ApplicationsScreen()),
            ),
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'الإحصائيات'),
          const SizedBox(height: 12),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              mainAxisExtent: 150,
            ),
            children: const [
              StatCard(
                icon: Icons.access_time_rounded,
                iconBackground: AppColors.iconBlueBg,
                iconColor: AppColors.iconBlueFg,
                value: '12',
                label: 'طلبات قيد المراجعة',
              ),
              StatCard(
                icon: Icons.work_outline_rounded,
                iconBackground: AppColors.goldLight,
                iconColor: AppColors.gold,
                value: '12',
                label: 'وظائف نشطة',
              ),
              StatCard(
                icon: Icons.groups_2_outlined,
                iconBackground: Color(0xFFECECEC),
                iconColor: Color(0xFF7A7A7A),
                value: '12',
                label: 'وظائف نشطة',
              ),
              StatCard(
                icon: Icons.access_time_filled_rounded,
                iconBackground: AppColors.statusAcceptedBg,
                iconColor: AppColors.statusAcceptedFg,
                value: '12',
                label: 'طلبات مقبولة',
              ),
            ],
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'أحدث الإعلانات'),
          const SizedBox(height: 12),
          ...MockData.jobs.take(2).map((job) => Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(job.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              const SizedBox(height: 4),
                              Text(job.department,
                                  style: const TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 13)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          children: [
                            StatusBadge.job(job.status),
                            const SizedBox(height: 8),
                            Container(
                              width: 72,
                              height: 72,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.gold,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child:
                                  const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(job.location,
                            style: const TextStyle(
                                fontSize: 12, color: AppColors.textSecondary)),
                        const SizedBox(width: 4),
                        const Icon(Icons.location_on_outlined,
                            size: 14, color: AppColors.textSecondary),
                        const SizedBox(width: 12),
                        Text('${job.applicants} متقدمين',
                            style: const TextStyle(
                                fontSize: 12, color: AppColors.textSecondary)),
                        const SizedBox(width: 4),
                        const Icon(Icons.groups_2_outlined,
                            size: 14, color: AppColors.gold),
                        const SizedBox(width: 12),
                        Text(job.date,
                            style: const TextStyle(
                                fontSize: 12, color: AppColors.textSecondary)),
                        const SizedBox(width: 4),
                        const Icon(Icons.calendar_today_outlined,
                            size: 13, color: AppColors.textSecondary),
                      ],
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 12),
          _SectionHeader(title: 'أحدث الطلبات'),
          const SizedBox(height: 12),
          ...MockData.applicants.take(2).map((applicant) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    AvatarCircle(initials: applicant.initials, size: 44),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(applicant.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 2),
                          Text(applicant.title,
                              style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    StatusBadge.application(applicant.status),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  final VoidCallback onReview;
  const _WelcomeCard({required this.onReview});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 185),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.darkGreen, AppColors.darkGreenLight],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned(
              left: -10,
              top: 8,
              child: SvgPicture.asset(
                'assets/images/welcome_arcs.svg',
                height: 170,
              ),
            ),
            Positioned(
              top: -18,
              right: 90,
              child: Transform.rotate(
                angle: 0.7854,
                child: SvgPicture.asset(
                  'assets/images/welcome_ellipse.svg',
                  width: 62,
                  height: 62,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: -10,
              child: SvgPicture.asset(
                'assets/images/welcome_ellipse.svg',
                width: 100,
                height: 100,
              ),
            ),
            Positioned(
              bottom: -30,
              right: 60,
              child: SvgPicture.asset(
                'assets/images/welcome_ellipse.svg',
                width: 90,
                height: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text('مرحبا بك',
              style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 4),
          const Text('أحمد الأحمد',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.right,
            text: const TextSpan(
              style: TextStyle(color: Colors.white70, fontSize: 14),
              children: [
                TextSpan(text: 'لديك '),
                TextSpan(
                    text: '4 طلبات',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                TextSpan(text: ' تحتاج مراجعة'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onReview,
            icon: const Icon(Icons.arrow_back,
                size: 16, textDirection: TextDirection.ltr),
            label: const Text('مراجعة الطلبات'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.textPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17)),
        const SizedBox(width: 8),
        const Expanded(
          child: Divider(color: Colors.black26, thickness: 1),
        ),
        const SizedBox(width: 8),
        const Text('عرض الكل',
            style: TextStyle(color: AppColors.gold, fontSize: 13)),
        const SizedBox(width: 4),
        const Icon(Icons.arrow_back,
            size: 14, color: AppColors.gold, textDirection: TextDirection.ltr),
      ],
    );
  }
}
