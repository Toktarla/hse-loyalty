import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';

abstract class QorgayEvent {
  const QorgayEvent();
}

class AddQorgayEvent extends QorgayEvent {
  final CreateQorgayEntity requestBody;
  const AddQorgayEvent(this.requestBody);
}

class GetQorgausByPhoneIdEvent extends QorgayEvent {
  const GetQorgausByPhoneIdEvent();
}

class GetQorgausByUseridEvent extends QorgayEvent {
  final int userId;
  const GetQorgausByUseridEvent(this.userId);
}

class GetObservationTypesEvent extends QorgayEvent {
  const GetObservationTypesEvent();
}

class GetOrganizationsEvent extends QorgayEvent {
  const GetOrganizationsEvent();
}

class GetOrgDepartmentsEvent extends QorgayEvent {
  final int? orgId;
  const GetOrgDepartmentsEvent(this.orgId);
}

class GetObservationCategoriesEvent extends QorgayEvent {
  const GetObservationCategoriesEvent();
}



