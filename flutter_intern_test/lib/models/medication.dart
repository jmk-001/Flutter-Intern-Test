import 'package:flutter/material.dart';

class Medication {
  final int _id;
  final String _name;
  final TimeOfDay _time;
  final double _dose;

  Medication(this._id, this._name, this._time, this._dose);

  int get id => _id;
  String get name => _name;
  TimeOfDay get time => _time;
  double get dose => _dose;
}
