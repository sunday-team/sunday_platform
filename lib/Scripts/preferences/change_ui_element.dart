import 'package:sunday_core/GetGtorage/get_storage.dart';
import 'package:sunday_core/Print/print.dart';

Future<void> changeGlobals(String key, dynamic value) async {
  final box = SundayGetStorage();
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
