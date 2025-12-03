import 'package:flutter/foundation.dart';
import 'package:sectionweek2/models/profile.dart';
import 'package:sectionweek2/repositories/profile_repo.dart';

class ProfileProvider extends ChangeNotifier {
  Profile? profile;
  bool profileLoading = false;
  Future<void> fetchProfile() async {
    profileLoading = true;
    notifyListeners();
    profile = await ProfileRepo().fetchProfile();
    print('Profile fetched: ${profile?.name}');
    await Future.delayed(Duration(seconds: 2));
    profileLoading = false;
    notifyListeners();
  }

  void updateProfile(Profile profile) {
    this.profile = profile;
    notifyListeners();
  }
}
