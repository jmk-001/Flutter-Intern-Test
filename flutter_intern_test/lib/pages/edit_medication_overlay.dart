import 'package:flutter/material.dart';
import 'package:flutter_intern_test/models/medication.dart';
import 'package:flutter_intern_test/models/medication_manager.dart';
import 'package:numberpicker/numberpicker.dart';

class EditMedicationOverlay extends StatelessWidget {
  final MedicationManager manager;
  final Medication med;
  EditMedicationOverlay(this.manager, this.med, {super.key});
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _dosageTextController = TextEditingController();
  final TextEditingController _timeTextController = TextEditingController();

  final ValueNotifier<int> _hourPickerValue = ValueNotifier<int>(0);
  final ValueNotifier<int> _minutePickerValue = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    _idTextController.text = med.id.toString();
    _nameTextController.text = med.name;
    _dosageTextController.text = med.dose.toString();
    _timeTextController.text = med.time.toString();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: _idTextController,
          decoration: const InputDecoration(
            labelText: 'Medication ID',
          ),
          keyboardType: TextInputType.number,
          readOnly: true,
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
        const Text("Dosage time"),
        Row(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: _hourPickerValue,
              builder: (context, value, child) {
                return NumberPicker(
                  value: med.time.hour,
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
                  value: med.time.minute,
                  minValue: 0,
                  maxValue: 59,
                  onChanged: (newValue) {
                    _minutePickerValue.value = newValue;
                  },
                );
              },
            )
          ],
        )
      ],
    );
  }

  void showAddMedicationOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Medication"),
          content: this,
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
      if (_idTextController.text.isEmpty ||
          _nameTextController.text.isEmpty ||
          _dosageTextController.text.isEmpty ||
          _timeTextController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Fields must not be empty')),
        );
        return;
      }

      int id = int.parse(_idTextController.text);
      String name = _nameTextController.text;
      TimeOfDay time = TimeOfDay(
          hour: _hourPickerValue.value, minute: _minutePickerValue.value);
      double dosage = double.parse(_dosageTextController.text);

      Medication newMedication = Medication(id, name, time, dosage);

      // Update the new medication through the imported reference to MedicationManager
      manager.updateMedication(newMedication);

      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid input: ${e.toString()}')),
      );
    }
  }
}
