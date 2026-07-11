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
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: addProvider.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Icon(
              Icons.school_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Add New Subject',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: addProvider.nameController,
              labelText: 'Subject Name',
              prefixIcon: Icons.book,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a subject name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: addProvider.markController,
              labelText: 'Mark (0 - 100)',
              prefixIcon: Icons.percent,
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
            const SizedBox(height: 32),
            HoverButton(
              onPressed: () {
                if (addProvider.formKey.currentState!.validate()) {
                  final name = addProvider.nameController.text.trim();
                  final mark = double.parse(addProvider.markController.text.trim());
                  subjectProvider.addSubject(name, mark);
                  addProvider.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Subject added successfully!'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                }
              },
              text: 'Save Subject',
              icon: Icons.save,
            ),
          ],
        ),
      ),
    );
  }
}
