import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/export.dart';

enum DataSending {
  failure,
  success,
}

Future<DataSending> createPatient(Profile profile) async {
  // Firebase.initializeApp();
  final data = <String, dynamic>{
    "name": profile.name,
    "id": profile.id,
    "weight": profile.weight,
  };
  final statusData = <String, String>{
    "status": PatientStatus.firstAsk.toString(),
  };
  var db = FirebaseFirestore.instance;

  db
      .collection("test_patient")
      .doc("${profile.id}")
      .collection('profile')
      .doc('single')
      .set(data)
      .onError((e, _) {
    return DataSending.failure;
  });
  db
      .collection("test_patient")
      .doc('${profile.id}')
      .set(statusData)
      .onError((error, stackTrace) => DataSending.failure);
  return DataSending.success;
}
