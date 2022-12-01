import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty/core/usecases/usecases.dart';

import '../../../../core/error/failure.dart';
import '../entities/person_entity.dart';
import '../repositories/person_repo.dart';

class SearchPerson extends UseCases<List<PersonEntity>, SearchPersonParams> {
  final PersonRepo personRepo;
  SearchPerson({required this.personRepo});

  @override
  Future<Either<Failure, List<PersonEntity>>> call(SearchPersonParams params) async {
    return await personRepo.searchPerson(params.query);
  }
}

class SearchPersonParams extends Equatable {
  final String query;

  const SearchPersonParams({required this.query});
  @override
  List<Object?> get props => [query];
}
