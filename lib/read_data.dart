import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'city_model.dart';

Future<void> readData2() async {
  var db = FirebaseFirestore.instance;
  final ref = db.collection("cities").doc("LA").withConverter(
        fromFirestore: City.fromFirestore,
        toFirestore: (City city, _) => city.toFirestore(),
      );
  final docSnap = await ref.get();
  final city = docSnap.data();

  // Convert to City object
  if (city != null) {
    print(city.country);
  } else {
    print("No such document.");
  }
}

Future<void> uploadData() async {
  City Hanoi = City(
    capital: true,
    state: 'Ha noi',
    country: 'Viet Nam',
  );
  var db = FirebaseFirestore.instance;
  db.collection('cities').doc('HN').set(Hanoi.toFirestore());
}
