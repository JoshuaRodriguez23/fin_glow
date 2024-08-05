import 'package:equatable/equatable.dart';

abstract class FinancialAdvisorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFinancialAdvisorData extends FinancialAdvisorEvent {}
