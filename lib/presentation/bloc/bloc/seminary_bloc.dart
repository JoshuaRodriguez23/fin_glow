import 'package:fin_glow/domain/usecases/seminary_usecase.dart';
import 'package:fin_glow/presentation/bloc/event/seminary_event.dart';
import 'package:fin_glow/presentation/bloc/state/seminary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final FetchSeminaryEvents fetchSeminaryEvents;

  EventBloc({required this.fetchSeminaryEvents}) : super(EventInitial()) {
    on<FetchEvents>((event, emit) async {
      await fetchSeminaryEvents.call(emit);
    });
  }
}
