import 'package:fin_glow/domain/models/store_model.dart';

abstract class StoreState {}

class StoreInitial extends StoreState {}

class StoreLoading extends StoreState {}

class StoreLoaded extends StoreState {
  final StoreViewData storeData;

  StoreLoaded({required this.storeData});
}

class StoreError extends StoreState {
  final String message;

  StoreError({required this.message});
}
