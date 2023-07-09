import 'package:demo_app/constants/app_color.dart';
import 'package:demo_app/constants/app_typo.dart';
import 'package:demo_app/pages/detail.dart';
import 'package:flutter/material.dart';

class StockList extends StatelessWidget {
  final List<Map<String, dynamic>> headerColumns;
  final List<Map<String, String>> data;

  const StockList({super.key, required this.headerColumns, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 16),
      child: Column(
        children: [
          // Header label
          Row(
            children: headerColumns
                .asMap()
                .values
                .map((item) => Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(item["label"],
                            style: AppTypo.small
                                .copyWith(color: AppColor.secondaryTextColor)),
                      ),
                    ))
                .toList(),
          ),
          // Body list view
          ListView.builder(
              shrinkWrap: true,
              itemCount: data.length > 8 ? 8 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 48,
                  constraints: const BoxConstraints(maxHeight: 48),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: AppColor.borderColor, width: 1)),
                  ),
                  child: Row(
                    children: data[index].entries.map((item) {
                      if (headerColumns
                          .any((element) => element["name"] == item.key)) {
                        return Expanded(
                          flex: 1,
                          child: Container(
                              alignment: int.tryParse(item.value) == null
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: item.key == "volume"
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  Text(
                                    item.value,
                                    style: AppTypo.small.copyWith(
                                        color: item.key == "time"
                                            ? AppColor.secondaryTextColor
                                            : AppColor.primaryTextColor,
                                        fontWeight: item.key == "code"
                                            ? FontWeight.w600
                                            : FontWeight.w400),
                                  ),
                                  item.key == "volume"
                                      ? IconButton(
                                          padding: EdgeInsets.zero,
                                          iconSize: 14,
                                          icon: const Icon(
                                              Icons.arrow_forward_ios),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Detail(
                                                    code: data[index]['code']),
                                              ),
                                            );
                                          },
                                          color: AppColor.secondaryTextColor,
                                        )
                                      : Container()
                                ],
                              )),
                        );
                      } else {
                        return Container();
                      }
                    }).toList(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
