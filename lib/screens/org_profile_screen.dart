import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OrgProfileScreen extends StatelessWidget {
  const OrgProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
            decoration: const BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.white,
                              textDirection: TextDirection.ltr),
                          onPressed: () => Navigator.of(context).maybePop(),
                        ),
                        const IconButton(
                          icon: Icon(Icons.notifications_none_rounded,
                              color: Colors.white),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkGreenLight,
                      border: Border.all(color: AppColors.gold, width: 2),
                    ),
                    child: const Icon(Icons.shield_outlined,
                        color: AppColors.gold, size: 48),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'وزارة الإعلام السورية',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'MINISTRY OF INFORMATION',
                    style: TextStyle(color: AppColors.gold, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: _StatTile(
                          icon: Icons.workspace_premium_outlined,
                          value: '12',
                          label: 'تعينات هذا العام'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _StatTile(
                          icon: Icons.groups_2_outlined,
                          value: '12',
                          label: 'إجمالي المتقدمين'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _StatTile(
                          icon: Icons.work_outline_rounded,
                          value: '12',
                          label: 'وظيفة نشطة'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
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
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('معلومات التواصل',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      const Divider(height: 1),
                      _ContactRow(
                        label: 'البريد الإلكتروني',
                        value: 'fdsffs@gmail.com',
                      ),
                      const Divider(height: 1),
                      _ContactRow(
                        label: 'الموقع الإلكتروني',
                        value: 'fdddf.com',
                      ),
                      const Divider(height: 1),
                      _ContactRow(
                        label: 'الهاتف',
                        value: '0999999999999',
                      ),
                      const Divider(height: 1),
                      _ContactRow(
                        label: 'الصفحات',
                        value: 'facebook',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatTile(
      {required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.gold),
          const SizedBox(height: 8),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String label;
  final String value;

  const _ContactRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.goldLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.call_outlined, color: AppColors.gold),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        color: AppColors.textSecondary, fontSize: 13)),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.edit_outlined,
              size: 18, color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
