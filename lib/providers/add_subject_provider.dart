import 'package:flutter/material.dart';

class AddSubjectProvider with ChangeNotifier {
  final nameController = TextEditingController();
  final markController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void clear() {
    nameController.clear();
    markController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    markController.dispose();
    super.dispose();
  }
}
