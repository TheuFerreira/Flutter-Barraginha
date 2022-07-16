import 'package:flutter_barraginha/domain/repositories/local_cache_repository.dart';
import 'package:flutter_barraginha/domain/use_cases/update_show_tutorial_case.dart';
import 'package:flutter_barraginha/infra/repositories/local_cache_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Repositories
        Bind.factory<LocalCacheRepository>((i) => LocalCacheRepositoryImpl()),
        // Use Cases
        Bind.factory<UpdateShowTutorialCase>(
            (i) => UpdateShowTutorialCaseImpl(i())),
      ];
}
