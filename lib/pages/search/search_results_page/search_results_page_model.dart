import '/components/property_card_component/property_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'search_results_page_widget.dart' show SearchResultsPageWidget;
import 'package:flutter/material.dart';

class SearchResultsPageModel extends FlutterFlowModel<SearchResultsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for PropertyCardComponent component.
  late PropertyCardComponentModel propertyCardComponentModel1;
  // Model for PropertyCardComponent component.
  late PropertyCardComponentModel propertyCardComponentModel2;
  // Model for PropertyCardComponent component.
  late PropertyCardComponentModel propertyCardComponentModel3;
  // Model for PropertyCardComponent component.
  late PropertyCardComponentModel propertyCardComponentModel4;
  // Model for PropertyCardComponent component.
  late PropertyCardComponentModel propertyCardComponentModel5;

  @override
  void initState(BuildContext context) {
    propertyCardComponentModel1 =
        createModel(context, () => PropertyCardComponentModel());
    propertyCardComponentModel2 =
        createModel(context, () => PropertyCardComponentModel());
    propertyCardComponentModel3 =
        createModel(context, () => PropertyCardComponentModel());
    propertyCardComponentModel4 =
        createModel(context, () => PropertyCardComponentModel());
    propertyCardComponentModel5 =
        createModel(context, () => PropertyCardComponentModel());
  }

  @override
  void dispose() {
    propertyCardComponentModel1.dispose();
    propertyCardComponentModel2.dispose();
    propertyCardComponentModel3.dispose();
    propertyCardComponentModel4.dispose();
    propertyCardComponentModel5.dispose();
  }
}
