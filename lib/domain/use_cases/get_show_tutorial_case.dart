import 'package:flutter_barraginha/domain/repositories/local_cache_repository.dart';

abstract class GetShowTutorialCase {
  Future<bool> call();
}

class GetShowTutorialCaseImpl implements GetShowTutorialCase {
  final LocalCacheRepository _localCacheRepository;

  GetShowTutorialCaseImpl(this._localCacheRepository);

  @override
  Future<bool> call() async {
    final value = await _localCacheRepository.getBool('show_tutorial');
    return value ?? false;
  }
}
