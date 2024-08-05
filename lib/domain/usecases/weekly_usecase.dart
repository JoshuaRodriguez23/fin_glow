import 'package:fin_glow/domain/repositories/weekly_data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/presentation/bloc/state/weekly_state.dart';

class WeeklyDataUseCase {
  final WeeklyViewRepository repository;

  WeeklyDataUseCase(this.repository);

  Future<void> call(Emitter<WeeklyState> emit) async {
    emit(WeeklyLoading());
    try {
      final data = await repository.fetchWeeklyViewData();
      emit(WeeklyLoaded(data));
    } catch (e) {
      emit(const WeeklyError('Failed to load data'));
    }
  }
}
