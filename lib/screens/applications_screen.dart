import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/models.dart';
import '../widgets/app_header.dart';
import '../widgets/applicant_card.dart';
import '../widgets/filter_chips_bar.dart';
import '../widgets/search_field.dart';
import 'applicant_detail_screen.dart';

class ApplicationsScreen extends StatefulWidget {
  const ApplicationsScreen({super.key});

  @override
  State<ApplicationsScreen> createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  String _selected = 'الكل';

  static const _options = ['الكل', 'قيد المراجعة', 'مقبول', 'مرفوض'];

  @override
  Widget build(BuildContext context) {
    final applicants = MockData.applicants.where((a) {
      if (_selected == 'الكل') return true;
      return a.status.label == _selected;
    }).toList();

    return Scaffold(
      appBar: const AppHeader(title: 'طلبات التوظيف'),
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
          for (final applicant in applicants)
            ApplicantCard(
              applicant: applicant,
              onViewFullProfile: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ApplicantDetailScreen(applicant: applicant),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
