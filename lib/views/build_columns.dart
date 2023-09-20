import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
class BuildTable {
  List<GridColumn> buildColumns(BuildContext context) {
    return <GridColumn>[
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
                  width: 150,
                  columnName: 'itemtype1',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'item type 1',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                GridColumn(
                  width: 150,
                  columnName: 'itemtype2',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'item type 2',
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
              ];
  }
  List<StackedHeaderRow> buildStackedHeader(BuildContext context) {
    return [
                StackedHeaderRow(
                  cells: [
                    
                    StackedHeaderCell(
                      columnNames: ['itemtype1', 'itemtype2'],
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            'Item Types',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                    StackedHeaderCell(
                      columnNames: ['level1', 'level2'],
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            'Level',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
               
              ];
  }

}

