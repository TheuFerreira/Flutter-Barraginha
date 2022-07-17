import 'package:flutter_barraginha/domain/repositories/local_cache_repository.dart';
import 'package:flutter_barraginha/domain/repositories/project_repository.dart';
import 'package:flutter_barraginha/domain/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/domain/services/database_service.dart';
import 'package:flutter_barraginha/domain/services/device_service.dart';
import 'package:flutter_barraginha/domain/use_cases/add_new_project_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_all_soil_type_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_info_device_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_show_tutorial_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_soil_type_by_id_case.dart';
import 'package:flutter_barraginha/domain/use_cases/search_projects_case.dart';
import 'package:flutter_barraginha/domain/use_cases/update_project_case.dart';
import 'package:flutter_barraginha/domain/use_cases/update_show_tutorial_case.dart';
import 'package:flutter_barraginha/infra/repositories/local_cache_repository_impl.dart';
import 'package:flutter_barraginha/infra/repositories/project_repository_impl.dart';
import 'package:flutter_barraginha/infra/repositories/soil_type_repository_impl.dart';
import 'package:flutter_barraginha/infra/services/database_service_impl.dart';
import 'package:flutter_barraginha/infra/services/device_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Services
        Bind.factory<DatabaseService>((i) => DatabaseServiceImpl()),
        Bind.factory<DeviceService>((i) => DeviceServiceImpl()),
        // Repositories
        Bind.factory<LocalCacheRepository>((i) => LocalCacheRepositoryImpl()),
        Bind.factory<SoilTypeRepository>((i) => SoilTypeRepositoryImpl()),
        Bind.factory<ProjectRepository>((i) => ProjectRepositoryImpl(i())),
        // Use Cases
        Bind.factory<UpdateShowTutorialCase>(
            (i) => UpdateShowTutorialCaseImpl(i())),
        Bind.factory<GetAllSoilTypeCase>((i) => GetAllSoilTypeCaseImpl(i())),
        Bind.factory<GetSoilTypeByIdCase>((i) => GetSoilTypeByIdCaseImpl(i())),
        Bind.factory<GetShowTutorialCase>((i) => GetShowTutorialCaseImpl(i())),
        Bind.factory<SearchProjectsCase>((i) => SearchProjectsCaseImpl(i())),
        Bind.factory<UpdateProjectCase>((i) => UpdateProjectCaseImpl(i())),
        Bind.factory<AddNewProjectCase>((i) => AddNewProjectCaseImpl(i(), i())),
        Bind.factory<GetInfoDeviceCase>((i) => GetInfoDeviceCaseImpl(i())),
      ];
}
