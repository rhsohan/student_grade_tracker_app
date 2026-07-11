import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;

  const SubjectCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    // Generate color based on grade
    Color gradeColor;
    switch (subject.grade) {
      case 'A':
        gradeColor = Theme.of(context).colorScheme.primary;
        break;
      case 'B':
        gradeColor = Theme.of(context).colorScheme.secondary;
        break;
      case 'C':
        gradeColor = Theme.of(context).colorScheme.tertiary;
        break;
      default:
        gradeColor = Theme.of(context).colorScheme.error;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        leading: CircleAvatar(
          backgroundColor: gradeColor.withValues(alpha: 0.2),
          foregroundColor: gradeColor,
          radius: 28,
          child: Text(
            subject.grade,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          subject.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Mark: ${subject.mark.toStringAsFixed(1)}',
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
