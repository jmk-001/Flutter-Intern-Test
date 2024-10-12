import 'package:flutter/material.dart';
import 'package:flutter_intern_test/models/medication.dart';
import 'package:flutter_intern_test/models/medication_manager.dart';

class AddMedicationOverlay extends StatelessWidget {
  final MedicationManager manager;
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _dosageTextController = TextEditingController();
  final TextEditingController _timeTextController = TextEditingController();

  // A new constructor to accept MedicationManager
  AddMedicationOverlay(this.manager);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Add Medication'),
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
        TextFormField(
          controller: _timeTextController,
          decoration: const InputDecoration(
            labelText: 'Dosage Time',
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  void showAddMedicationOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Medication"),
          content: this,
          actions: [
            TextButton(
              child: Text("Save"),
              onPressed: () {
                onSaveClick(context);
              },
            ),
            TextButton(
              child: Text("Close"),
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
      if (_idTextController.text.isEmpty ||
          _nameTextController.text.isEmpty ||
          _dosageTextController.text.isEmpty ||
          _timeTextController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields.')),
        );
        return;
      }

      int id = int.parse(_idTextController.text);
      String name = _nameTextController.text;
      int time = int.parse(_timeTextController.text);
      double dosage = double.parse(_dosageTextController.text);

      Medication newMedication = Medication(id, name, time, dosage);

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
