import 'package:flutter/material.dart';

import '../const/color.dart';

class CategoryStat extends StatelessWidget {
  const CategoryStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: darkColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          '종류별 통계',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                          ),
                        ),
                      )),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0))),
                        child: ListView(
                          physics: PageScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                                6,
                                (index) => SizedBox(
                                  //image를 종류별통계 카드 넓이의 1/3 씩 차지하게 하고 싶을 때 constraint를 쓰기
                                  width: constraint.maxWidth / 3,
                                  child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('미세먼지'),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Image.asset(
                                            'asset/img/bad.png',
                                            width: 50.0,
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text('46.0'),
                                        ],
                                      ),
                                )))),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
