import 'package:dusty_dust/const/color.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../const/status_level.dart';
import '../utils/date_utils.dart';
import '../utils/status_utils.dart';

class MainStat extends StatelessWidget {
  final Color primaryColor;
  final Region region;
  final bool isExpanded;

  const MainStat({Key? key, required this.region, required this.primaryColor, required this.isExpanded }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 40.0,
    );

    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: 500,
      pinned: true,
      title: isExpanded? null : Text('${region.krName}'),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: FutureBuilder<StatModel?>(
                future: GetIt.I<Isar>()
                    .statModels
                    .filter()
                    .regionEqualTo(region)
                    .itemCodeEqualTo(ItemCode.PM10)
                    .sortByDateTimeDesc()
                    .findFirst(), //한개만 가져온다
                builder: (context, snapshot) {
                  //로딩중
                  if (!snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('데이터가 없습니다'),
                    );
                  }

                  final statModel = snapshot.data!;

                  final status = StatusUtils.getStatusModelFromStat(statModel: statModel);

                  return Column(
                    children: [
                      SizedBox(
                        height: kToolbarHeight,
                      ),
                      Text(statModel.region.krName,
                          style: ts.copyWith(
                            fontWeight: FontWeight.w700,
                          )),
                      Text(
                        DateUtils.DateTimeToString(dateTime: statModel.dateTime),
                        style: ts.copyWith(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Image.asset(
                        status.imagePath,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(status.label,
                          style: ts.copyWith(
                            fontWeight: FontWeight.w700,
                          )),
                      Text(status.comment,
                          style: ts.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 20.0)),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
