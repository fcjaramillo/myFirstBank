import 'package:flutter/material.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/app_theme.dart';


class AppDrawer extends StatelessWidget {

  final void Function(String) onTap;
  final VoidCallback onTapCloseSession;
  final VoidCallback onTapEdit;
  final String userName;

  AppDrawer({this.onTap, this.onTapCloseSession, this.onTapEdit, this.userName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(context),
            //Divider(),
            _createDrawerItem(context: context, icon: Icons.devices, color: MFBColors.grayIcon, text: 'menu', onTap: () => {onTap('owns')}),
            _createDrawerItem(context: context, icon: Icons.devices_other, color: MFBColors.grayIcon, text: 'menu', onTap: () => {onTap('shared')}),
            _createDrawerItem(context: context, icon: Icons.mail, color: MFBColors.grayIcon, text: 'menu', onTap: () => {onTap('invitacions')}),
            Divider(),
            _createDrawerItem(context: context, icon: Icons.exit_to_app, color: MFBColors.grayIcon, text: 'Cerrar sesión', onTap: onTapCloseSession),
          ],
        )
    );
  }

  Widget _createHeader(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return DrawerHeader(
        margin: EdgeInsets.zero,
        //margin: EdgeInsets.only(top: 8.0),
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              /*child: Image.asset(
                IotAssets.logo,
                width: MediaQuery.of(context).size.width * 0.4,
              ),*/
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 6, right: 10),
              title: Text(
                userName,
                style: textTheme.subtitleBlack.copyWith(
                    fontWeight: FontWeight.w600
                ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'Taxis',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              leading: Icon(
                Icons.account_circle,
                color: MFBColors.grayLight,
                size: 55,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: MFBColors.black,
                ),
                onPressed: onTapEdit,
              ),
            ),
          ],
        ));
  }

  Widget _createDrawerItem(
      {BuildContext context, IconData icon, String text, Color color, void Function() onTap}) {

    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(left: 6.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          text,
          style: textTheme.titleGray,
        ),
        onTap: onTap,
      ),
    );
  }

}
