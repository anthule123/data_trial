// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String id = '';
  String name = 'Unknown';
  double weight = 0;
  Profile({
    this.id = 'Unknown',
    this.name = 'Unknown',
    this.weight = 0,
  });
  factory Profile.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Profile(
      name: data?['name'],
      id: data?['id'],
      weight: data?['weight'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (name != 'Unknown') "name": name,
      if (id != 'Unknown') 'id': id,
      if (weight != 0) 'weight': weight,
    };
  }

  Profile clone() {
    return Profile(
      id: id,
      name: name,
      weight: weight,
    );
  }
}
