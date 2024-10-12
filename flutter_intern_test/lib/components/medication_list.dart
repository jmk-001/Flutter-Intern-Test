import 'package:flutter/material.dart';
import 'package:flutter_intern_test/models/prescription_medication.dart';
import 'package:flutter_intern_test/pages/edit_medication_overlay.dart';
import 'package:provider/provider.dart';
import '/models/medication_manager.dart';

class MedicationList extends StatelessWidget {
  MedicationManager manager;
  MedicationList(this.manager, {super.key});
  @override
  Widget build(BuildContext context) {
    // Subscribe to the context created by MedicationManager
    return Consumer<MedicationManager>(
      builder: (context, manager, child) {
        return ListView.builder(
          itemCount: manager.meds.length,
          itemBuilder: (context, index) {
            // Add onClick listener to each item
            return GestureDetector(
              onTap: () {
                _onItemTap(context, manager.meds[index]);
              },
              onLongPress: () {
                _onItemLongPress(context, manager.meds[index]);
              },
              child: Card(
                elevation: 5,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and ID column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // ID
                            Text(
                              'ID: ${manager.meds[index].id}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            // Name
                            Row(
                              children: [
                                Text(
                                  "${manager.meds[index].name} ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[800],
                                  ),
                                ),
                                // Use a conditional expression to add the icon if the doctor is not null
                                if (manager.meds[index].doctor != null)
                                  const Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Dose and Time column
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Dose
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.local_hospital,
                                  color: Colors.blueGrey[700],
                                  size: 20,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  '${manager.meds[index].dose} mg',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey[700],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            // Time
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.blueGrey[700],
                                  size: 20,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  '${manager.meds[index].time.hour.toString().padLeft(2, '0')}:${manager.meds[index].time.minute.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onItemTap(BuildContext context, PrescriptionMedication medication) {
    final overlayInstance = EditMedicationOverlay(manager,
        medication); // Pass the manager to overlay to call addMedication
    overlayInstance.showAddMedicationOverlay(context);
  }

  void _onItemLongPress(
      BuildContext context, PrescriptionMedication medication) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to delete the item?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                manager.removeMedication(medication.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
