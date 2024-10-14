import 'package:sunday_core/GetGtorage/get_storage.dart';
import 'package:uuid/uuid.dart';

/// Resets the UI by generating a new unique identifier and storing it in the storage.
///
/// This function creates a new unique identifier using the `Uuid` package and writes it
/// to the storage with the key 'resetUI'. This can be used to trigger a UI reset or refresh
/// by observing changes to this key.
///
/// Example usage:
/// ```dart
/// resetUI();
/// ```
///
/// Returns:
///   void: This function does not return a value.
void resetUI() {
  final box = SundayGetStorage();
  box.write('resetUI', const Uuid().v4());
}
