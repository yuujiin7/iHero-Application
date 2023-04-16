import '/components/country_code_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_for_country_code_model.dart';
export 'search_for_country_code_model.dart';

class SearchForCountryCodeWidget extends StatefulWidget {
  const SearchForCountryCodeWidget({Key? key}) : super(key: key);

  @override
  _SearchForCountryCodeWidgetState createState() =>
      _SearchForCountryCodeWidgetState();
}

class _SearchForCountryCodeWidgetState
    extends State<SearchForCountryCodeWidget> {
  late SearchForCountryCodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchForCountryCodeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      onTap: () async {
        logFirebaseEvent('SEARCH_FOR_COUNTRY_CODE_Container_8lem13');
        logFirebaseEvent('Container_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Color(0x00000000),
          enableDrag: false,
          context: context,
          builder: (bottomSheetContext) {
            return Padding(
              padding: MediaQuery.of(bottomSheetContext).viewInsets,
              child: CountryCodeWidget(),
            );
          },
        ).then((value) => setState(() {}));
      },
      child: Container(
        width: 100.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 24.0,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '+${FFAppState().selectedCountryCode}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 18.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
