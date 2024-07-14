import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/place/place_event.dart';
import 'package:hsg_loyalty/presentation/blocs/place/place_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/place_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/place_item_entity.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final Dio _dio;
  final SharedPreferences _prefs;

  PlaceBloc(this._dio, this._prefs) : super(PlaceLaunching()) {
    on<GetPlacesEvent>(onGetPlacesEvent);
    on<GetPlaceItemsEvent>(onGetPlaceItemsEvent);
  }

  Map<String, dynamic> get _headers => <String, dynamic>{'Cookie': _prefs.getString("authToken")};

  void onGetPlacesEvent(GetPlacesEvent event, Emitter<PlaceState> emit) async {
    emit(PlaceLoading());
    try {
      final response = await _dio.get('/Reference/GetPlaces', options: Options(headers: _headers));
      final jsonData = response.data;

      final List<PlaceEntity> places = jsonData.map<PlaceEntity>((item) => PlaceEntity.fromJson(item)).toList();
      emit(PlacesDone(placeEntityList: places));
    } catch (error) {
      print(error);
      emit(const PlaceError(error: 'Failed to load places.'));
    }
  }

  void onGetPlaceItemsEvent(GetPlaceItemsEvent event, Emitter<PlaceState> emit) async {
    emit(PlaceLoading());
    try {
      final response = await _dio.get('/Reference/GetPlaceItems', options: Options(headers: _headers));
      final jsonData = response.data;
      final List<PlaceItemEntity> placeItems = jsonData.map<PlaceItemEntity>((item) => PlaceItemEntity.fromJson(item)).toList();
      emit(PlaceItemsDone(placeItemEntityList: placeItems));
    } catch (error) {
      emit(const PlaceError(error: 'Failed to load place items.'));
    }
  }
}
