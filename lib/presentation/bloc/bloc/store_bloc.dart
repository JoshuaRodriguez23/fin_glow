import 'package:fin_glow/domain/repositories/store_data_repository.dart';
import 'package:fin_glow/presentation/bloc/event/store_event.dart';
import 'package:fin_glow/presentation/bloc/state/store_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreViewRepository storeViewRepository;

  StoreBloc({required this.storeViewRepository}) : super(StoreInitial());

  Stream<StoreState> mapEventToState(StoreEvent event) async* {
    if (event is FetchStoreData) {
      yield StoreLoading();
      try {
        final storeData = await storeViewRepository.fetchStoreViewData();
        yield StoreLoaded(storeData: storeData);
      } catch (e) {
        yield StoreError(message: e.toString());
      }
    }
  }
}
