import 'package:fin_glow/domain/usecases/financial_advisor_usecase.dart';
import 'package:fin_glow/presentation/bloc/event/financial_advisor_event.dart';
import 'package:fin_glow/presentation/bloc/state/financial_advisor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinancialAdvisorBloc
    extends Bloc<FinancialAdvisorEvent, FinancialAdvisorState> {
  final FetchAndValidateFinancialAdvisorData useCase;

  FinancialAdvisorBloc(this.useCase) : super(FinancialAdvisorInitial()) {
    on<FetchFinancialAdvisorData>(_onFetchFinancialAdvisorData);
  }

  Future<void> _onFetchFinancialAdvisorData(
    FetchFinancialAdvisorData event,
    Emitter<FinancialAdvisorState> emit,
  ) async {
    await useCase.call(emit);
  }
}