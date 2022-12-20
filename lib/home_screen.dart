import 'package:bloc_app/read_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //messUp();
    //messUp2();
    // readData();
    //subCollectData();
    // city();
    // query();
    // readDocument();
    //readData2();
    uploadData();
    return Container();
  }
}

Future<int> messUp() async {
  var db = FirebaseFirestore.instance;
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };

// Add a new document with a generated ID
  db.collection("users").add(user).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));
  return 1;
}

Future<int> messUp2() async {
  var db = FirebaseFirestore.instance;
  final user = <String, dynamic>{"first": "lee", "last": "hả", "born": 1854};

// Add a new document with a generated ID
  db.collection("users").add(user).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));

  return 1;
}

Future<void> readData() async {
  var db = FirebaseFirestore.instance;
  await db.collection("users").get().then((event) {
    for (var doc in event.docs) {
      // print("${doc.id} => ${doc.data()}");
      print(doc.data()['first']);
    }
  });
}

Future<void> subCollectData() async {
  var db = FirebaseFirestore.instance;
  final messageRef = db
      .collection("rooms")
      .doc("roomA")
      .collection("messages")
      .doc("message1");
}

Future<void> city() async {
  var db = FirebaseFirestore.instance;
  var citiesRef = db.collection("cities");

  final cities = db.collection("cities");
  final data1 = <String, dynamic>{
    "name": "San Francisco",
    "state": "CA",
    "country": "USA",
    "capital": false,
    "population": 860000,
    "regions": ["west_coast", "norcal"]
  };
  cities.doc("SF").set(data1);

  final data2 = <String, dynamic>{
    "name": "Los Angeles",
    "state": "CA",
    "country": "USA",
    "capital": false,
    "population": 3900000,
    "regions": ["west_coast", "socal"],
  };
  cities.doc("LA").set(data2);

  final data3 = <String, dynamic>{
    "name": "Washington D.C.",
    "state": null,
    "country": "USA",
    "capital": true,
    "population": 680000,
    "regions": ["east_coast"]
  };
  cities.doc("DC").set(data3);

  final data4 = <String, dynamic>{
    "name": "Tokyo",
    "state": null,
    "country": "Japan",
    "capital": true,
    "population": 9000000,
    "regions": ["kanto", "honshu"]
  };
  cities.doc("TOK").set(data4);

  final data5 = <String, dynamic>{
    "name": "Beijing",
    "state": null,
    "country": "China",
    "capital": true,
    "population": 21500000,
    "regions": ["jingjinji", "hebei"],
  };
  cities.doc("BJ").set(data5);
}

Future<void> query() async {
  var db = FirebaseFirestore.instance;
  var citiesRef = db.collection("cities");

  final stateQuery = citiesRef.where('state', isEqualTo: 'CA');
  final populationQuery = citiesRef.where("population", isGreaterThan: 100000);
  final nameQuery = citiesRef.where("name", isGreaterThan: "San Francisco");
  final content = stateQuery.get().then((value) => print(value));
  // print(content);
}

Future<void> readDocument() async {
  var db = FirebaseFirestore.instance;
  final docRef = db.collection("cities").doc("SF");
  docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      // ...
      print(data);
    },
    onError: (e) => print("Error getting document: $e"),
  );
}
