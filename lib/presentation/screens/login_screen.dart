import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq_assessment/di/injector.dart';
import 'package:pricelocq_assessment/domain/features/auth/auth.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';
import 'package:pricelocq_assessment/presentation/router/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController =
      TextEditingController(text: kDebugMode ? '+639021234567' : null);
  final _passwordController =
      TextEditingController(text: kDebugMode ? '123456' : null);

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (!RegExp(r'^(?:\d{11}|\+\d{12})$').hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      // Do your login logic here
      final mobile = _mobileController.text;
      final password = _passwordController.text;

      injector<AuthBloc>().add(AuthEventLogin(mobile, password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(height: 32.0),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                  ),
                  validator: _validateMobile,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: _validatePassword,
                ),
                SizedBox(height: 32.0),
                buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return BlocConsumer<AuthBloc, AuthState>(
      // bloc: injector<AuthBloc>(),
      listener: (context, state) {
        if (state is AuthStateAuthenticated) {
          // Navigator.of(context).pushReplacementNamed(LocqRoutes.homeScreen);
          print('meow');
        }
      },
      builder: (context, state) {
        Widget child;
        if (state is AuthStateLoginInProgress) {
          child = const SizedBox.square(
              dimension: 8, child: CircularProgressIndicator());
        } else {
          child = const Text('Login');
        }

        return ElevatedButton(
          onPressed: (state is AuthStateLoginInProgress) ? null : _submit,
          child: child,
        );
      },
    );
  }
}
