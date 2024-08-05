import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/domain/usecases/weekly_usecase.dart';
import 'package:fin_glow/presentation/bloc/event/weekly_event.dart';
import 'package:fin_glow/presentation/bloc/state/weekly_state.dart';

class WeeklyBloc extends Bloc<WeeklyEvent, WeeklyState> {
  final WeeklyDataUseCase weeklyDataUseCase;

  WeeklyBloc(this.weeklyDataUseCase) : super(WeeklyInitial()) {
    on<FetchWeeklyData>((event, emit) async {
      await weeklyDataUseCase.call(emit);
    });
  }
}
