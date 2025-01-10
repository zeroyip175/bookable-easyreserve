import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("user")
        .doc(id)
        .set(userInfoMap);
  }

  Future addService(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Service")
        .doc(id)
        .set(userInfoMap);
  }

  Future <Stream<QuerySnapshot>> getallServices() async{
    return await FirebaseFirestore.instance
        .collection("Service").snapshots();
  }
}