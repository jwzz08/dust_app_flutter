import 'package:dio/dio.dart';

class StatRepository {
  static Future<Map<String, dynamic>> fetchData() async {
    final response = await Dio().get(
        'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
        queryParameters: {
          'serviceKey' : 'oYspEohnHrVGnam3AaI1JAn/9z4BRb9CLh6SUpLwBoHK3UaTgww8E3UK2PnypeamYNesnKifuMrYg7BxQpImHA==',
          'returnType' : 'json',
          'numOfRows' : 100,
          'pageNo' : 1,
          'itemCode' : 'PM10',
          'dataGubun' : 'HOUR',
          'searchCondition' : 'WEEK',
        });

    return response.data;
  }
}