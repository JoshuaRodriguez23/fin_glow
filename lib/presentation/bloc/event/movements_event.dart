import 'package:equatable/equatable.dart';

abstract class MovementEvent extends Equatable {
  const MovementEvent();

  @override
  List<Object> get props => [];
}

class GetMovementEvent extends MovementEvent {
  final int id;

  const GetMovementEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetMovementsEvent extends MovementEvent {}
