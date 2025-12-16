import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:sectionweek2/models/profile.dart';

class ProfileRepo {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Profile> fetchProfile() async {
    print(
      'Fetching profile from Firebase... user id: ${FirebaseAuth.instance.currentUser?.uid}',
    );
    try {
      DocumentSnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      Map<String, dynamic> data = querySnapshot.data() as Map<String, dynamic>;
      print('Profile data: $data');
      Profile profile = Profile.fromJson(data);
      return profile;
    } catch (e) {
      print('Error fetching profile from Firebase: $e');
      return Profile(name: '', email: '', image: '', purchasedBooks: []);
    }
  }
}
