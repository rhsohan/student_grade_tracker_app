import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';
import '../widgets/empty_state.dart';
import '../widgets/summary_card.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectProvider = Provider.of<SubjectProvider>(context);

    if (subjectProvider.subjects.isEmpty) {
      return const EmptyState(
        icon: Icons.bar_chart_outlined,
        title: 'No Data to Summarize',
        message: 'Add subjects to see your overall performance and statistics.',
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SummaryCard(
            title: 'Total Subjects',
            value: '${subjectProvider.totalSubjects}',
            icon: Icons.library_books,
            color: Colors.blue,
          ),
          const SizedBox(height: 20),
          SummaryCard(
            title: 'Average Mark',
            value: subjectProvider.averageMark.toStringAsFixed(2),
            icon: Icons.show_chart,
            color: Colors.purple,
          ),
          const SizedBox(height: 20),
          SummaryCard(
            title: 'Overall Grade',
            value: subjectProvider.overallGrade,
            icon: Icons.grade,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
