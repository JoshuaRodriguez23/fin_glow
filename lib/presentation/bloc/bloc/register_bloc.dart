import 'package:fin_glow/domain/usecases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/register_event.dart';
import 'package:fin_glow/presentation/bloc/state/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SubmitRegister submitRegister;

  RegisterBloc(this.submitRegister) : super(RegisterInitial()) {
    on<SubmitRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        await submitRegister(event.register);
        emit(RegisterSuccess());
      } catch (e) {
        emit(const RegisterError('Failed to submit Register'));
      }
    });
  }
}
