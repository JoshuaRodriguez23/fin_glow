import 'package:fin_glow/domain/repositories/profile_data_repository.dart';
import 'package:fin_glow/presentation/bloc/event/profile_event.dart';
import 'package:fin_glow/presentation/bloc/state/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<FetchProfileOptions>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profileOptions = await profileRepository.fetchProfileOptions();
        emit(ProfileLoaded(profileOptions: profileOptions));
      } catch (error) {
        emit(ProfileError(message: error.toString()));
      }
    });
  }
}
