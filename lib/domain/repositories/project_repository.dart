import 'package:flutter_barraginha/domain/entities/display_project_response.dart';

abstract class ProjectRepository {
  Future<DisplayProjectResponse> save(DisplayProjectResponse project);
  Future<List<DisplayProjectResponse>> search({String search = ''});
  Future<DisplayProjectResponse> getById(int id);
}
