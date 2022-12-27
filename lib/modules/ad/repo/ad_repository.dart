import 'package:mechalodon_mobile/modules/ad/models/ad_view_model.dart';

import 'package:mechalodon_mobile/modules/marketing/models/ad_model.dart';

import '../../marketing/models/ads_models.dart';

class AdRepository {
  Future<DetailedAdModel?> loadAd(String adId){
      DetailedAdModel model = DetailedAdModel(
          adMetrics: AdsModels(
              id: "25",
              name: "My Ads",
              totalSpend: 25,
              totalOrders: 12,
              totalCpp: 3256,
              totalCtr: 58962,
              totalCpc: 523,
              totalRevenue: 15666,
              stats: [
                AdModel(id: "33", name: "My Ad singular", spend:22, orders:3, cpp:154)]),
          creatives: [
            Creative(name: 'Gardener', photoUrl: 'https://picsum.photos/536/354',
                metrics:AdsModels(id: "25", name: "name", totalSpend: 236, totalOrders: 123, totalCpp: 45621, totalCtr: 4561, totalCpc: 456, totalRevenue: 12, stats: [AdModel(id: "33", name: "name", spend: 123, orders: 123, cpp: 456)])),
            Creative(name: 'Farmer', photoUrl: 'https://loremflickr.com/536/354',
                metrics: AdsModels(id: "25", name: "name", totalSpend: 236, totalOrders: 123, totalCpp: 45621, totalCtr: 4561, totalCpc: 456, totalRevenue: 12, stats: [AdModel(id: "33", name: "name", spend: 123, orders: 123, cpp: 456)]))]);


    Future.delayed(const Duration(seconds: 2));
    return Future.value(model);
  }
}