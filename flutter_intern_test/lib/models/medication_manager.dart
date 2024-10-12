import 'package:flutter/material.dart';
import 'medication.dart';

class MedicationManager with ChangeNotifier {
  final List<Medication> _meds = [
    Medication(1, "Xanax", const TimeOfDay(hour: 17, minute: 34), 3.5),
    Medication(2, "Acetaminophen", const TimeOfDay(hour: 3, minute: 34), 600),
  ];

  List<Medication> get meds => _meds;

  void addMedication(Medication medication) {
    _meds.add(medication);
    notifyListeners();
  }

  void removeMedication(int id) {
    _meds.removeWhere((med) => med.id == id);
    notifyListeners();
  }

  void updateMedication(Medication medication) {
    final index = _meds.indexWhere((med) => med.id == medication.id);
    if (index != -1) {
      _meds[index] = medication;
      notifyListeners();
    }
  }
}
