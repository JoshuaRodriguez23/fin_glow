import 'package:fin_glow/domain/repositories/store_data_repository.dart';
import 'package:fin_glow/presentation/bloc/event/store_event.dart';
import 'package:fin_glow/presentation/bloc/state/store_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreViewRepository storeViewRepository;

  StoreBloc({required this.storeViewRepository}) : super(StoreInitial()) {
    on<FetchStoreData>(_onFetchStoreData);
  }

  Future<void> _onFetchStoreData(
      FetchStoreData event, Emitter<StoreState> emit) async {
    emit(StoreLoading());
    try {
      final storeData = await storeViewRepository.fetchStoreViewData();
      emit(StoreLoaded(storeData: storeData));
    } catch (e) {
      emit(StoreError(message: e.toString()));
    }
  }
}