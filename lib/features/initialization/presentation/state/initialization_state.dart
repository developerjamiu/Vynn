class InitializationState {
  const InitializationState({
    this.redirectPath,
  });

  final String? redirectPath;

  InitializationState copyWith({
    String? redirectPath,
  }) {
    return InitializationState(
      redirectPath: redirectPath ?? this.redirectPath,
    );
  }
}
