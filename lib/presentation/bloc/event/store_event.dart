import 'package:equatable/equatable.dart';

abstract class StoreEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchStoreData extends StoreEvent {}
