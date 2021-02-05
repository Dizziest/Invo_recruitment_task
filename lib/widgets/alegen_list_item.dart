import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/models/alergen.dart';

class alergenListItem extends StatelessWidget {
  const alergenListItem({
    Key key,
    @required this.alergenList,
    @required this.index,
  }) : super(key: key);

  final List<Alergen> alergenList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Color(0xfff3f3f3),
                width: 1.0
            ),
        ),
      ),
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              alergenList[index].name,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400
              ),
            ),
            Image.asset(alergenList[index].image)
          ],
        ),
      ),
    );
  }
}
