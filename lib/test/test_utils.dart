import 'dart:convert';
import 'dart:io';

class TestUtil {

  /// Gets json from the test_resources package "test_resources/test_json/modules/"
  /// [fromPath] must be specified. Also make sure that the new test Json's folder is referenced in the
  /// pubspec.yaml of the test_resources package.
  static Future<dynamic> getJson(String fromPath) async {
    return jsonDecode(await File('test_resources/test_json/modules/$fromPath').readAsString());
  }
}
