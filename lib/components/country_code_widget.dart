import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'country_code_model.dart';
export 'country_code_model.dart';

class CountryCodeWidget extends StatefulWidget {
  const CountryCodeWidget({Key? key}) : super(key: key);

  @override
  _CountryCodeWidgetState createState() => _CountryCodeWidgetState();
}

class _CountryCodeWidgetState extends State<CountryCodeWidget> {
  late CountryCodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountryCodeModel());

    _model.textController ??= TextEditingController();
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
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 0.0),
            child: Container(
              width: 400.0,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'COUNTRY_CODE_COMP_Icon_rd8lry2g_ON_TAP');
                      logFirebaseEvent('Icon_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.fullscreen_exit_rounded,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 400.0,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 500),
                        () async {
                          logFirebaseEvent(
                              'COUNTRY_CODE_TextField_ee25ev4m_ON_TEXTF');
                          logFirebaseEvent('TextField_update_widget_state');
                          setState(() {
                            _model.searchActive = true;
                          });
                          logFirebaseEvent('TextField_backend_call');
                          _model.apiResultn0w =
                              await CountryCodeSearchCall.call(
                            name: _model.textController.text,
                          );

                          setState(() {});
                        },
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search Country... ex. Philippines',
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(45.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(45.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(45.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(45.0),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        suffixIcon: Icon(
                          Icons.flag,
                          color: Color(0xFF757575),
                          size: 22.0,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      minLines: 1,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 25.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('COUNTRY_CODE_close_rounded_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_update_widget_state');
                    setState(() {
                      _model.searchActive = false;
                    });
                    logFirebaseEvent('IconButton_clear_text_fields');
                    setState(() {
                      _model.textController?.clear();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_model.searchActive)
                    Expanded(
                      child: FutureBuilder<ApiCallResponse>(
                        future: CountryCodeCall.call(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRipple(
                                  color: Color(0xFFFE2126),
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          final containerCountryCodeResponse = snapshot.data!;
                          return Container(
                            width: 400.0,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final countryList = containerCountryCodeResponse
                                    .jsonBody
                                    .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: countryList.length,
                                  itemBuilder: (context, countryListIndex) {
                                    final countryListItem =
                                        countryList[countryListIndex];
                                    return Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'COUNTRY_CODE_Container_n6ele06v_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_update_app_state');
                                          setState(() {
                                            FFAppState().selectedCountryCode =
                                                valueOrDefault<String>(
                                              (CountryCodeCall.callingCodes(
                                                containerCountryCodeResponse
                                                    .jsonBody,
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()[countryListIndex]
                                                  .toString(),
                                              '0',
                                            );
                                          });
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 100.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl: valueOrDefault<
                                                          String>(
                                                        CountryCodeCall.flag(
                                                          containerCountryCodeResponse
                                                              .jsonBody,
                                                        )[countryListIndex],
                                                        'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        (CountryCodeCall
                                                                .alpha3Code(
                                                          containerCountryCodeResponse
                                                              .jsonBody,
                                                        ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()[
                                                                countryListIndex]
                                                            .toString(),
                                                        'Code',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 5,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        (CountryCodeCall.name(
                                                          containerCountryCodeResponse
                                                              .jsonBody,
                                                        ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()[
                                                                countryListIndex]
                                                            .toString(),
                                                        'Country',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 15,
                                                        replacement: '…',
                                                      ),
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      (CountryCodeCall
                                                              .callingCodes(
                                                        containerCountryCodeResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()[
                                                              countryListIndex]
                                                          .toString(),
                                                      'Phone Code',
                                                    ).maybeHandleOverflow(
                                                        maxChars: 5),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  if (_model.searchActive)
                    Container(
                      width: 400.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'COUNTRY_CODE_Container_d89zvhru_ON_TAP');
                                logFirebaseEvent('Container_update_app_state');
                                setState(() {
                                  FFAppState().selectedCountryCode =
                                      CountryCodeSearchCall.callingCodes(
                                    (_model.apiResultn0w?.jsonBody ?? ''),
                                  ).toString();
                                });
                                logFirebaseEvent('Container_bottom_sheet');
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: valueOrDefault<String>(
                                              CountryCodeSearchCall.flag(
                                                (_model.apiResultn0w
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            CountryCodeSearchCall.alpha3Code(
                                              (_model.apiResultn0w?.jsonBody ??
                                                  ''),
                                            ).toString().maybeHandleOverflow(
                                                maxChars: 5),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            CountryCodeSearchCall.name(
                                              (_model.apiResultn0w?.jsonBody ??
                                                  ''),
                                            ).toString().maybeHandleOverflow(
                                                  maxChars: 15,
                                                  replacement: '…',
                                                ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          CountryCodeSearchCall.callingCodes(
                                            (_model.apiResultn0w?.jsonBody ??
                                                ''),
                                          )
                                              .toString()
                                              .maybeHandleOverflow(maxChars: 5),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 12.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
