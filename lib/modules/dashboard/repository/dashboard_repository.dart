import 'package:mechalodon_mobile/modules/dashboard/models/dashboard_model.dart';
import 'package:mechalodon_mobile/services/graphql_service.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

class DashboardRepository {
  String getDashboardDataQuery() {
    return r'''
      Dashboard{
        spend
        orders
        revenue
        roas
        cpp
        cpm
        cpc
        ctr
        checkouts
      }
      ''';
  }

  Future<DashboardModel?> getModelData(int periodInDays) async {
    //   GraphQLService qlService = serviceLocator<GraphQLService>();
    //   final query = getDashboardDataQuery();
    //   final variables = {'timePeriod': periodInDays};

    //   try {
    //     final result = await qlService.query(query, variables: variables);

    //     if (result.hasException) {
    //       print('graphQLErrors: ${result.exception?.graphqlErrors.toString()}');
    //       print('clientErrors: ${result.exception?.linkException.toString()}');
    //       return null;
    //     } else {
    //       if (result.data != null) {
    //         DashboardModel.fromJson(result.data!);
    //       } else {
    //         return null;
    //       }
    //     }
    //   } catch (e) {
    //     print(e);
    //   }
    //   return null;
    // }

    return Future.value(DashboardModel(
        checkouts: 2344.22,
        roas: 224,
        spend: 15444.32,
        cpc: 2.54,
        cpm: 3.44,
        cpp: 1.34,
        ctr: 2.12,
        orders: 22,
        revenue: 555));
  }
}
