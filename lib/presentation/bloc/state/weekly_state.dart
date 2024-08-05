import 'package:equatable/equatable.dart';
import 'package:fin_glow/domain/models/weekly_model.dart';

abstract class WeeklyState extends Equatable {
  const WeeklyState();

  @override
  List<Object> get props => [];
}

class WeeklyInitial extends WeeklyState {}

class WeeklyLoading extends WeeklyState {}

class WeeklyLoaded extends WeeklyState {
  final WeeklyViewData data;

  const WeeklyLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class WeeklyError extends WeeklyState {
  final String message;

  const WeeklyError(this.message);

  @override
  List<Object> get props => [message];
}
