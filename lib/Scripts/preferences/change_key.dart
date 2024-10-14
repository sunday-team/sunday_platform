import 'package:sunday_core/GetGtorage/get_storage.dart';

/// Changes the value associated with the given key in the storage.
///
/// This function writes the provided value to the storage associated with the given key.
/// 
/// [key] is the key for which the value needs to be changed.
/// [value] is the new value to be written to the storage.
void changeKey(String key, dynamic value) {
  final box = SundayGetStorage();
  box.write(key, value);
}
