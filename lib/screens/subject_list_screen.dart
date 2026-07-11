import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';
import '../widgets/empty_state.dart';
import '../widgets/subject_card.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectProvider = Provider.of<SubjectProvider>(context);

    if (subjectProvider.subjects.isEmpty) {
      return const EmptyState(
        icon: Icons.assignment_outlined,
        title: 'No Subjects Yet',
        message: 'Add your subjects from the "Add" tab to see them here.',
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.swipe_left_rounded,
                size: 20,
                color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
              ),
              const SizedBox(width: 8),
              Text(
                'Swipe a subject left to delete',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: subjectProvider.subjects.length,
            itemBuilder: (context, index) {
              final subject = subjectProvider.subjects[index];
              return Dismissible(
                key: ValueKey('${subject.name}_${subject.mark}_$index'),
                direction: DismissDirection.endToStart,
                background: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).colorScheme.onError,
                    size: 32,
                  ),
                ),
                onDismissed: (_) {
                  subjectProvider.removeSubject(subject);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${subject.name} deleted'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                },
                child: SubjectCard(subject: subject),
              );
            },
          ),
        ),
      ],
    );
  }
}
