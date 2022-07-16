import 'package:flutter_barraginha/domain/repositories/local_cache_repository.dart';
import 'package:flutter_barraginha/domain/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/domain/use_cases/get_all_soil_type_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_show_tutorial_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_soil_type_by_id_case.dart';
import 'package:flutter_barraginha/domain/use_cases/update_show_tutorial_case.dart';
import 'package:flutter_barraginha/infra/repositories/local_cache_repository_impl.dart';
import 'package:flutter_barraginha/infra/repositories/soil_type_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Repositories
        Bind.factory<LocalCacheRepository>((i) => LocalCacheRepositoryImpl()),
        Bind.factory<SoilTypeRepository>((i) => SoilTypeRepositoryImpl()),
        // Use Cases
        Bind.factory<UpdateShowTutorialCase>(
            (i) => UpdateShowTutorialCaseImpl(i())),
        Bind.factory<GetAllSoilTypeCase>((i) => GetAllSoilTypeCaseImpl(i())),
        Bind.factory<GetSoilTypeByIdCase>((i) => GetSoilTypeByIdCaseImpl(i())),
        Bind.factory<GetShowTutorialCase>((i) => GetShowTutorialCaseImpl(i())),
      ];
}
