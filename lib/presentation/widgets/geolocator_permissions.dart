import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq_assessment/di/injector.dart';
import 'package:pricelocq_assessment/domain/features/cubit/location_permission_cubit.dart';

class GeolocatorPermissions extends StatefulWidget {
  const GeolocatorPermissions({super.key, required this.child});

  final Widget child;

  @override
  State<GeolocatorPermissions> createState() => _GeolocatorPermissionsState();
}

class _GeolocatorPermissionsState extends State<GeolocatorPermissions> {
  @override
  void initState() {
    super.initState();
    Injector.locationPermissionCubit.checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPermissionCubit, LocationPermissionState>(
        builder: (context, state) {
      return state.when(
        initial: buildPermissionInProgress,
        inProgress: buildPermissionInProgress,
        denied: buildPermissionDenied,
        granted: () => widget.child,
      );
    });
  }

  Widget buildPermissionDenied() {
    return const Center(
      child: Text(
          'Please check your app settings to allow location for this feature.'),
    );
  }

  Widget buildPermissionInProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
