import 'package:fin_glow/domain/repositories/store_data_repository.dart';
import 'package:fin_glow/presentation/bloc/state/store_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchStoreViewData {
  final StoreViewRepository storeViewRepository;

  FetchStoreViewData(this.storeViewRepository);

  Future<void> call(Emitter<StoreState> emit) async {
    emit(StoreLoading());
    try {
      final storeData = await storeViewRepository.fetchStoreViewData();

      if (storeData.promotions.isEmpty) {
        emit(StoreError(message: 'No se encontraron promociones.'));
        return;
      }

      emit(StoreLoaded(storeData: storeData));
    } catch (error) {
      emit(StoreError(message: error.toString()));
    }
  }
}
