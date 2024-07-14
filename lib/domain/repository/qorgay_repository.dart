import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/departament_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/observation_category_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/observation_type_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/organization_entity.dart';
import 'package:hsg_loyalty/domain/entity/list/qorgay_entity.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

abstract class QorgayRepository {

  Future<DataState<IsSuccessResponse>> addQorgay(CreateQorgayEntity requestBody);

  Future<DataState<List<QorgayEntity>>> getQorgayList();

  Future<DataState<List<QorgayEntity>>> getQorgaysByUserId(int userId);

  Future<DataState<List<ObservationTypeEntity>>> getObservationTypes();

  Future<DataState<List<OrganizationEntity>>> getOrganizations();

  Future<DataState<List<DepartmentEntity>>> getDepartments(int organizationId);

  Future<DataState<List<ObservationCategoryEntity>>> getObservationCategories();
}


