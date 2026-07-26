import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import 'avatar_circle.dart';
import 'status_badge.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final bool showActions;
  final VoidCallback? onView;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const JobCard({
    super.key,
    required this.job,
    this.showActions = false,
    this.onView,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarCircle(initials: job.title.substring(0, 2)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      job.department,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 14, color: AppColors.textSecondary),
                        Text(job.location,
                            style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary)),
                        const _MetaDivider(),
                        const Icon(Icons.groups_2_outlined,
                            size: 14, color: AppColors.gold),
                        Text('${job.applicants} متقدمين',
                            style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary)),
                        const _MetaDivider(),
                        const Icon(Icons.calendar_today_outlined,
                            size: 13, color: AppColors.gold),
                        Text(job.date,
                            style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary)),
                      ],
                    ),
                  ],
                ),
              ),
              StatusBadge.job(job.status),
            ],
          ),
          if (showActions) ...[
            const Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline, size: 16),
                    label: const Text('حذف', overflow: TextOverflow.ellipsis),
                    style: _actionButtonStyle(
                      backgroundColor: AppColors.statusRejectedBg,
                      foregroundColor: AppColors.statusRejectedFg,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(width: 1, height: 24, color: Colors.black12),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_outlined, size: 16),
                    label:
                        const Text('تعديل', overflow: TextOverflow.ellipsis),
                    style: _actionButtonStyle(
                      backgroundColor: AppColors.background,
                      foregroundColor: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(width: 1, height: 24, color: Colors.black12),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onView,
                    icon: const Icon(Icons.remove_red_eye_outlined, size: 16),
                    label: const Text('عرض', overflow: TextOverflow.ellipsis),
                    style: _actionButtonStyle(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  ButtonStyle _actionButtonStyle({
    Color? backgroundColor,
    required Color foregroundColor,
  }) {
    return OutlinedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      minimumSize: Size.zero,
      textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      shape: const StadiumBorder(),
    );
  }
}


class _MetaDivider extends StatelessWidget {
  const _MetaDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: Colors.black26,
    );
  }
}