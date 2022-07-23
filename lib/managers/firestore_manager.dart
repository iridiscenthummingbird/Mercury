import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreManager {}

class FireStoreManagerImpl implements FireStoreManager {
  CollectionReference notesCollection = FirebaseFirestore.instance.collection('notes'); //TODO: change

}
