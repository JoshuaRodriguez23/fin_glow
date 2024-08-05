import 'package:fin_glow/domain/repositories/financial_advisor_data_repository.dart';
import 'package:fin_glow/presentation/bloc/state/financial_advisor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchAndValidateFinancialAdvisorData {
  final FinancialAdvisorViewRepository repository;

  FetchAndValidateFinancialAdvisorData(this.repository);

  Future<void> call(Emitter<FinancialAdvisorState> emit) async {
    emit(FinancialAdvisorLoading());
    try {
      final data = await repository.fetchFinancialAdvisorViewData();

      // Validate title
      if (data.title.isEmpty) {
        throw Exception(
            'El título del asesor financiero no puede estar vacío.');
      }

      // Validate question
      if (data.question.isEmpty) {
        throw Exception(
            'La pregunta del asesor financiero no puede estar vacía.');
      }

      // Validate options
      if (data.options.isEmpty) {
        throw Exception('Debe haber al menos una opción disponible.');
      }

      for (var option in data.options) {
        if (option.icon.isEmpty ||
            option.title.isEmpty ||
            option.subtitle.isEmpty) {
          throw Exception(
              'Cada opción debe tener un ícono, título y subtítulo.');
        }
      }

      emit(FinancialAdvisorLoaded(data));
    } catch (e) {
      emit(FinancialAdvisorError(e.toString()));
    }
  }
}
