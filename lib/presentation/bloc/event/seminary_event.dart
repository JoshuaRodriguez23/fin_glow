import 'package:equatable/equatable.dart';

abstract class EventEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchEvents extends EventEvent {}
