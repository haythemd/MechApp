
import 'package:mechalodon_mobile/modules/profile/models/profile_model.dart';

class ProfileRepository{
  Future<ProfileModel?> getProfileInfo(String id) async {
    var profileModel = ProfileModel(id,[Integration(true, "Facebook"),Integration(true, "Pinterest"),Integration(false, "Tiktok"),]);

    await Future.delayed(const Duration(seconds: 1));
    return Future.value(profileModel);
  }

}