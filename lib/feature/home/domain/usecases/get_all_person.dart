import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty/core/usecases/usecases.dart';
import 'package:rick_morty/feature/home/domain/entities/person_entity.dart';
import 'package:rick_morty/feature/home/domain/repositories/person_repo.dart';

import '../../../../core/error/failure.dart';

class GetAllPersons extends UseCases<List<PersonEntity>, PagePersonParams> {
  final PersonRepo personRepo;
  GetAllPersons({required this.personRepo});

  @override
  Future<Either<Failure, List<PersonEntity>>> call(
      PagePersonParams params) async {
    return await personRepo.getAllPersons(params.page);
  }
}

class PagePersonParams extends Equatable {
  final int page;

  const PagePersonParams({required this.page});
  @override
  List<Object?> get props => [page];
}
