import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;

  const SubjectCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
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
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      elevation: 4,
      shadowColor: gradeColor.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: gradeColor.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: gradeColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Text(
              subject.grade,
              style: TextStyle(
                color: gradeColor,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          title: Text(
            subject.name,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Mark: ${subject.mark.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          trailing: Tooltip(
            message: 'Swipe left to delete',
            child: Icon(
              Icons.swipe_left_rounded,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
        ),
      ),
    );
  }
}
