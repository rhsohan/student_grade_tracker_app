import 'package:flutter/foundation.dart';
import '../models/subject.dart';

class SubjectProvider with ChangeNotifier {
  final List<Subject> _subjects = [];

  List<Subject> get subjects => List.unmodifiable(_subjects);

  void addSubject(String name, double mark) {
    _subjects.add(Subject(name: name, mark: mark));
    notifyListeners();
  }

  void removeSubject(Subject subject) {
    _subjects.remove(subject);
    notifyListeners();
  }

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0.0;
    // Using .map() to fulfill the requirement
    final totalMarks = _subjects.map((s) => s.mark).reduce((a, b) => a + b);
    return totalMarks / _subjects.length;
  }

  String get overallGrade {
    if (_subjects.isEmpty) return 'N/A';
    final avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }
}
