import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getLengthCollection() async {
  QuerySnapshot _myDoc =
      await FirebaseFirestore.instance.collection('cities').get();
  List<DocumentSnapshot> _myDocCount = _myDoc.docs;
  print(_myDocCount.length); // Count of Documents in Collection
}
