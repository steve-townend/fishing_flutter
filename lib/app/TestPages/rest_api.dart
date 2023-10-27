
import 'package:_app_framework/app/TestPages/rest_api_view_model.dart';
import 'package:_app_framework/app/components/app_error.dart';
import 'package:_app_framework/app/components/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_bar_and_nav_bar_scaffold.dart';


class RestApiView extends StatefulWidget {
  const RestApiView({super.key});

 @override
  RestApiViewState createState() => RestApiViewState();
}
class RestApiViewState extends State<RestApiView>  {

  late RestApiViewModel _viewModel;

  @override
   void initState() {

    _viewModel = Provider.of<RestApiViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

          _viewModel.getUsers();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AppBarAndNavBarScaffold(
      navName: "API Test",
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<RestApiViewModel>(
            builder: (_, model, child) {
              return _ui(model);
            }
          ),
      ),
    );
  }

 _ui(RestApiViewModel viewModel) {
  
  if (viewModel.loading) {
      return const AppLoading(); 
    }
  
    if (viewModel.hasError) {
      return AppError(appError: viewModel.browseError); 
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: viewModel.users.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(viewModel.users[index].username);
            })
        )
      ]
    );
 }
}