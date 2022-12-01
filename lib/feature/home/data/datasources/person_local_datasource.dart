import 'dart:convert';

import 'package:rick_morty/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/person_model.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModel>> getLastPersonsFromCache();
  Future<void> personsToCache(List<PersonModel> persons);
}

const cachedPersonKey = 'CACHED_PERSONS_LIST';

class PersonLocalDataSourceImpl implements PersonLocalDataSource {
  final SharedPreferences prefs;

  PersonLocalDataSourceImpl({required this.prefs});
  @override
  Future<List<PersonModel>> getLastPersonsFromCache() {
    final jsonPersonsList = prefs.getStringList(cachedPersonKey);
    if (jsonPersonsList != null) {
      return Future.value(jsonPersonsList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> personsToCache(List<PersonModel> persons) {
    final List<String> jsonPersonsList =
        persons.map((person) => json.encode(person.toJson())).toList();
    prefs.setStringList(cachedPersonKey, jsonPersonsList);
    print(jsonPersonsList.length);
    return Future.value(jsonPersonsList);
  }
}
