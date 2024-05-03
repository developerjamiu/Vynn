import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/features/authentication/repositories/authentication_repository.dart';
import 'package:vynn/features/authentication/repositories/user_repository.dart';

final userProvider = StreamProvider.autoDispose(
  (ref) {
    final user = ref.watch(authenticationRepositoryProvider).currentUser;
    return ref.watch(userRepositoryProvider).getUserStream(user!.uid);
  },
);
