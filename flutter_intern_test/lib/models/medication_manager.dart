import 'package:flutter/material.dart';
import 'medication.dart';

class MedicationManager {
  List<Medication> _meds = [
    Medication(1, "Xanax", 1030, 3.5),
    Medication(2, "Acetaminophen", 920, 600),
  ];

  List<Medication> get meds => _meds;

  void addMedication(Medication medication) {
    _meds.add(medication);
  }

  void removeMedication(int id) {
    _meds.removeWhere((med) => med.id == id);
  }

  void updateMedication(Medication medication) {
    final index = _meds.indexWhere((med) => med.id == medication.id);
    if (index != -1) {
      _meds[index] = medication;
    }
  }
}
