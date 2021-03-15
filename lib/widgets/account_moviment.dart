
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/pages/account_detail/account_detail_view_model.dart';
import 'package:my_first_bank/app_theme.dart';

class AccountMoviment extends StatelessWidget {

  final AccountDetailViewModel viewModel;

  AccountMoviment(this.viewModel);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: MFBColors.white,
        ),
        padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0
        ),
        child: Column(
          children: [
            //Image.network(viewModel.status),
            SizedBox(
              height: 16.0,
            ),
            Text(
              viewModel.status.account.type,
              style: textTheme.subTitleWhite.copyWith(
                  color: MFBColors.blueDark
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              height: 10.0,
              color: MFBColors.blueDark,
            ),
            SizedBox(
              height: 8.0,
            ),
            _item(
              context: context,
              value: '130.000',
              date: '12/03/2021',
              color: MFBColors.green,
            ),
            SizedBox(
              height: 4.0,
            ),
            _item(
              context: context,
              value: '-110.000',
              date: '12/03/2021',
              color: MFBColors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({BuildContext context, String value, String date, Color color}) {

    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                date,
                style: textTheme.subtitleBlack,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Text(
              value,
              style: textTheme.subTitleWhite.copyWith(
                color: color
              ),
            )
          ],
        ),
      ],
    );
  }

}
