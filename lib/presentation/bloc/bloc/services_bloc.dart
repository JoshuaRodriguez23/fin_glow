import 'package:fin_glow/domain/usecases/services_usecase.dart';
import 'package:fin_glow/presentation/bloc/event/services_event.dart';
import 'package:fin_glow/presentation/bloc/state/services_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServicesUseCase servicesUseCase;

  ServicesBloc(this.servicesUseCase) : super(ServicesInitial()) {
    on<GetServicesEvent>((event, emit) async {
      emit(ServicesLoading());
      try {
        final services = await servicesUseCase();
        emit(ServicesSuccess(services));
      } catch (e) {
        emit(const ServicesError('Failed to fetch services'));
      }
    });
  }
}
