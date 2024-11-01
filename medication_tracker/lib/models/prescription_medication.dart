import 'package:flutter/material.dart';
import 'package:flutter_intern_test/models/doctor.dart';
import 'package:flutter_intern_test/models/medication.dart';

/// This class represents prescribable and purchasable medications.
///
/// It stores medication's ID, name, the time it should  be taken, dosage amount,
/// and optionally (if prescribed) the doctor who prescribed this medication.
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
