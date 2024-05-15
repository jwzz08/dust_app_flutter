import 'package:dio/dio.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';


class StatRepository {
  static Future<void> fetchData() async {
    for(ItemCode itemCode in ItemCode.values) {
      await fetchDataByItemCode(itemCode: itemCode);
    }
  }

  static Future<List<StatModel>> fetchDataByItemCode({
    required ItemCode itemCode,
  }) async {

    final response = await Dio().get(
        'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
        queryParameters: {
          'serviceKey':
              'oYspEohnHrVGnam3AaI1JAn/9z4BRb9CLh6SUpLwBoHK3UaTgww8E3UK2PnypeamYNesnKifuMrYg7BxQpImHA==',
          'returnType': 'json',
          'numOfRows': 100,
          'pageNo': 1,
          'itemCode': itemCode.name,
          'dataGubun': 'HOUR',
          'searchCondition': 'WEEK',
        });

    final rawItemsList = response.data['response']['body']['items'];

    List<StatModel> stats = [];

    final List<String> skipKeys = [
      'dataGubun',
      'dataTime',
      'itemCode',
    ];

    for (Map<String, dynamic> item in rawItemsList) {
      final dateTime = DateTime.parse(item['dataTime']);

      for (String key in item.keys) {
        if (skipKeys.contains(key)) {
          continue;
        }

        final regionStr = key;
        final stat = double.parse(item[regionStr]);
        final region = Region.values.firstWhere((e) => e.name == regionStr);

        final statModel = StatModel()
          ..region = Region.values.firstWhere((e) => e.name == regionStr)
          ..stat = stat
          ..dateTime = dateTime
          ..itemCode = itemCode;

        final isar = GetIt.I<Isar>();

        final count = await isar.statModels
            .filter()
            .regionEqualTo(region)
            .dateTimeEqualTo(dateTime)
            .itemCodeEqualTo(itemCode)
            .count();


        print(count);

        if(count > 0){
          continue;
        }

        await isar.writeTxn(() async => await isar.statModels.put(statModel));

        //stats = [
        //  ...stats,
        //  StatModel(
        //    region: Region.values.firstWhere((e) => e.name == regionStr),
        //    stat: double.parse(stat),
        //    dateTime: DateTime.parse(dateTime),
        //    itemCode: itemCode,
        //  )
        //];
      }
    }

    return stats;
  }
}
