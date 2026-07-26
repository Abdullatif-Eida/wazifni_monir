import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/filter_chips_bar.dart';
import '../widgets/job_card.dart';
import '../widgets/search_field.dart';
import 'create_job_screen.dart';

class JobManagementScreen extends StatefulWidget {
  const JobManagementScreen({super.key});

  @override
  State<JobManagementScreen> createState() => _JobManagementScreenState();
}

class _JobManagementScreenState extends State<JobManagementScreen> {
  String _selected = 'الكل';

  static const _options = ['الكل', 'نشط', 'مغلق', 'مسودة'];

  @override
  Widget build(BuildContext context) {
    final jobs = MockData.jobs.where((j) {
      if (_selected == 'الكل') return true;
      return j.status.label == _selected;
    }).toList();

    return Scaffold(
      appBar: const AppHeader(title: 'إدارة الوظائف'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkGreen,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const CreateJobScreen()),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const AppSearchField(),
          const SizedBox(height: 16),
          FilterChipsBar(
            options: _options,
            selected: _selected,
            onSelected: (value) => setState(() => _selected = value),
          ),
          const SizedBox(height: 20),
          for (final job in jobs)
            JobCard(
              job: job,
              showActions: true,
              onView: () {},
              onEdit: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CreateJobScreen()),
              ),
              onDelete: () {},
            ),
        ],
      ),
    );
  }
}
