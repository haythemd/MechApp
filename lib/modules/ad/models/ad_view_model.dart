import 'package:json_annotation/json_annotation.dart';
import 'package:mechalodon_mobile/utils/csv_exportable.dart';

import '../../marketing/models/ads_models.dart';

part 'ad_view_model.g.dart';


@JsonSerializable()
class DetailedAdModel  implements CSVExportable {

  AdsModels adMetrics;
  List<Creative>? creatives;

  DetailedAdModel({required this.adMetrics, required this.creatives});


  factory DetailedAdModel.fromJson(Map<String, dynamic> json) => _$DetailedAdModelFromJson(json);
  Map<String, dynamic> toJson(DetailedAdModel detailedAdModel) => _$DetailedAdModelToJson(this);

  @override
  List<dynamic> rows() {

    return adMetrics.toJson().values.toList();

  }

  @override
  List<String> headers() {
   return adMetrics.toJson().keys.toList();

  }


}

@JsonSerializable()
class Creative {
String name;
String photoUrl;
AdsModels metrics;

Creative({required this.name, required this.photoUrl, required this.metrics});

factory Creative.fromJson(Map<String, dynamic> json) => _$CreativeFromJson(json);
Map<String, dynamic> toJson() => _$CreativeToJson(this);
}


