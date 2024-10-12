import 'package:flutter/material.dart';
import 'doctor.dart';
import 'package:flutter_intern_test/models/prescription_medication.dart';

class MedicationManager with ChangeNotifier {
  final List<PrescriptionMedication> _meds = [
    PrescriptionMedication(
      id: 1,
      name: "Benzodiazepine",
      time: const TimeOfDay(hour: 18, minute: 30),
      dose: 0.5,
      doctor: Doctor(1, "Sarah Rodriguez", 01397892),
    ),
    PrescriptionMedication(
        id: 2,
        name: "Acetaminophen",
        time: const TimeOfDay(hour: 15, minute: 45),
        dose: 1000),
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
