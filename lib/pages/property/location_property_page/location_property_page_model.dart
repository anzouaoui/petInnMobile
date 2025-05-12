import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_property_page_widget.dart' show LocationPropertyPageWidget;
import 'package:flutter/material.dart';

class LocationPropertyPageModel
    extends FlutterFlowModel<LocationPropertyPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
