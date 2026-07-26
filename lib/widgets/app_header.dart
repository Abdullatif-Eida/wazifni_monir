import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onNotificationsTap;

  const AppHeader({
    super.key,
    required this.title,
    this.onBack,
    this.onNotificationsTap,
  });

  static const double _contentHeight = 92;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: _contentHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.heading(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkResponse(
                      onTap: onBack ?? () => Navigator.of(context).maybePop(),
                      radius: 24,
                      child: const Icon(Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                          textDirection: TextDirection.ltr),
                    ),
                    InkResponse(
                      onTap: onNotificationsTap,
                      radius: 24,
                      child: const Icon(Icons.notifications_none_rounded,
                          color: Colors.white, size: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_contentHeight);
}
