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
            _createDrawerItem(context: context, icon: Icons.home, color: MFBColors.grayIcon, text: 'Cuentas Bancarias', onTap: () => {onTap('home')}),
            _createDrawerItem(context: context, icon: Icons.send_to_mobile, color: MFBColors.grayIcon, text: 'Enviar Dinero', onTap: () => {onTap('send')}),
            _createDrawerItem(context: context, icon: Icons.qr_code, color: MFBColors.grayIcon, text: 'Crear Codigo Qr', onTap: () => {onTap('read')}),
            _createDrawerItem(context: context, icon: Icons.qr_code_scanner, color: MFBColors.grayIcon, text: 'Scan Codigo Qr', onTap: () => {onTap('scanner')}),
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
              child: Text(
                'Mi Primer Banco',
                style: textTheme.titleBlue,
              ),
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
                'App bancaria',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              leading: Icon(
                Icons.account_circle,
                color: MFBColors.grayLight,
                size: 55,
              ),
              /*trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: MFBColors.black,
                ),
                onPressed: onTapEdit,
              ),*/
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
