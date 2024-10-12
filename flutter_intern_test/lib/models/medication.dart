import 'package:flutter/material.dart';

class Medication {
  final int id;
  String name;
  TimeOfDay time;
  double dose;

  Medication(this.id, this.name, this.time, this.dose);
}
