import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();

    Hive.init(appDir.path);

    // We will open boxes later after models exist
  }
}
