import 'package:datagrid_test/services/models/datamodels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ApiDataSource extends DataGridSource {
  final BuildContext context; 
  ApiDataSource({ required this.context, required List<DataModel> dataModel}) {
    
    fetchData = dataModel
        .map<DataGridRow>((e) {
          return DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'itemId', value: e.itemid),
              DataGridCell<String>(columnName: 'title', value: e.title),
              DataGridCell<String>(
                columnName: 'date',
                value: formatDate(e.date!),
              ),
              DataGridCell<Status>(
                  columnName: 'status',
                  value: e.status ?? Status(currentcount: 0, totalcount: 0)),
              DataGridCell<ItemType>(
                  columnName: 'itemtype1',
                  value: e.itemtype1 ?? ItemType(value: '', color: '')),
              DataGridCell<ItemType>(
                  columnName: 'itemtype2',
                  value: e.itemtype2 ?? ItemType(value: '', color: '')),
              DataGridCell<List>(columnName: 'level1', value: e.level1 ?? []),
              DataGridCell<List>(columnName: 'level2', value: e.level2 ?? []),
              DataGridCell<bool>(columnName: 'overdue', value: e.overdue ?? false),
              DataGridCell<bool>(columnName: 'active', value: e.active),
            ]);})
        .toList();
  }

  List<DataGridRow> fetchData = [];

  @override
  List<DataGridRow> get rows => fetchData;

  Widget getLinearProgressBar(int currentCount, int totalCount) {
    return SizedBox(
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: 120,
              child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                minHeight: 20,
                value: currentCount / totalCount,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0XFFb14c4c)),
              )),
        ],
      ),
    );
  }

  Widget getItemTypes(String? type1, String? color) {
    Color? bgColor = convertStringToColor(color ?? '');
    return Container(
      height: 30,
            width: 100,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(5)),
      child: Center(child: Text(type1  ?? '', style:  const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),)),
    );
  }

  Widget getLevel(dynamic value) {
    return Wrap(
      spacing: 1,
      runSpacing: 1,
      children: value.map<Widget>((dynamic item) {
        if (item is ItemType) {
          
          final itemType = item;
          final color = itemType.color;
          final bgColor = convertStringToColor(
              color ?? ''); 

          return Container(
            height: 30,
            width: 100,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: Text(
              itemType.value ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )),
          );
        } else if (item is String) {
          return Text(item);
        } else {
          return Text('$item');
        }
      }).toList(),
    );
  }

  Color? convertStringToColor(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return null;
    }

    if (colorString.startsWith('#')) {
      colorString = colorString.substring(1);
    }

    try {
      return Color(int.parse(colorString, radix: 16) + 0xFF000000);
    } catch (e) {
      return null;
    }
  }

  Container buildCalender(DataGridRow row) {
    bool isOverdue = row.getCells()[9].value;
    Future<void> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
     await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    
  }
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (!isOverdue) {
                selectDate(context);
              }
            },
            child: Icon(Icons.calendar_month, color: isOverdue ? Colors.red : Colors.green)),
          Text(row.getCells()[3].value.toString()),
        ],
      ),
    );
  }

Color getRowBackgroundColor(DataGridRow row) {
      final bool active = row.getCells()[10].value;
      if (active) {
       return Colors.transparent;
      }

      return Colors.grey.shade300;
    }
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    
    return DataGridRowAdapter(
      color: getRowBackgroundColor(row),
      cells: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(5.0),
          child: Text(row.getCells()[0].value.toString()),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(5.0),
          child: Text(row.getCells()[1].value.toString()),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(5.0),
          width: 300,
          child: Text(
            row.getCells()[2].value.toString(),
          ),
        ),
        buildCalender(row),
        getLinearProgressBar(row.getCells()[4].value.currentcount,
            row.getCells()[4].value.totalcount),
        getItemTypes(
          row.getCells()[5].value.value,
          row.getCells()[5].value.color,
        ),
        getItemTypes(
          row.getCells()[6].value.value,
          row.getCells()[6].value.color,
        ),
        getLevel(row.getCells()[7].value),
        getLevel(row.getCells()[8].value),
      ],
    );
  }
}

String formatDate(String inputDate) {
  final dateTime = DateTime.parse(inputDate);
  final day = dateTime.day;
  final month = DateFormat.MMMM().format(dateTime);
  final year = dateTime.year;
  final suffix = _getDaySuffix(day);
  final formattedDate = '$day$suffix $month $year';
  return formattedDate;
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
