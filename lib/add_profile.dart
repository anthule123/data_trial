import 'package:cloud_firestore/cloud_firestore.dart';

import 'data/models/profile.dart';

Future<void> addProfile() async {
  Profile an = Profile(
    name: 'An Le',
    id: '123',
    weight: 50,
  );
  var db = FirebaseFirestore.instance;
  db.collection('profile_trials').doc('123').set(an.toFirestore());
}
