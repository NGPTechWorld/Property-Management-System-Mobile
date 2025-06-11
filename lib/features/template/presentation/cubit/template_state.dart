import 'package:equatable/equatable.dart';

class TemplateCubitState extends Equatable {
  final int templateId;
  final String templateName;
  final String templateDescription;
  final TemplateCubitStatus status;
  const TemplateCubitState({
    required this.status,
    required this.templateId,
    required this.templateName,
    required this.templateDescription,
  });

  @override
  List<Object?> get props => [
    templateId,
    templateName,
    templateDescription,
    status,
  ];

  TemplateCubitState copyWith({
    int? templateId,
    String? templateName,
    String? templateDescription,
  }) {
    return TemplateCubitState(
      templateId: templateId ?? this.templateId,
      templateName: templateName ?? this.templateName,
      templateDescription: templateDescription ?? this.templateDescription,
      status: TemplateCubitStatus.initial,
    );
  }
}

enum TemplateCubitStatus { initial, loading, loaded, error }

extension StatusX on TemplateCubitStatus {
  bool get isInitial => this == TemplateCubitStatus.initial;
  bool get isLoading => this == TemplateCubitStatus.loading;
  bool get isSuccess => this == TemplateCubitStatus.loaded;
  bool get isFailure => this == TemplateCubitStatus.error;
}
