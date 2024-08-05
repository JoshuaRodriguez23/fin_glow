import 'package:fin_glow/domain/repositories/seminary_data_repository.dart';
import 'package:fin_glow/presentation/bloc/state/seminary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchSeminaryEvents {
  final EventRepository eventRepository;

  FetchSeminaryEvents(this.eventRepository);

  Future<void> call(Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      final events = await eventRepository.fetchEvents();

      if (events.isEmpty) {
        emit(EventError(message: 'No se encontraron eventos.'));
        return;
      }

      emit(EventLoaded(events: events));
    } catch (error) {
      emit(EventError(message: error.toString()));
    }
  }
}
