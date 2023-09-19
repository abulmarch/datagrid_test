import 'dart:convert';

import 'package:datagrid_test/services/models/datamodels.dart';
import 'package:http/http.dart' as http;

const String endpoint = "https://mocki.io/v1/21eb3c42-9516-480f-b28d-d854f4962b80";
class DataRepository {
  Future <List<DataModel>> fetchData() async{
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> resultList = jsonDecode(response.body);
      final List<DataModel> decodeList = resultList
          .map((e) => DataModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return decodeList;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}