import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/add_subject_provider.dart';
import '../providers/subject_provider.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/hover_button.dart';

class AddSubjectScreen extends StatelessWidget {
  const AddSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<AddSubjectProvider>(context, listen: false);
    final subjectProvider = Provider.of<SubjectProvider>(context, listen: false);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Card(
        elevation: 0,
        color: Theme.of(context).cardTheme.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: addProvider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.school_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  'Add New Subject',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Track your academic progress',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: addProvider.nameController,
                  labelText: 'Subject Name',
                  prefixIcon: Icons.book_rounded,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a subject name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: addProvider.markController,
                  labelText: 'Mark (0 - 100)',
                  prefixIcon: Icons.percent_rounded,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a mark';
                    }
                    final mark = double.tryParse(value);
                    if (mark == null) {
                      return 'Please enter a valid number';
                    }
                    if (mark < 0 || mark > 100) {
                      return 'Mark must be between 0 and 100';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                HoverButton(
                  onPressed: () {
                    if (addProvider.formKey.currentState!.validate()) {
                      final name = addProvider.nameController.text.trim();
                      final mark = double.parse(addProvider.markController.text.trim());
                      subjectProvider.addSubject(name, mark);
                      addProvider.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Subject added successfully!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                        ),
                      );
                    }
                  },
                  text: 'Save Subject',
                  icon: Icons.save_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
