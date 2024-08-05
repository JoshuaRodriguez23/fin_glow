import 'package:fin_glow/domain/repositories/profile_data_repository.dart';
import 'package:fin_glow/presentation/bloc/state/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchAndValidateProfileData {
  final ProfileRepository profileRepository; // Cambiar el nombre aquí

  FetchAndValidateProfileData(this.profileRepository); // Cambiar el nombre aquí

  Future<void> call(Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final data = await profileRepository.fetchProfileOptions();

      // Validar datos del perfil
      if (data.isEmpty) {
        throw Exception('No se encontraron opciones de perfil.');
      }

      for (var option in data) {
        if (option.title.isEmpty) {
          throw Exception('Cada opción debe tener un título.');
        }
        // Agrega más validaciones según tus requisitos
      }

      emit(ProfileLoaded(profileOptions: data));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
