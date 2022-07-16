import 'dart:developer';

import 'package:flutter_barraginha/domain/repositories/local_cache_repository.dart';

abstract class UpdateShowTutorialCase {
  Future<void> call(bool value);
}

class UpdateShowTutorialCaseImpl implements UpdateShowTutorialCase {
  final LocalCacheRepository _localCacheRepository;

  UpdateShowTutorialCaseImpl(this._localCacheRepository);

  @override
  Future<void> call(bool value) async {
    log('${DateTime.now()}: Setting Show Tutorial local variable to $value');
    await _localCacheRepository.setBool('show_tutorial', value);
    log('${DateTime.now()}: Show Tutorial local variable changed value to $value');
  }
}
