import 'package:_app_framework/app/trips/models/fishing_trip_summaries.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TripSummaryItem extends StatelessWidget {
  const TripSummaryItem({super.key, required this.trips});

  final List<FishingTripSummaries> trips;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          //controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.filter_alt_outlined),
            hintText: 'Filters will be up here eventually',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.blue)
            ),
          ),
          //onChanged: search,
        ),        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: trips.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 4.0,
                child: Column(
                  children:[
                    ListTile(
                      title: Text("${DateFormat("E dd MMM yyyy").format(trips[index].date)}, starting at ${DateFormat("HH:mm").format(trips[index].date)}", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[700])),
                      subtitle: Text("${trips[index].location}\n${trips[index].riverLevel}", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey))
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 16.0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Summary", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey[700])),
                          Text("Caught: ${trips[index].catchSummary}", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey)),
                          Text("Caught on: ${trips[index].baitSummary}", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey))
                        ],
                      ),
                    ),
                  ], 
                )
              );
            })
        )
      ]
    );
  }
}