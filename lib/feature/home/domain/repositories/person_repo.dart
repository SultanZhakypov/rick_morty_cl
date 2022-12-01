import 'package:dartz/dartz.dart';
import 'package:rick_morty/feature/home/domain/entities/person_entity.dart';
import '../../../../core/error/failure.dart';

abstract class PersonRepo {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}
