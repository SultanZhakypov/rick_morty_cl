import 'package:equatable/equatable.dart';
import 'package:rick_morty/feature/home/domain/entities/person_entity.dart';

abstract class PersonSearchState extends Equatable {
  const PersonSearchState();
  @override
  List<Object?> get props => [];
}

class PersonSearchInitial extends PersonSearchState {}

class PersonSearchLoading extends PersonSearchState {}

class PersonSearchSuccess extends PersonSearchState {
  final List<PersonEntity> persons;
  const PersonSearchSuccess({required this.persons});
  @override
  List<Object?> get props => [persons];
}

class PersonSearchError extends PersonSearchState {
  final String message;
  const PersonSearchError({required this.message});
  @override
  List<Object?> get props => [message];
}
