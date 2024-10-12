class Doctor {
  final int _id;
  final String _name;
  final int _phoneNumber;

  Doctor(this._id, this._name, this._phoneNumber);

  int get id => _id;
  String get name => _name;
  int get phone => _phoneNumber;
}
