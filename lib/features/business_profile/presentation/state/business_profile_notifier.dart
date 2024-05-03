import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/features/authentication/repositories/authentication_repository.dart';

class BusinessProfileNotifier extends StateNotifier<void> {
  BusinessProfileNotifier({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(null);

  final AuthenticationRepository _authenticationRepository;

  void signOut() => _authenticationRepository.signOut();
}

final businessProfileNotifierProvider =
    StateNotifierProvider.autoDispose<BusinessProfileNotifier, void>(
  (ref) => BusinessProfileNotifier(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
  ),
);
