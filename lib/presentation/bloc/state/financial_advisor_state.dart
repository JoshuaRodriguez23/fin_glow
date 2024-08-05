import 'package:equatable/equatable.dart';
import 'package:fin_glow/domain/models/financial_advisor_model.dart';

abstract class FinancialAdvisorState extends Equatable {
  @override
  List<Object> get props => [];
}

class FinancialAdvisorInitial extends FinancialAdvisorState {}

class FinancialAdvisorLoading extends FinancialAdvisorState {}

class FinancialAdvisorLoaded extends FinancialAdvisorState {
  final FinancialAdvisorViewData data;

  FinancialAdvisorLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class FinancialAdvisorError extends FinancialAdvisorState {
  final String message;

  FinancialAdvisorError(this.message);

  @override
  List<Object> get props => [message];
}
