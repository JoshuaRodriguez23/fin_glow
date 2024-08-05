import 'package:equatable/equatable.dart';
import 'package:fin_glow/domain/models/seminary_model.dart';

abstract class EventState extends Equatable {
  @override
  List<Object> get props => [];
}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<Event> events;

  EventLoaded({required this.events});

  @override
  List<Object> get props => [events];
}

class EventError extends EventState {
  final String message;

  EventError({required this.message});

  @override
  List<Object> get props => [message];
}
