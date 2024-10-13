# Futter_Intern_Test

## ListView Gestures

**Tap**

Update - Opens up an overlay page to update the chosen medication.

**Long Press**

Delete - Opens up a warning messagebox to confirm deletion of the chosen medication.

**Tap: Green Tick Icon**

Doctor Info - Opens up an InfoWidget indicating the prescriptor's details.

Note that medications with a green tick icon indicates that the medication is prescribed by a doctor.

## Design Choices

### Key Classes

**class PrescriptionMedication extends Medication**

Medications that can be prescribed - including those purchasable without a prescription.

It was initially thought that this is unnecessary for the current scope of application, but it was added to improve the future scalability of the Medication type (e.g. addition of anaesthesia, interoperative medications).

**class Doctor**

Added to give a distinction whether a medication is prescribed by a doctor(optional instnace variable).

### State Management

ChangeNotifier was used to ackowledge Consumers (ListView widget of MedicationList) of the Provider: MedicationManager (much like the ContextProvider in React framework).

An instance of MedicationManager is created in the HomeScreen and its reference is passed to its components: MedicationList, AddMedicationOverlay.

### UI

Traditional bottom navigation bar with empty top Appbar was employed to maximise the minimalism.

GreensHeart Green (estimated to be around Color.fromRGBO(18, 208, 191, 1)) was used as the primarySwatch to embed the brand identity.

## Assumptions

### Medication

id - custom numeric identifier unique to a single instance.

time - only involves time (type TimeOfDay, assumed to be dosage time).

dose - does not exceed 10000mg. Any value greater or equal to 10000mg will overflow the Text compoenent (also mentioned by a comment).

## Flutter-Specific Optimisations

Following dart-specific optimisations have been made using dart compiler's suggestions:

**Addition of key Parameter**

Key parameter is included in every widgets to differentiate between instances of different widget.

**Use of const**

Any variables that are known to remain unchanged are delcared as const to improve performance.

Using const fixes the data, meaning that the compiler does not need to constantly check for its update (much like baked lighting rather than realtime lighting in computer graphics).

## References

Login page (skeleton code) - https://www.freecodecamp.org/news/how-to-build-a-simple-login-app-with-flutter/
Widgets (skeleton code) - https://api.flutter.dev/index.html
Primary Swatch (skeleton code) - https://dev.to/rohanjsh/custom-swatch-for-material-app-theme-primaryswatch-3kic
