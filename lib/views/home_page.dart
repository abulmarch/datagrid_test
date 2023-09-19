
import 'package:datagrid_test/services/datagrid/datgrid_source.dart';
import 'package:datagrid_test/services/models/datamodels.dart';
import 'package:datagrid_test/services/repo/data_repository.dart';
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
      body:  FutureBuilder<List<DataModel>>(
        future: fetchData(),
        builder:(context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Color(0XFF003b6d),));
          }else if (snapshot.hasError){
            return Center(child: Text("Error: ${snapshot.error}"));
          } else{
            final dataList = snapshot.data;
            apiDataSource = ApiDataSource(dataModel: dataList!, context: context);
            return SfDataGridTheme(
                data: SfDataGridThemeData(
                    headerColor: const Color(0XFF003b6d),
                    frozenPaneLineColor: Colors.grey,
                    gridLineColor: Colors.grey),
                child: SfDataGrid(
                  onCellTap: (gridCellTapDetails) {
                    final rowIndex = gridCellTapDetails.rowColumnIndex.rowIndex;
                    if (rowIndex >= 0 &&
                        rowIndex < apiDataSource.fetchData.length) {
                      final tappedDataModel =
                          apiDataSource.fetchData[rowIndex - 1];
                      handleRowTap(
                        tappedDataModel,
                      );
                    }
                  },
                  headerGridLinesVisibility: GridLinesVisibility.vertical,
                  rowHeight: 80,
                  frozenColumnsCount: 2,
                  source: apiDataSource,
                  gridLinesVisibility: GridLinesVisibility.both,
                  columns: <GridColumn>[
                    GridColumn(
                      width: 100,
                      columnName: 'id',
                      label: Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ID',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    GridColumn(
                      width: 100,
                      columnName: 'itemId',
                      label: Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'itemId',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    GridColumn(
                      width: 300,
                      columnName: 'title',
                      label: Container(
                        height: 300,
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Title',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    GridColumn(
                      width: 150,
                      columnName: 'date',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Date',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    GridColumn(
                      width: 150,
                      columnName: 'status',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Status',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    GridColumn(
                      width: 100,
                      columnName: 'itemtype1',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Item Type 1',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    GridColumn(
                      width: 100,
                      columnName: 'itemtype2',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Item Type 2',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    GridColumn(
                      width: 210,
                      columnName: 'level1',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Level 1',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    GridColumn(
                      width: 210,
                      columnName: 'level2',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Level 2',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              );
          }
        },
         
      ),
    ));
  }
}
