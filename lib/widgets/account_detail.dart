
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/pages/account_detail/account_detail_view_model.dart';
import 'package:my_first_bank/app_theme.dart';

class AccountDetail extends StatelessWidget {

  final AccountDetailViewModel viewModel;

  AccountDetail(this.viewModel);

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
              icon: Icons.monetization_on_outlined,
              value: 'Saldo : ${viewModel.status.account.balance}',
              color: MFBColors.blue,
            ),
            SizedBox(
              height: 4.0,
            ),
            _item(
              context: context,
              icon: Icons.person,
              value: 'Cedula: ${viewModel.status.account.idTitular} ',
              color: MFBColors.blue,
            ),
            SizedBox(
              height: 4.0,
            ),
            _item(
              context: context,
              icon: Icons.money,
              value: 'Número de cuenta: ${viewModel.status.account.number}',
              color: MFBColors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({BuildContext context, IconData icon, String value,  Color color}) {

    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Text(
            value,
            style: textTheme.subtitleBlack,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        )
      ],
    );
  }

}
