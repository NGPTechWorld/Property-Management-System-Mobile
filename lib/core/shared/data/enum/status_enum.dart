enum BaseCubitStatus { initial, loading, loaded, error }

extension StatusX on BaseCubitStatus {
  bool get isInitial => this == BaseCubitStatus.initial;
  bool get isLoading => this == BaseCubitStatus.loading;
  bool get isSuccess => this == BaseCubitStatus.loaded;
  bool get isFailure => this == BaseCubitStatus.error;
}
