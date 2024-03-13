import 'package:emart_app/consts/consts.dart';

class FirestoreServices {
  //get user data
  static getuser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
