import 'package:equatable/equatable.dart';

abstract class WeeklyEvent extends Equatable {
  const WeeklyEvent();

  @override
  List<Object> get props => [];
}

class FetchWeeklyData extends WeeklyEvent {}
