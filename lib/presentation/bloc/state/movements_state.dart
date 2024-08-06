import 'package:equatable/equatable.dart';
import 'package:fin_glow/domain/models/movements_model.dart';

abstract class MovementState extends Equatable {
  const MovementState();

  @override
  List<Object> get props => [];
}

class MovementInitial extends MovementState {}

class MovementLoading extends MovementState {}

class MovementSuccess extends MovementState {
  final MovementsModel movement;

  const MovementSuccess(this.movement);

  @override
  List<Object> get props => [movement];
}

class MovementsSuccess extends MovementState {
  final List<MovementsModel> movements;

  const MovementsSuccess(this.movements);

  @override
  List<Object> get props => [movements];
}

class MovementError extends MovementState {
  final String message;

  const MovementError(this.message);

  @override
  List<Object> get props => [message];
}
