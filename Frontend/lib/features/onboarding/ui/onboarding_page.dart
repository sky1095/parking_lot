import 'package:flutter/material.dart';
import 'package:parking_system/core/di/app_dependency_injector.dart';
import 'package:parking_system/features/onboarding/domain/bloc/onboarding_bloc.dart';

import '../domain/model/request_model/create_parking_lot_request_model.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  final _formKey = GlobalKey<FormState>();

  String parkingLotName = '';
  String location = '';
  List<Map<String, String>> slots = [];

  final onboardingBloc = AppDependencyInjector.getIt.get<OnboardingBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Lot Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Parking Lot Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => parkingLotName = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
                onSaved: (value) => location = value!,
              ),
              const SizedBox(height: 20),
              const Text(
                '** This will use the default config to create the parking slots',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // ParkinglotDb.addParkinglot(parkingLotName, location);
      onboardingBloc.add(
        CreateParkingLotEvent(
          requestModel: CreateParkingLotRequestModel(
            name: parkingLotName,
            location: location,
          ),
        ),
      );
      Navigator.pop(context);
    }
  }
}
