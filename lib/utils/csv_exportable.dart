import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

  abstract class  CSVExportable{
   List<String>  headers();
   List<dynamic>  rows();
}


  class CSVUtil {

  late final List<String> headers;
  late final List<List<String>> rows;


 static Future<XFile> exportCSV(List<CSVExportable> rows,) async {

   //Populating File

    List<List<dynamic>> data = [];

    rows.forEach((element) {data.add(element.rows()); });

    data.insert(0, rows.first.headers());

    String csv =  const ListToCsvConverter().convert(data);

    //Getting Directory

    final directory = await getTemporaryDirectory();

    File csvFile = File("${directory.path}MechCsv-${DateTime.now().millisecondsSinceEpoch}.csv");

    await csvFile.writeAsString(csv).then((value) => print(value.path));

 XFile xfile =  XFile(csvFile.path,mimeType: "text/csv",);

 XFile.fromData(csvFile.readAsBytesSync());

 //Share file

  ShareResult result = await Share.shareXFiles([xfile]);

//Return File for testing
  return xfile;

  }

}