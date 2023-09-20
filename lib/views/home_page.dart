import 'package:datagrid_test/services/datagrid/datgrid_source.dart';
import 'package:datagrid_test/services/models/datamodels.dart';
import 'package:datagrid_test/services/repo/data_repository.dart';
import 'package:datagrid_test/views/build_columns.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ApiDataSource apiDataSource =
      ApiDataSource(dataModel: [], context: context);
  final dataRepository = DataRepository();
  bool isLoading = true;
  List<DataModel> dataList = [];
  final buildtable = BuildTable();
  @override
  void initState() {
    super.initState();
  }

  Future<List<DataModel>> fetchData() async {
    return dataRepository.fetchData();
  }

  void handleRowTap(DataGridRow row) {
    final isActive = row.getCells()[10].value;
    if (isActive == true) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return DetailPage(
              row: row,
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder<List<DataModel>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color(0XFF003b6d),
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final dataList = snapshot.data;
            apiDataSource =
                ApiDataSource(dataModel: dataList!, context: context);
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                  headerColor: const Color(0XFF003b6d),
                  frozenPaneLineColor: Colors.grey,
                  gridLineColor: Colors.grey),
              child: SfDataGrid(
                
                onCellTap: (gridCellTapDetails) {
                  final rowIndex = gridCellTapDetails.rowColumnIndex.rowIndex-2;
                  if (rowIndex >= 0 &&
                      rowIndex < apiDataSource.fetchData.length) {
                    final tappedDataModel =
                        apiDataSource.fetchData[rowIndex];
                    handleRowTap(
                      tappedDataModel,
                    );
                  }
                },
                headerGridLinesVisibility: GridLinesVisibility.both,
                onQueryRowHeight: (details) {
                  return details.getIntrinsicRowHeight(details.rowIndex);
                },
                frozenColumnsCount: 2,
                source: apiDataSource,
                gridLinesVisibility: GridLinesVisibility.both,
                columns: buildtable.buildColumns(context),
                stackedHeaderRows: buildtable.buildStackedHeader(context),
                
              ),
            );
          }
        },
      ),
    ));
  }
}
