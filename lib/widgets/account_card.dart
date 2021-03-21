import 'package:flutter/material.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/app_theme.dart';

class AccountCard extends StatelessWidget {

  final AccountModel account;
  final VoidCallback onTap;

  AccountCard({this.account, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 12.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Stack(
          children: [
            _cardProperties(context),
            _image()
          ],
        ),
      ),
    );
  }

  Widget _cardProperties(BuildContext context){

    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: MFBColors.blueDark,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0)
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              account.type,
              style: textTheme.titleWhite,
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              height: 10.0,
              color: MFBColors.white,
            ),
            SizedBox(
              height: 8.0,
            ),
            _item(
              context: context,
              icon: Icons.monetization_on_outlined,
              value: account.balance.toString(),
              color: MFBColors.blue,
            ),
            SizedBox(
              height: 4.0,
            ),
            _item(
              context: context,
              icon: Icons.person,
              value: account.idTitular.toString(),
              color: MFBColors.blue,
            ),
            SizedBox(
              height: 4.0,
            ),
            _item(
              context: context,
              icon: Icons.money,
              value: account.number.toString(),
              color: MFBColors.blue,
            ),
            SizedBox(
              height: 4.0,
            ),
            _item(
              context: context,
              icon: Icons.home,
              value: account.bank,
              color: MFBColors.blue,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Ver más',
                  style: textTheme.subTitleWhite.copyWith(
                    fontWeight: FontWeight.normal
                  ),
                ),
              ],
            )
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
        Text(
          value,
          style: textTheme.subTitleWhite,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  Widget _image (){
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 16.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: Image.network(
        'https://www.monederosmart.com/wp-content/uploads/2020/04/Popov-53994032_m.jpg',
        height: 150.0,
        width: 92.0,
      ),
    );
  }

}
