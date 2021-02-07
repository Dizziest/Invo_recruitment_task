import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/constants/app_colors.dart';
import 'package:invorecruitmenttask/models/alergen.dart';
import 'package:invorecruitmenttask/widgets/alergen_list_item.dart';

class AlergensList extends StatelessWidget {
  const AlergensList({
    Key key,
    @required this.alergenList,
  }) : super(key: key);

  final List<Alergen> alergenList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyBorder,
          ),
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: alergenList.length,
            itemBuilder: (context, index) {
              return AlergenListItem(
                  alergen: alergenList[index]
              );
            }
        ),
      )
    );
  }
}
