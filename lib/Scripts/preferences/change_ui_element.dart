import 'package:sunday_core/Print/print.dart';
import 'package:sunday_get_storage/sunday_get_storage.dart';

/// Changes the global settings stored in SundayGetStorage.
///
/// This function reads the current global settings from storage, navigates
/// through the JSON object using the provided key, updates the value at the
/// specified key, and then writes the updated settings back to storage.
///
/// The key should be a dot-separated string representing the path to the
/// value in the JSON object. For example, 'settings.theme.color'.
///
/// If the key is invalid (i.e., the path does not exist in the JSON object),
/// the function will print an error message and return without making any changes.
///
/// Args:
///   key (String): The dot-separated key representing the path to the value.
///   value (dynamic): The new value to set at the specified key.
///
/// Returns:
///   Future<void>: A future that completes when the operation is done.
Future<void> changeGlobals(String key, dynamic value) async {
  final box = GetStorage();
  var globals = await box.read('sunday_ui:globals');

  // Split the key into parts
  List<String> keyParts = key.split('.');

  // Navigate through the JSON object and update the value
  dynamic currentValue = globals;
  for (int i = 0; i < keyParts.length - 1; i++) {
    String part = keyParts[i];
    if (currentValue is Map && currentValue.containsKey(part)) {
      if (i == keyParts.length - 2) {
        // We're at the parent of the target key, update the value
        currentValue[keyParts.last] = value;
      } else {
        currentValue = currentValue[part];
      }
    } else {
      sundayPrint('Invalid path: $key');
      return;
    }
  }

  // Save the updated globals back to storage
  await box.write('sunday_ui:globals', globals);

  sundayPrint('Updated value for key: $key');
}
