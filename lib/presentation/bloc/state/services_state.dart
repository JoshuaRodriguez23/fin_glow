import 'package:equatable/equatable.dart';
import 'package:fin_glow/domain/models/services_model.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesSuccess extends ServicesState {
  final ServicesResponse services;

  const ServicesSuccess(this.services);

  @override
  List<Object> get props => [services];
}

class ServicesError extends ServicesState {
  final String message;

  const ServicesError(this.message);

  @override
  List<Object> get props => [message];
}
