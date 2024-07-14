import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/place_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/place_item_entity.dart';

class PlaceState {
  final List<PlaceEntity>? placeEntityList;
  final List<PlaceItemEntity>? placeItemEntityList;
  final String? error;

  const PlaceState({this.error,this.placeEntityList, this.placeItemEntityList});
}

class PlaceLaunching extends PlaceState {}

class PlaceLoading extends PlaceState {}

class PlacesDone extends PlaceState {
  const PlacesDone({
    required List<PlaceEntity>? placeEntityList,
  }) : super(placeEntityList: placeEntityList);
}

class PlaceItemsDone extends PlaceState {
  const PlaceItemsDone(
      {required List<PlaceItemEntity>? placeItemEntityList})
      : super(placeItemEntityList: placeItemEntityList);
}

class PlaceError extends PlaceState {
  const PlaceError({String? error}) : super(error: error);
}
