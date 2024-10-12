import 'package:flutter/material.dart';
import 'package:flutter_intern_test/models/prescription_medication.dart';

class MedicationManager with ChangeNotifier {
  final List<PrescriptionMedication> _meds = [
    PrescriptionMedication(
        id: 1,
        name: "Xanax",
        time: const TimeOfDay(hour: 17, minute: 34),
        dose: 3.5),
    PrescriptionMedication(
        id: 2,
        name: "Acetaminophen",
        time: const TimeOfDay(hour: 3, minute: 34),
        dose: 600),
  ];

  List<PrescriptionMedication> get meds => _meds;

  void addMedication(PrescriptionMedication medication) {
    _meds.add(medication);
    notifyListeners();
  }

  void removeMedication(int id) {
    _meds.removeWhere((med) => med.id == id);
    notifyListeners();
  }

  void updateMedication(PrescriptionMedication medication) {
    final index = _meds.indexWhere((med) => med.id == medication.id);
    if (index != -1) {
      _meds[index] = medication;
      notifyListeners();
    }
  }
}
