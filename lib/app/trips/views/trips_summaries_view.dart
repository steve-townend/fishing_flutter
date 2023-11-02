import 'package:_app_framework/app/components/app_bar_and_nav_bar_scaffold.dart';
import 'package:_app_framework/app/components/app_error.dart';
import 'package:_app_framework/app/components/app_loading.dart';
import 'package:_app_framework/app/trips/view_models/trips_view_model.dart';
import 'package:_app_framework/app/trips/views/trip_summary_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripSummariesView extends StatefulWidget {
  const TripSummariesView({super.key});

 @override
  TripSummariesViewState createState() => TripSummariesViewState();
}
class TripSummariesViewState extends State<TripSummariesView>  {

  late TripsViewModel _viewModel;

  @override
   void initState() {

    _viewModel = Provider.of<TripsViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

          _viewModel.getTrips();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AppBarAndNavBarScaffold(
      navName: "Trips",
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<TripsViewModel>(
            builder: (_, model, child) {
              return _ui(model);
            }
          ),
      ),
    );
  }

 _ui(TripsViewModel viewModel) {
  
  if (viewModel.loading) {
      return const AppLoading(); 
    }
  
    if (viewModel.hasError) {
      return AppError(appError: viewModel.browseError); 
    }

    return TripSummaryItem(trips: viewModel.trips);
 }
}