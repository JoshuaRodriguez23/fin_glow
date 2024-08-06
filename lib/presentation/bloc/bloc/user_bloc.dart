import 'package:fin_glow/domain/usecases/account_usecase.dart';
import 'package:fin_glow/domain/usecases/user_usecase.dart';
import 'package:fin_glow/presentation/bloc/event/user_event.dart';
import 'package:fin_glow/presentation/bloc/state/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;
  final AccountUseCase accountUseCase;

  UserBloc(this.userUseCase, this.accountUseCase) : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userUseCase();
        final account = await accountUseCase();

        emit(UserSuccess(user, account));
      } catch (e) {
        emit(const UserError('Failed to submit user data'));
      }
    });
  }
}
