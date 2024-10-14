import 'package:sunday_core/GetGtorage/get_storage.dart';

/// Retrieves the value associated with the given key from the storage.
///
/// This function reads the value from the storage associated with the given key.
/// The value is returned as a Future of the specified type.
///
/// [T] is the type of the value to be retrieved.
/// [key] is the key for which the value needs to be retrieved.
///
/// Returns:
///   Future<T?>: A future that completes with the value associated with the key,
///   or null if the key does not exist.
Future<T?> getKey<T>(String key) async {
  final box = SundayGetStorage();
  return await box.read<T>(key);
}
