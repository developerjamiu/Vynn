import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/features/authentication/models/user_model.dart';

class UserRepository {
  UserRepository({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  CollectionReference<Map<String, dynamic>> get userCollection =>
      _firebaseFirestore.collection('users');

  Future<UserModel> getUser(String userId) async {
    final user = await userCollection.doc(userId).get();
    return UserModel.fromDocumentSnapshot(user);
  }

  Future<void> createUser(UserModel user) async {
    await userCollection.doc(user.uid).set(user.toMap());
  }

  Future<void> updateEmail({
    required String userId,
    required String emailAddress,
  }) async {
    await userCollection.doc(userId).update(
      {'emailAddress': emailAddress},
    );
  }

  Future<void> updateUser(UserModel user) async {
    await userCollection.doc(user.uid).update(user.toMap());
  }
}

final userRepositoryProvider = Provider(
  (ref) => UserRepository(
    firebaseFirestore: FirebaseFirestore.instance,
  ),
);
