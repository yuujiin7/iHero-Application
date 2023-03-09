import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'back_component_model.dart';
export 'back_component_model.dart';

class BackComponentWidget extends StatefulWidget {
  const BackComponentWidget({Key? key}) : super(key: key);

  @override
  _BackComponentWidgetState createState() => _BackComponentWidgetState();
}

class _BackComponentWidgetState extends State<BackComponentWidget> {
  late BackComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackComponentModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 50.0,
              icon: Icon(
                Icons.keyboard_backspace,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('BACK_COMPONENT_keyboard_backspace_ICN_ON');
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('Login');
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: Text(
              'Back',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Ubuntu',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontSize: 16.0,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(FlutterFlowTheme.of(context).title1Family),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
