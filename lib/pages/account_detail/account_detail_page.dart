import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/pages/account_detail/account_detail_view_model.dart';
import 'package:my_first_bank/widgets/account_detail.dart';
import 'package:my_first_bank/widgets/account_moviment.dart';
import 'package:provider/provider.dart';

class AccountDetailPage extends StatelessWidget {

  final AccountModel _account;

  AccountDetailPage(this._account);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AccountDetailViewModel(
        locator<MFBRoute>(),
        _account
      ),
      builder: (context, _){
        return AccountDetailWidget();
      },
    );
  }
}


class AccountDetailWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final viewModel = context.watch<AccountDetailViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          viewModel.status.titleBar,
        ),
      ),
      body: _body(),
    );
  }
}

class _body extends StatefulWidget {
  @override
  __bodyState createState() => __bodyState();
}

class __bodyState extends State<_body> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context.read<AccountDetailViewModel>().onTapTab(tabController.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final viewModel = context.watch<AccountDetailViewModel>();

    Future<bool> _onBackPressed() async {
      if (Navigator.of(context).userGestureInProgress)
        return false;
      //else
      //await _viewModel.onTapBack();
    }

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          SizedBox(
            height: 74.0,
            child: AppBar(
              elevation: 0,
              backgroundColor: MFBColors.white,
              bottom: TabBar(
                controller: tabController,
                onTap: (index) {
                  viewModel.onTapTab(index);
                },
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.list,
                      color: viewModel.status.colorTabDetail,
                    ),
                    child: Text(
                      'Detalle',
                      style: TextStyle(
                          color: viewModel.status.colorTabDetail
                      ),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.drive_file_move_outline,
                      color: viewModel.status.colorTabMovements,
                    ),
                    child: Text(
                      'Movimientos',
                      style: TextStyle(
                          color: viewModel.status.colorTabMovements
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  AccountDetail(viewModel),
                  AccountMoviment(viewModel),
                ],
              )
          )
        ],
      ),
    );
  }
}