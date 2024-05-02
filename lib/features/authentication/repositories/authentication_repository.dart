import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/features/authentication/models/user_model.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<UserModel> signUp({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final User? firebaseUser = credential.user;

      if (firebaseUser == null) {
        await _firebaseAuth.signOut();
        throw AuthenticationException(
          'There was a problem signing up in user',
          stackTrace: StackTrace.current,
        );
      }

      await firebaseUser.sendEmailVerification();

      return UserModel.fromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.message ?? 'There was a problem signing up in user',
        stackTrace: stackTrace,
      );
    } catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  Future<UserModel> signIn({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final User? firebaseUser = credential.user;

      if (firebaseUser == null) {
        await _firebaseAuth.signOut();
        throw AuthenticationException(
          'There was a problem signing in in user',
          stackTrace: StackTrace.current,
        );
      } else if (!firebaseUser.emailVerified) {
        await _firebaseAuth.signOut();
        throw AuthenticationException(
          'Email is not verified',
          stackTrace: StackTrace.current,
        );
      }

      return UserModel.fromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.message ?? 'There was a problem signing in user',
        stackTrace: stackTrace,
      );
    } catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  Future<UserModel?> signInWithGoogle() async {
    if (await _googleSignIn.isSignedIn()) await _googleSignIn.signOut();

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw AuthenticationException(
          'No user was selected',
          stackTrace: StackTrace.current,
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(authCredential);

      final User? firebaseUser = userCredential.user;

      if (firebaseUser == null) {
        await _firebaseAuth.signOut();
        throw AuthenticationException(
          'There was a problem signing in in user',
          stackTrace: StackTrace.current,
        );
      }

      return UserModel.fromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.message ?? 'There was a problem signing in user',
        stackTrace: stackTrace,
      );
    } catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> updateEmail({
    required String newEmailAddress,
    required String password,
  }) async {
    try {
      final User? firebaseUser = currentUser;

      if (firebaseUser == null) {
        await _firebaseAuth.signOut();
        throw AuthenticationException(
          'You\re not signed in. Sign in to update email',
          stackTrace: StackTrace.current,
        );
      }

      AuthCredential authCredential = EmailAuthProvider.credential(
        email: firebaseUser.email!,
        password: password,
      );

      await firebaseUser.reauthenticateWithCredential(authCredential);

      await firebaseUser.verifyBeforeUpdateEmail(newEmailAddress);
    } on FirebaseAuthException catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.message ?? 'There was a problem updating user\'s email',
        stackTrace: stackTrace,
      );
    } catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final User? firebaseUser = currentUser;

      if (firebaseUser == null) {
        await _firebaseAuth.signOut();
        throw AuthenticationException(
          'You\re not signed in. Sign in to update password',
          stackTrace: StackTrace.current,
        );
      }

      AuthCredential authCredential = EmailAuthProvider.credential(
        email: firebaseUser.email!,
        password: oldPassword,
      );

      await firebaseUser.reauthenticateWithCredential(authCredential);

      await firebaseUser.updatePassword(newPassword);
    } on FirebaseAuthException catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.message ?? 'There was a problem updating user\'s password',
        stackTrace: stackTrace,
      );
    } catch (ex, stackTrace) {
      throw AuthenticationException(
        ex.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

final authenticationRepositoryProvider = Provider(
  (ref) => AuthenticationRepository(
    firebaseAuth: FirebaseAuth.instance,
    googleSignIn: GoogleSignIn(scopes: ['email']),
  ),
);
