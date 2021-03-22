import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/pages/home/home_view_model.dart';
import 'package:my_first_bank/widgets/account_card.dart';
import 'package:my_first_bank/widgets/drawer.dart';
import 'package:provider/provider.dart';

import 'home_effect.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        locator<MFBRoute>(),
        locator<Database>(),
      ),
      builder: (context, _){
        return HomeWidget();
      },
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: MFBColors.white,
      appBar: AppBar(
        title: Text(
          viewModel.status.titleBar,
        ),
      ),
      drawerScrimColor: MFBColors.blueOpacity,
      drawer: AppDrawer(
        userName: 'Fabián Jaramillo',
        onTap: (String type) => viewModel.onTapDrawer(type),
        onTapCloseSession: viewModel.onTapCloseSession,
      ),
      body: _homeBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: viewModel.onTapFloating,
      ),
    );
  }
}

class _homeBody extends StatefulWidget {
  @override
  __homeBodyState createState() => __homeBodyState();
}

class __homeBodyState extends State<_homeBody> {

  StreamSubscription<HomeEffect> _effectSubscription;

  @override
  void initState() {

    final viewModel = context.read<HomeViewModel>();

    _effectSubscription = viewModel.effects.listen((event) {
      if(event is HomeSnackBarEffect){
        //GlobalSnackbar.buildErrorSnackbar(context, event.message, event.duration);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().onInit();
    });

    super.initState();
  }

  @override
  void dispose() {
    _effectSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<HomeViewModel>();

    var loading = viewModel.status.isLoading ? CircularProgressIndicator() : SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
          itemCount: viewModel.status.accounts?.length ?? 0,
          itemBuilder: (context, index) {
            return AccountCard(
              account: viewModel.status.accounts[index],
              onTap: () {
                viewModel.onTapCard(viewModel.status.accounts[index]);
              },
              onTapSettings: () {
                viewModel.onTapSettings(viewModel.status.accounts[index], index);
              },
            );
          },
        ),
        loading
      ],
    );
  }
}