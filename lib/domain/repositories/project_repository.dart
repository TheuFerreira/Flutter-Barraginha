import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';

abstract class ProjectRepository {
  Future<DisplayProjectResponse> save(DisplayProjectResponse project);
  Future<List<DisplayProjectResponse>> search({String search = ''});
}
