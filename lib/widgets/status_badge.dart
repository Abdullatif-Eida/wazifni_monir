import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final Color background;
  final Color foreground;

  const StatusBadge({
    super.key,
    required this.label,
    required this.background,
    required this.foreground,
  });

  factory StatusBadge.application(ApplicationStatus status) {
    switch (status) {
      case ApplicationStatus.accepted:
        return StatusBadge(
          label: status.label,
          background: AppColors.statusAcceptedBg,
          foreground: AppColors.statusAcceptedFg,
        );
      case ApplicationStatus.rejected:
        return StatusBadge(
          label: status.label,
          background: AppColors.statusRejectedBg,
          foreground: AppColors.statusRejectedFg,
        );
      case ApplicationStatus.review:
        return StatusBadge(
          label: status.label,
          background: AppColors.statusReviewBg,
          foreground: AppColors.statusReviewFg,
        );
    }
  }

  factory StatusBadge.job(JobStatus status) {
    switch (status) {
      case JobStatus.active:
        return StatusBadge(
          label: status.label,
          background: AppColors.statusActiveBg,
          foreground: AppColors.statusActiveFg,
        );
      case JobStatus.closed:
        return StatusBadge(
          label: status.label,
          background: AppColors.statusPausedBg,
          foreground: AppColors.statusPausedFg,
        );
      case JobStatus.draft:
        return const StatusBadge(
          label: 'مسودة',
          background: Color(0xFFECECEC),
          foreground: Color(0xFF7A7A7A),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}
