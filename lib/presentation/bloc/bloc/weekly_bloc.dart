import 'package:fin_glow/domain/repositories/weekly_data_repository.dart';
import 'package:fin_glow/presentation/bloc/event/weekly_event.dart';
import 'package:fin_glow/presentation/bloc/state/weekly_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeeklyBloc extends Bloc<WeeklyEvent, WeeklyState> {
  final WeeklyViewRepository repository;

  WeeklyBloc(this.repository) : super(WeeklyInitial()) {
    on<FetchWeeklyData>((event, emit) async {
      emit(WeeklyLoading());
      try {
        final data = await repository.fetchWeeklyViewData();
        emit(WeeklyLoaded(data));
      } catch (e) {
        emit(const WeeklyError('Failed to load data'));
      }
    });
  }
}
