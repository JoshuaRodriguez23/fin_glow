import 'package:fin_glow/presentation/bloc/event/profile_event.dart';
import 'package:fin_glow/presentation/bloc/state/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/domain/usecases/profile_usecase.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchAndValidateProfileData fetchAndValidateProfileData;

  ProfileBloc({required this.fetchAndValidateProfileData})
      : super(ProfileInitial()) {
    on<FetchProfileOptions>((event, emit) async {
      await fetchAndValidateProfileData.call(emit);
    });
  }
}
