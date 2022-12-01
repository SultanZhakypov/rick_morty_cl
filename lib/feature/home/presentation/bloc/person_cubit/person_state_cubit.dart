import 'package:equatable/equatable.dart';
import 'package:rick_morty/feature/home/domain/entities/person_entity.dart';

abstract class PersonState extends Equatable {
  const PersonState();
  @override
  List<Object?> get props => [];
}

class PersonInitialState extends PersonState {
  @override
  List<Object?> get props => [];
}

class PersonLoadingState extends PersonState {
  final List<PersonEntity> oldPersonsList;
  final bool isFirstFetch;

  const PersonLoadingState(this.isFirstFetch, this.oldPersonsList);
  @override
  List<Object?> get props => [oldPersonsList];
}

class PersonSuccessState extends PersonState {
  final List<PersonEntity> personList;

  const PersonSuccessState(this.personList);
  @override
  List<Object?> get props => [personList];
}

class PersonErrorState extends PersonState {
  final String message;

  const PersonErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
