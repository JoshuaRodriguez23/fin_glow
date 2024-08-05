import 'package:fin_glow/domain/repositories/financial_advisor_data_repository.dart';
import 'package:fin_glow/presentation/bloc/event/financial_advisor_event.dart';
import 'package:fin_glow/presentation/bloc/state/financial_advisor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinancialAdvisorBloc
    extends Bloc<FinancialAdvisorEvent, FinancialAdvisorState> {
  final FinancialAdvisorViewRepository repository;

  FinancialAdvisorBloc(this.repository) : super(FinancialAdvisorInitial()) {
    on<FetchFinancialAdvisorData>(_onFetchFinancialAdvisorData);
  }

  Future<void> _onFetchFinancialAdvisorData(
    FetchFinancialAdvisorData event,
    Emitter<FinancialAdvisorState> emit,
  ) async {
    emit(FinancialAdvisorLoading());
    try {
      final data = await repository.fetchFinancialAdvisorViewData();
      emit(FinancialAdvisorLoaded(data));
    } catch (e) {
      emit(FinancialAdvisorError(e.toString()));
    }
  }
}
