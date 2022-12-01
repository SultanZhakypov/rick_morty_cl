import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/home/domain/usecases/search_person.dart';
import 'package:rick_morty/feature/home/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_morty/feature/home/presentation/bloc/search_bloc/search_state.dart';

import '../../../../../core/error/failure.dart';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPersons;
  PersonSearchBloc({required this.searchPersons})
      : super(PersonSearchInitial()) {
    on<SearchPersons>(
      (event, emit) async {
        emit(PersonSearchLoading());
        final failureOrPerson =
            await searchPersons(SearchPersonParams(query: event.personQuery));
        emit(failureOrPerson.fold(
            (failure) =>
                PersonSearchError(message: _mapFailureToMessage(failure)),
            (person) => PersonSearchSuccess(persons: person)));
      },
    );
  }
  String _mapFailureToMessage(Failure failure) {
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
