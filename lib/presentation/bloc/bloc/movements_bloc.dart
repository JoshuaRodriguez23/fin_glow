import 'package:fin_glow/domain/usecases/movements_usecase.dart';
import 'package:fin_glow/presentation/bloc/event/movements_event.dart';
import 'package:fin_glow/presentation/bloc/state/movements_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovementBloc extends Bloc<MovementEvent, MovementState> {
  final MovementUseCase movementUseCase;

  MovementBloc(this.movementUseCase) : super(MovementInitial()) {
    on<GetMovementEvent>((event, emit) async {
      emit(MovementLoading());
      try {
        final movement = await movementUseCase.fetchMovement(event.id);
        emit(MovementSuccess(movement));
      } catch (e) {
        emit(const MovementError('Failed to fetch movement data'));
      }
    });

    on<GetMovementsEvent>((event, emit) async {
      emit(MovementLoading());
      try {
        final movementsList = await movementUseCase.fetchMovements();
        emit(MovementsSuccess(movementsList.movements));
      } catch (e) {
        emit(const MovementError('Failed to fetch movements data'));
      }
    });
  }
}
