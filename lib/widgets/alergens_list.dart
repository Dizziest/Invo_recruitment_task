import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/models/alergen.dart';
import 'package:invorecruitmenttask/widgets/alegen_list_item.dart';

class alergensList extends StatelessWidget {
  const alergensList({
    Key key,
    @required this.alergenList,
  }) : super(key: key);

  final List<Alergen> alergenList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: alergenList.length,
          itemBuilder: (context, index) {
            return alergenListItem(alergenList: alergenList, index: index);
          }),
    );
  }
}
