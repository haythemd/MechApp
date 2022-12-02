import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:test/test.dart';

void main() {

  test("""MechPage paths match enum values. The names of the paths should be the
  same as the names of the enum values just with a [/] added to them
  """, () {
    for (var element in MechPage.values) {
      expect(element.path(), "/${element.name}",
          reason: """paths dont match for $element, path is ${element.path()} 
              while the name is ${element.name}""");
    }
  });
}
