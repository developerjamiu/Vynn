import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.profilePhotoUrl,
    this.businessInfo,
    // TODO: Make the following properties of another sub-model i.e.Content Prefs
    this.contentFocus,
    this.contentTone,
    this.targetAudience,
  });

  final String email;
  final String uid;
  final String firstName;
  final String? lastName;
  final String? profilePhotoUrl;
  final String? businessInfo;
  final String? contentFocus;
  final String? contentTone;
  final String? targetAudience;

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
      businessInfo: data['businessInfo'],
      contentFocus: data['contentFocus'],
      contentTone: data['contentTone'],
      targetAudience: data['targetAudience'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (profilePhotoUrl != null) 'profilePhotoUrl': profilePhotoUrl,
      if (businessInfo != null) 'businessInfo': businessInfo,
      if (contentFocus != null) 'contentFocus': contentFocus,
      if (contentTone != null) 'contentTone': contentTone,
      if (targetAudience != null) 'targetAudience': targetAudience,
    };
  }

  UserModel copyWith({
    String? email,
    String? uid,
    String? firstName,
    String? lastName,
    String? profilePhotoUrl,
    String? businessInfo,
    String? contentFocus,
    String? contentTone,
    String? targetAudience,
  }) {
    return UserModel(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      businessInfo: businessInfo ?? this.businessInfo,
      contentFocus: contentFocus ?? this.contentFocus,
      contentTone: contentTone ?? this.contentTone,
      targetAudience: targetAudience ?? this.targetAudience,
    );
  }
}
