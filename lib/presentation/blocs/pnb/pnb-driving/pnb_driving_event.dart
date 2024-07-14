abstract class PnbDrivingEvent {
  const PnbDrivingEvent();
}

class GetPnbWorkListEvent extends PnbDrivingEvent {
  const GetPnbWorkListEvent();
}

class GetPnbWorkFormsEvent extends PnbDrivingEvent {
  const GetPnbWorkFormsEvent();
}

class GetPnbWorkByIdEvent extends PnbDrivingEvent {
  final int id;
  const GetPnbWorkByIdEvent(this.id);
}

class DeletePnbDrivingEvent extends PnbDrivingEvent {
  final int id;
  const DeletePnbDrivingEvent(this.id);
}

class SavePnbDrivingEvent extends PnbDrivingEvent {
  final Map<String,dynamic> requestBody;
  SavePnbDrivingEvent(this.requestBody);
}
