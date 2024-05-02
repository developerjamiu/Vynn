import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.profilePhotoUrl,
  });

  final String email;
  final String uid;
  final String firstName;
  final String? lastName;
  final String? profilePhotoUrl;

  factory UserModel.fromFirebaseUser(User firebaseUser) {
    final userDisplayName = firebaseUser.displayName;
    final initialUserName = firebaseUser.email!.split('@').first;
    final firstName = userDisplayName?.split(' ')[0] ?? initialUserName;
    final lastName = userDisplayName?.split(' ')[1];

    return UserModel(
      firstName: firstName,
      lastName: lastName,
      email: firebaseUser.email!,
      profilePhotoUrl: firebaseUser.photoURL,
      uid: firebaseUser.uid,
    );
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot.id,
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'],
      profilePhotoUrl: data['profilePhotoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (profilePhotoUrl != null) 'profilePhotoUrl': profilePhotoUrl,
    };
  }
}
