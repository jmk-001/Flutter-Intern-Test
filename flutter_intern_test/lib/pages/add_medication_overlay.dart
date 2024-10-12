import 'package:flutter/material.dart';
import 'package:flutter_intern_test/models/doctor.dart';
import 'package:flutter_intern_test/models/medication_manager.dart';
import 'package:flutter_intern_test/models/prescription_medication.dart';
import 'package:numberpicker/numberpicker.dart';

class AddMedicationOverlay extends StatelessWidget {
  final MedicationManager manager;
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _dosageTextController = TextEditingController();

  final TextEditingController _doctorIdTextController = TextEditingController();
  final TextEditingController _doctorNameTextController =
      TextEditingController();
  final TextEditingController _doctorPhoneTextController =
      TextEditingController();

  // A new constructor to accept MedicationManager
  AddMedicationOverlay(this.manager);
  final ValueNotifier<int> _hourPickerValue = ValueNotifier<int>(0);
  final ValueNotifier<int> _minutePickerValue = ValueNotifier<int>(0);
  final ValueNotifier<bool> _isPrescribedValue = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // TextFormFields: ID, Name, Dosage
        TextFormField(
          controller: _idTextController,
          decoration: const InputDecoration(
            labelText: 'Medication ID',
          ),
          keyboardType: TextInputType.number,
        ),
        TextFormField(
          controller: _nameTextController,
          decoration: const InputDecoration(
            labelText: 'Medication Name',
          ),
        ),
        TextFormField(
          controller: _dosageTextController,
          decoration: const InputDecoration(
            labelText: 'Dosage (mg)',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        // NumberPicker: Dosage
        const Row(children: [Text("Dosage time")]),
        Row(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: _hourPickerValue,
              builder: (context, value, child) {
                return NumberPicker(
                  value: value,
                  minValue: 0,
                  maxValue: 23,
                  onChanged: (newValue) {
                    _hourPickerValue.value = newValue;
                  },
                );
              },
            ),
            const Text(":"),
            ValueListenableBuilder<int>(
              valueListenable: _minutePickerValue,
              builder: (context, value, child) {
                return NumberPicker(
                  value: value,
                  minValue: 0,
                  maxValue: 59,
                  onChanged: (newValue) {
                    _minutePickerValue.value = newValue;
                  },
                );
              },
            )
          ],
        ),
        // Is the medication prescribed?
        Row(children: [
          const Text("Prescribed"),
          ValueListenableBuilder<bool>(
            valueListenable: _isPrescribedValue,
            builder: (context, value, child) {
              return Checkbox(
                value: value,
                onChanged: (newValue) {
                  _isPrescribedValue.value = !_isPrescribedValue.value;
                },
              );
            },
          )
        ]),
        ValueListenableBuilder<bool>(
          valueListenable: _isPrescribedValue,
          builder: (context, isPrescribed, child) {
            if (isPrescribed) {
              return Column(children: [
                TextFormField(
                  controller: _doctorIdTextController,
                  decoration: const InputDecoration(
                    labelText: 'Doctor ID',
                  ),
                ),
                TextFormField(
                  controller: _doctorNameTextController,
                  decoration: const InputDecoration(
                    labelText: 'Doctor Name',
                  ),
                ),
                TextFormField(
                  controller: _doctorPhoneTextController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                )
              ]);
            } else {
              return Container();
            }
          },
        ),
      ],
    ));
  }

  void showAddMedicationOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Medication"),
          content: SizedBox(width: 500, child: this),
          actions: [
            TextButton(
              child: const Text("Save"),
              onPressed: () {
                onSaveClick(context);
              },
            ),
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onSaveClick(BuildContext context) {
    try {
      // Input validation for basic med info (null prevention)
      if (_idTextController.text.isEmpty ||
          _nameTextController.text.isEmpty ||
          _dosageTextController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields.')),
        );
        return;
      }

      int id = int.parse(_idTextController.text);
      String name = _nameTextController.text;
      TimeOfDay time = TimeOfDay(
          hour: _hourPickerValue.value, minute: _minutePickerValue.value);
      double dosage = double.parse(_dosageTextController.text);

      PrescriptionMedication newMedication;

      if (_isPrescribedValue.value) {
        // Input validation for doctor (null prevention)
        if (_doctorIdTextController.text.isEmpty ||
            _doctorNameTextController.text.isEmpty ||
            _doctorPhoneTextController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill in all doctor fields.')),
          );
          return;
        }

        int docId = int.parse(_doctorIdTextController.text);
        String docName = _doctorNameTextController.text;
        int docPhone = int.parse(_doctorPhoneTextController.text);

        Doctor doctor = Doctor(docId, docName, docPhone);

        newMedication = PrescriptionMedication(
            id: id, name: name, time: time, dose: dosage, doctor: doctor);
      } else {
        newMedication = PrescriptionMedication(
            id: id, name: name, time: time, dose: dosage);
      }

      // Add the new medication through the imported reference to MedicationManager
      manager.addMedication(newMedication);
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid input: ${e.toString()}')),
      );
    }
  }
}
