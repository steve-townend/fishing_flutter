// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:_app_framework/app/components/app_error.dart';
import 'package:_app_framework/app/components/app_loading.dart';
import 'package:_app_framework/app/components/dropdown.dart';
import 'package:_app_framework/app/components/form_textfield.dart';
import 'package:_app_framework/app/new_trip/models/new_trip.dart';
import 'package:_app_framework/app/new_trip/view_models/new_trip_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class NewTripForm extends StatefulWidget {
  const NewTripForm({super.key, required this.formKey});

  final GlobalKey<FormState>? formKey;

  @override
  State<NewTripForm> createState() => _NewTripFormState();
}

class _NewTripFormState extends State<NewTripForm> {

  late NewTripViewModel _viewModel;

  @override
   void initState() {

    _viewModel = Provider.of<NewTripViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

          _viewModel.getReferenceData();
    });

    super.initState();
  }
  
  bool readOnly = false;
  

  // Form values
  DateTime tripDate = DateTime.now();
  DropdownItem? venue;
  DropdownItem? stretch;
  String peg = "";
  String geoLocation = "";
  String trend = "";
  String weather = "";
  String notes = "";
  double riverLevel = 0;

  @override
  Widget build(BuildContext context) {

    return Consumer<NewTripViewModel>(
      builder: (context, model, child) {
        return _ui(model);
      }
    );
  }
  _ui(NewTripViewModel model) {
    if (model.loading) {
      return const AppLoading(); 
    }
  
    if (model.hasError) {
      return AppError(appError: model.browseError); 
    }

    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            FormTextField(
              initialValue: DateFormat("yyyy-MM-dd HH:mm").format(tripDate),
              hintText: "Date of trip and start time", 
              readOnly: readOnly,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a date/time';
                } else {
                  try {
                    DateTime.parse(value);
                    return null;
                  } catch (e) {
                    return 'Date/time is not valid';
                  }
                }
              },
              onSaved: (val) { 
                setState(() => tripDate = DateTime.parse(val));
              }
            ),
            
            Dropdown(
              items: model.venues,
              onChanged: (item) {
                setState(() {
                  venue = item;
                });

                model.filterStretches(item.id);
              },
            ),
      
            Dropdown(
              items: model.stretches,
              onChanged: (item) {
                setState(() {
                  stretch = item;
                });
              },
            ),
      
            FormTextField(
              initialValue: "",
              hintText: "Peg", 
              readOnly: readOnly,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a peg';
                }
                return null;
              },
              onSaved: (val) {
                setState(() => peg = val);
              },
            ),
      
            FormTextField(
              initialValue: "",
              hintText: "Geo location", 
              readOnly: readOnly,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a geo location';
                }
                return null;
              },
              onSaved: (val) { 
                setState(() => geoLocation = val);
              }
            ),
            
            FormTextField(
              initialValue: "",
              hintText: "River level", 
              readOnly: readOnly,
              validator: (value) {
                return null;
              },
              onSaved: (val) { 
                setState(() => riverLevel = double.parse(val));
              }
            ),
            
            FormTextField(
              initialValue: "",
              hintText: "River trend", 
              readOnly: readOnly,
              validator: (value) {
                return null;
              },
              onSaved: (val) { 
                setState(() => trend = val);
              }
            ),
            
            FormTextField(
              initialValue: "",
              hintText: "Weather", 
              readOnly: readOnly,
              validator: (value) {
                return null;
              },
              onSaved: (val) { 
                setState(() => weather = val);
              }
            ),
            
            FormTextField(
              initialValue: "",
              hintText: "Notes", 
              readOnly: readOnly,
              validator: (value) {
                return null;
              },
              onSaved: (val) { 
                setState(() => notes = val);
              }
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
      
                    // Validate returns true if the form is valid, or false otherwise.
                    if (widget.formKey!.currentState!.validate()) {

                      widget.formKey!.currentState!.save();

                      venue ??= model.venues.first;
                      stretch ??= model.stretches.first;
                      
                      var trip = NewTrip(
                        date: tripDate, 
                        peg: peg, 
                        geoLocation: geoLocation, 
                        riverLevel: riverLevel, 
                        trend: trend, 
                        weather: weather, 
                        notes: notes, 
                        venueId: venue!.id, 
                        stretchId: stretch!.id
                      );

                      await model.saveTrip(trip);
      
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context, true);
      
                    } 
                  },
                  child: const Text('Submit'),
                ),      
      
              ],
            )
          ]
        );

  }
}