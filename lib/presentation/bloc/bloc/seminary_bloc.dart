import 'package:fin_glow/domain/repositories/seminary_data_repository.dart';
import 'package:fin_glow/presentation/bloc/event/seminary_event.dart';
import 'package:fin_glow/presentation/bloc/state/seminary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final EventRepository eventRepository;

  EventBloc({required this.eventRepository}) : super(EventInitial()) {
    on<FetchEvents>((event, emit) async {
      emit(EventLoading());
      try {
        final events = await eventRepository.fetchEvents();
        emit(EventLoaded(events: events));
      } catch (error) {
        emit(EventError(message: error.toString()));
      }
    });
  }
}
