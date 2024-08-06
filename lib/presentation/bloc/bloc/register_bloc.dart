import 'package:fin_glow/domain/usecases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/register_event.dart';
import 'package:fin_glow/presentation/bloc/state/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(RegisterInitial()) {
    on<RegisterSubmit>((event, emit) async {
      emit(RegisterLoading());
      try {
        await registerUseCase.execute(event.registerModel);
        emit(RegisterSuccess());
      } catch (e) {
        if (e is Exception) {
          emit(RegisterFailure(e.toString()));
        } else {
          emit(RegisterFailure('Error al registrarse'));
        }
      }
    });
  }
}
