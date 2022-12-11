import 'dart:convert';

import 'package:mechalodon_mobile/modules/ad/models/ad_model.dart';
import 'package:mechalodon_mobile/modules/ad/models/ads_models.dart';
import 'package:mechalodon_mobile/services/graphql_service.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

class CampaignRepository {
  final GraphQLService _campaignApiClient = serviceLocator<GraphQLService>();

  CampaignRepository();

  String _query() {
    return """
      query {
        adsets {
          id
          name
          status
          ads {
            id
            name
            status
            creative {
              id
              name
              status
            }
          }
        }
      }
    """;
  }

  Future<AdsModels?> fetchAdsets() async {
    //   var response = await _campaignApiClient.query(_query());
    //   if (response.data == null) {
    //     return null;
    //   }
    //   return AdsModels.fromJson(response.data!);
    // }
    return Future.value(AdsModels(
      id: '1',
      name: 'name',
      totalSpend: 1.0,
      totalOrders: 1,
      totalCpp: 1.0,
      totalCtr: 1.0,
      totalCpc: 1.0,
      totalRevenue: 1.0,
      stats: _generateMockAds(5),
    ));
  }

  List<AdModel> _generateMockAds(int n) {
    List<AdModel> ads = [];
    for (var i = 0; i < n; i++) {
      ads.add(AdModel(
        id: i.toString(),
        name: 'name',
        spend: i.toDouble(),
        orders: i,
        //generate random number between 0 and 100
        cpp: i,
      ));
    }
    return ads;
  }
}
