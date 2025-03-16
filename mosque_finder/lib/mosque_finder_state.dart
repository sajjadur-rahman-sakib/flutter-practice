import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


@freezed
class MosqueFinderState with _$MosqueFinderState {
  const factory MosqueFinderState({
    @Default(null) LatLng? currentLocation,
    @Default({}) Set<Marker> markers,
    @Default(true) bool isLoading,
    @Default('1000') String searchRadius,
    @Default(null) String? error,
    @Default(14.0) double zoom,
    @Default(false) bool isMapInitialized,
    @Default(false) bool isLocationEnabled,
    @Default(false) bool hasLocationPermission,
    final String searchRadius;
  }) = _MosqueFinderState;

  const MosqueFinderState._();
}

extension MosqueFinderStateX on MosqueFinderState {
  bool get canSearchMosques => 
    currentLocation != null && 
    isLocationEnabled && 
    hasLocationPermission && 
    !isLoading;

  bool get hasFoundMosques => 
    markers.isNotEmpty && 
    markers.length > 1; // More than just current location marker

  int get mosqueCount => 
    markers.isEmpty ? 0 : markers.length - 1; // Subtract current location marker
} 