import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'under_construction_model.dart';
export 'under_construction_model.dart';

class UnderConstructionWidget extends StatefulWidget {
  const UnderConstructionWidget({Key? key}) : super(key: key);

  @override
  _UnderConstructionWidgetState createState() =>
      _UnderConstructionWidgetState();
}

class _UnderConstructionWidgetState extends State<UnderConstructionWidget> {
  late UnderConstructionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnderConstructionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/BGColor.png',
          ).image,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'UNDER_CONSTRUCTION_COMP_close_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
              ],
            ),
          ),
          Container(
            width: 300.0,
            height: 520.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OOPS',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 300.0,
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    'assets/images/e7343921974d022dc76cd73890e44da7.png',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Page is still Under Construction\nFeature will be available soon.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Comfortaa',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
