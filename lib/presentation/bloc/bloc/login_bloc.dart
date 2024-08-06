import 'package:fin_glow/domain/usecases/login_usecase.dart';
import 'package:fin_glow/presentation/bloc/event/login_event.dart';
import 'package:fin_glow/presentation/bloc/state/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginSubmitEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await loginUseCase(event.loginModel);
        emit(LoginSuccess());
      } catch (e) {
        emit(const LoginError('Failed to login'));
      }
    });
  }
}
