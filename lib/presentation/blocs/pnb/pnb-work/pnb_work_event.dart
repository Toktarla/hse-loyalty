abstract class PnbWorkEvent {
  const PnbWorkEvent();
}

class GetPnbWorkListEvent extends PnbWorkEvent {
  const GetPnbWorkListEvent();
}

class GetPnbWorkFormsEvent extends PnbWorkEvent {
  const GetPnbWorkFormsEvent();
}

class GetPnbWorkByIdEvent extends PnbWorkEvent {
  final int id;
  const GetPnbWorkByIdEvent(this.id);
}

class DeletePnbWorkEvent extends PnbWorkEvent {
  final int id;
  const DeletePnbWorkEvent(this.id);
}

class SavePnbWorkEvent extends PnbWorkEvent {
  final Map<String,dynamic> requestBody;
  SavePnbWorkEvent(this.requestBody);
}
