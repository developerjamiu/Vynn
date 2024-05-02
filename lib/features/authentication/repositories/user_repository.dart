import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/features/authentication/models/user_model.dart';

class UserRepository {
  UserRepository({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  CollectionReference<Map<String, dynamic>> get userCollection =>
      _firebaseFirestore.collection('users');

  Stream<UserModel> getUserStream(String userId) {
    return userCollection.doc(userId).snapshots().map(
          (snapshot) => UserModel.fromDocumentSnapshot(snapshot),
        );
  }

  Future<UserModel?> getUser(String userId) async {
    try {
      final user = await userCollection.doc(userId).get();
      if (!user.exists) return null;

      return UserModel.fromDocumentSnapshot(user);
    } catch (_, stackTrace) {
      throw UserException(
        'There was an exception getting user',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> createUser(UserModel user) async {
    try {
      await userCollection.doc(user.uid).set(user.toMap());
    } catch (_, stackTrace) {
      throw UserException(
        'There was an exception getting user',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> updateEmail({
    required String userId,
    required String emailAddress,
  }) async {
    try {
      await userCollection.doc(userId).update(
        {'emailAddress': emailAddress},
      );
    } catch (_, stackTrace) {
      throw UserException(
        'There was an exception getting user',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await userCollection.doc(user.uid).update(user.toMap());
    } catch (_, stackTrace) {
      throw UserException(
        'There was an exception getting user',
        stackTrace: stackTrace,
      );
    }
  }
}

final userRepositoryProvider = Provider(
  (ref) => UserRepository(
    firebaseFirestore: FirebaseFirestore.instance,
  ),
);
