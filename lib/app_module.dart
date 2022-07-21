import 'package:flutter_barraginha/domain/repositories/local_cache_repository.dart';
import 'package:flutter_barraginha/domain/repositories/part_repository.dart';
import 'package:flutter_barraginha/domain/repositories/project_repository.dart';
import 'package:flutter_barraginha/domain/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/domain/services/api_service.dart';
import 'package:flutter_barraginha/domain/services/coordinate_service.dart';
import 'package:flutter_barraginha/domain/services/database_service.dart';
import 'package:flutter_barraginha/domain/services/device_service.dart';
import 'package:flutter_barraginha/domain/use_cases/add_new_project_case.dart';
import 'package:flutter_barraginha/domain/use_cases/calculate_case.dart';
import 'package:flutter_barraginha/domain/use_cases/calculate_distance_between_coordinates_case.dart';
import 'package:flutter_barraginha/domain/use_cases/delete_part_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_all_parts_by_id_project_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_all_soil_type_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_altitude_by_coordinate_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_info_device_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_show_tutorial_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_soil_type_by_id_case.dart';
import 'package:flutter_barraginha/domain/use_cases/search_projects_case.dart';
import 'package:flutter_barraginha/domain/use_cases/update_project_case.dart';
import 'package:flutter_barraginha/domain/use_cases/update_show_tutorial_case.dart';
import 'package:flutter_barraginha/infra/repositories/local_cache_repository_impl.dart';
import 'package:flutter_barraginha/infra/repositories/part_repository_impl.dart';
import 'package:flutter_barraginha/infra/repositories/project_repository_impl.dart';
import 'package:flutter_barraginha/infra/repositories/soil_type_repository_impl.dart';
import 'package:flutter_barraginha/infra/services/coordinate_service_impl.dart';
import 'package:flutter_barraginha/infra/services/database_service_impl.dart';
import 'package:flutter_barraginha/infra/services/device_service_impl.dart';
import 'package:flutter_barraginha/infra/services/google_api_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Services
        Bind.factory<DatabaseService>((i) => DatabaseServiceImpl()),
        Bind.factory<DeviceService>((i) => DeviceServiceImpl()),
        Bind.factory<APIService>((i) => GoogleAPIServiceImpl()),
        Bind.factory<CoordinateService>((i) => CoordinateServiceImpl()),
        // Repositories
        Bind.factory<LocalCacheRepository>((i) => LocalCacheRepositoryImpl()),
        Bind.factory<SoilTypeRepository>((i) => SoilTypeRepositoryImpl()),
        Bind.factory<ProjectRepository>((i) => ProjectRepositoryImpl(i())),
        Bind.factory<PartRepository>((i) => PartRepositoryImpl(i())),
        // Use Cases
        Bind.factory<GetAltitudeByCoordinateCase>(
            (i) => GetAltitudeByCoordinateCaseImpl(i())),
        Bind.factory<UpdateShowTutorialCase>(
            (i) => UpdateShowTutorialCaseImpl(i())),
        Bind.factory<CalculateDistanceBetweenCoordinatesCase>(
            (i) => CalculateDistanceBetweenCoordinatesCaseImpl(i())),
        Bind.factory<GetAllSoilTypeCase>((i) => GetAllSoilTypeCaseImpl(i())),
        Bind.factory<GetSoilTypeByIdCase>((i) => GetSoilTypeByIdCaseImpl(i())),
        Bind.factory<GetShowTutorialCase>((i) => GetShowTutorialCaseImpl(i())),
        Bind.factory<SearchProjectsCase>((i) => SearchProjectsCaseImpl(i())),
        Bind.factory<UpdateProjectCase>((i) => UpdateProjectCaseImpl(i())),
        Bind.factory<AddNewProjectCase>((i) => AddNewProjectCaseImpl(i(), i())),
        Bind.factory<GetInfoDeviceCase>((i) => GetInfoDeviceCaseImpl(i())),
        Bind.factory<DeletePartCase>((i) => DeletePartCaseImpl(i())),
        Bind.factory<GetAllPartsByIdProjectCase>(
            (i) => GetAllPartsByIdProjectCaseImpl(i())),
        Bind.factory<CalculateCase>((i) => CalculateCaseImpl()),
      ];
}
