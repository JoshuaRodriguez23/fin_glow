import 'package:equatable/equatable.dart';
import 'package:fin_glow/domain/models/profile_model.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<ProfileOption> profileOptions;

  ProfileLoaded({required this.profileOptions});

  @override
  List<Object> get props => [profileOptions];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});

  @override
  List<Object> get props => [message];
}
