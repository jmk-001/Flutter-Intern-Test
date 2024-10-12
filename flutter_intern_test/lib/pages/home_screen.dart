import 'package:flutter/material.dart';
import 'package:flutter_intern_test/components/medication_list.dart';
import 'package:flutter_intern_test/models/medication_manager.dart';
import 'package:flutter_intern_test/pages/add_medication_overlay.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<MedicationManager>(
        context); // Context provider for current meds

    return Scaffold(
      body: MedicationList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final overlayInstance = AddMedicationOverlay(
              manager); // Pass the manager to overlay to call addMedication
          overlayInstance.showAddMedicationOverlay(context);
        },
        tooltip: 'Add Medication',
        child: const Icon(Icons.add),
      ),
    );
  }
}
