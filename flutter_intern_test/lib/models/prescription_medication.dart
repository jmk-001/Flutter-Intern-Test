import 'package:flutter/material.dart';
import 'package:flutter_intern_test/models/doctor.dart';
import 'package:flutter_intern_test/models/medication.dart';

class PrescriptionMedication extends Medication {
  final Doctor? _doctor;

  PrescriptionMedication({
    required int id,
    required String name,
    required TimeOfDay time,
    required double dose,
    Doctor? doctor,
  })  : _doctor = doctor,
        super(id, name, time, dose);

  Doctor? get doctor => _doctor;
}
