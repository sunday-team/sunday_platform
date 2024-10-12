import 'package:sunday_core/GetGtorage/get_storage.dart';
import 'package:uuid/uuid.dart';

void resetUI() {
  final box = SundayGetStorage();
  box.write('resetUI', const Uuid().v4());
}
