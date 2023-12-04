import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'catalogo_model.dart';
export 'catalogo_model.dart';

class CatalogoWidget extends StatefulWidget {
  const CatalogoWidget({super.key});

  @override
  _CatalogoWidgetState createState() => _CatalogoWidgetState();
}

class _CatalogoWidgetState extends State<CatalogoWidget>
    with TickerProviderStateMixin {
  late CatalogoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatalogoModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderWidth: 1.0,
                  buttonSize: 48.0,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                Text(
                  'Catálogo',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 36.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 40.0,
                  borderWidth: 1.0,
                  buttonSize: 48.0,
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('Cart');
                  },
                ),
              ],
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: const Alignment(-1.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: false,
                      isScrollable: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                              ),
                      unselectedLabelStyle: const TextStyle(),
                      labelColor: FlutterFlowTheme.of(context).tertiary,
                      unselectedLabelColor: const Color(0xFF57636C),
                      backgroundColor: const Color(0xFFE95804),
                      borderColor: const Color(0x4C2009EF),
                      borderWidth: 2.0,
                      borderRadius: 12.0,
                      elevation: 0.0,
                      labelPadding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      buttonMargin:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 0.0),
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      tabs: const [
                        Tab(
                          text: 'Ropa',
                        ),
                        Tab(
                          text: 'Figuras',
                        ),
                        Tab(
                          text: 'Variados',
                        ),
                      ],
                      controller: _model.tabBarController,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PagedListView<DocumentSnapshot<Object?>?,
                                  ProductosRecord>.separated(
                                pagingController: _model.setListViewController1(
                                  ProductosRecord.collection.where(
                                    'Categoria',
                                    isEqualTo: valueOrDefault<String>(
                                      'ropa',
                                      'ROPA',
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                primary: false,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                                builderDelegate:
                                    PagedChildBuilderDelegate<ProductosRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      const Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFFFF5E00),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      const Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFFFF5E00),
                                        ),
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewProductosRecord = _model
                                        .listViewPagingController1!
                                        .itemList![listViewIndex];
                                    return Container(
                                      width: 100.0,
                                      height: 140.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    listViewProductosRecord
                                                        .imagen,
                                                    width: 147.0,
                                                    height: 120.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listViewProductosRecord
                                                        .nombreProducto,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge,
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      listViewProductosRecord
                                                          .precio,
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: 'RD\$ ',
                                                      format: '.00',
                                                      locale: '',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    1.00, 0.00),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  hoverIconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  icon: Icon(
                                                    Icons
                                                        .add_circle_outline_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await CarritoRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createCarritoRecordData(
                                                          nombreProducto:
                                                              listViewProductosRecord
                                                                  .nombreProducto,
                                                          precio:
                                                              listViewProductosRecord
                                                                  .precio,
                                                          categoria:
                                                              listViewProductosRecord
                                                                  .categoria,
                                                          imagen:
                                                              listViewProductosRecord
                                                                  .imagen,
                                                        ));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Agregado al carrito',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PagedListView<DocumentSnapshot<Object?>?,
                                  ProductosRecord>.separated(
                                pagingController: _model.setListViewController2(
                                  ProductosRecord.collection.where(
                                    'Categoria',
                                    isEqualTo: valueOrDefault<String>(
                                      'figura',
                                      'ROPA',
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                primary: false,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                                builderDelegate:
                                    PagedChildBuilderDelegate<ProductosRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      const Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFFFF5E00),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      const Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFFFF5E00),
                                        ),
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewProductosRecord = _model
                                        .listViewPagingController2!
                                        .itemList![listViewIndex];
                                    return Container(
                                      width: 100.0,
                                      height: 140.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    listViewProductosRecord
                                                        .imagen,
                                                    width: 147.0,
                                                    height: 120.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listViewProductosRecord
                                                        .nombreProducto,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge,
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      listViewProductosRecord
                                                          .precio,
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: 'RD\$ ',
                                                      format: '.00',
                                                      locale: '',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    1.00, 0.00),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  hoverIconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  icon: Icon(
                                                    Icons
                                                        .add_circle_outline_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await CarritoRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createCarritoRecordData(
                                                          nombreProducto:
                                                              listViewProductosRecord
                                                                  .nombreProducto,
                                                          precio:
                                                              listViewProductosRecord
                                                                  .precio,
                                                          categoria:
                                                              listViewProductosRecord
                                                                  .categoria,
                                                          imagen:
                                                              listViewProductosRecord
                                                                  .imagen,
                                                        ));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Agregado al carrito',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PagedListView<DocumentSnapshot<Object?>?,
                                    ProductosRecord>.separated(
                                  pagingController:
                                      _model.setListViewController3(
                                    ProductosRecord.collection.where(
                                      'Categoria',
                                      isEqualTo: 'variados',
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  primary: false,
                                  shrinkWrap: true,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10.0),
                                  builderDelegate: PagedChildBuilderDelegate<
                                      ProductosRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        const Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFFFF5E00),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        const Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFFFF5E00),
                                          ),
                                        ),
                                      ),
                                    ),

                                    itemBuilder: (context, _, listViewIndex) {
                                      final listViewProductosRecord = _model
                                          .listViewPagingController3!
                                          .itemList![listViewIndex];
                                      return Container(
                                        width: 100.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      listViewProductosRecord
                                                          .imagen,
                                                      width: 147.0,
                                                      height: 120.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listViewProductosRecord
                                                          .nombreProducto,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                    Text(
                                                      formatNumber(
                                                        listViewProductosRecord
                                                            .precio,
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'RD\$ ',
                                                        format: '.00',
                                                        locale: '',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.00, 0.00),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    hoverIconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                    icon: Icon(
                                                      Icons
                                                          .add_circle_outline_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      await CarritoRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createCarritoRecordData(
                                                            nombreProducto:
                                                                listViewProductosRecord
                                                                    .nombreProducto,
                                                            precio:
                                                                listViewProductosRecord
                                                                    .precio,
                                                            categoria:
                                                                listViewProductosRecord
                                                                    .categoria,
                                                            imagen:
                                                                listViewProductosRecord
                                                                    .imagen,
                                                          ));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Agregado al carrito',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
