import 'package:westcardapp/models/profile.dart';

abstract class BaseProfileRepository {
  Future<ProfileModel> getProfileData(String param);
  Future<void> updateProfile(ProfileModel profileModel);
}

class ProfileRepository extends BaseProfileRepository {
  @override
  Future<ProfileModel> getProfileData(String param) async {
    // TODO: implement getProfileData
    return null;
  }

  @override
  Future<void> updateProfile(ProfileModel profileModel) async {
    return null;
  }
}
