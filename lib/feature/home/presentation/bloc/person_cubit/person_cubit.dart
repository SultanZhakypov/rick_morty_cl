import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/home/domain/entities/person_entity.dart';
import 'package:rick_morty/feature/home/domain/usecases/get_all_person.dart';
import 'package:rick_morty/feature/home/presentation/bloc/person_cubit/person_state_cubit.dart';

import '../../../../../core/error/failure.dart';

class PersonListCubit extends Cubit<PersonState> {
  final GetAllPersons getAllPersons;
  PersonListCubit({required this.getAllPersons}) : super(PersonInitialState());
  int page = 1;

  void loadingPerson() async {
    if (state is PersonLoadingState) return;

    final currentState = state;
    var oldPerson = <PersonEntity>[];
    if (currentState is PersonSuccessState) {
      oldPerson = currentState.personList;
      
    }

    emit(PersonLoadingState(page == 1, oldPerson));
    final failureOrPerson = await getAllPersons(PagePersonParams(page: page));

    failureOrPerson.fold(
        (error) => emit(PersonErrorState(message: mapFailureToMessage(error))),
        (character) {
      page++;
      final persons = (state as PersonLoadingState).oldPersonsList;
      persons.addAll(character);
      emit(PersonSuccessState(persons));
    });
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
