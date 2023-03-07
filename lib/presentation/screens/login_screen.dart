import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq_assessment/di/injector.dart';
import 'package:pricelocq_assessment/domain/features/auth/auth_bloc.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';
import 'package:pricelocq_assessment/presentation/router/routes.dart';
import 'package:pricelocq_assessment/presentation/utils/validation_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController =
      TextEditingController(text: kDebugMode ? '+639021234567' : null);
  final _passwordController =
      TextEditingController(text: kDebugMode ? '123456' : null);

  LocqLocalizations get localizations => LocqLocalizations.of(context)!;

  void _submit() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
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
            child: buildForm(),
          ),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _mobileController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: localizations.mobileNumber,
          ),
          validator: (value) => ValidationUtils.validateMobileNumber(
            value: value,
            onEmpty: localizations.emptyMobileNumberValidation,
            onInvalid: localizations.invalidMobileNumberValidation,
          ),
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: localizations.password,
          ),
          validator: (value) => ValidationUtils.validatePassword(
            value: value,
            onInvalid: localizations.invalidPasswordValidation,
          ),
        ),
        const SizedBox(height: 32.0),
        buildLoginButton(),
      ],
    );
  }

  Widget buildLoginButtonChild(AuthState state) {
    Widget child;
    if (state is AuthStateLoginInProgress) {
      child = const SizedBox.square(
          dimension: 8, child: CircularProgressIndicator());
    } else {
      child = Text(localizations.login);
    }
    return child;
  }

  String getLoginErrorText(Object? error) {
    if (error is DioError && error.response?.statusCode == 400) {
      return localizations
          .invalidCredentialsTryAgain(localizations.mobileNumber);
    } else {
      return localizations.serverError;
    }
  }

  Widget buildLoginButton() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateAuthenticated) {
          Navigator.pushNamed(context, LocqRoutes.landingScreen);
        } else if (state is AuthStateLoginFailed) {
          final snackBar =
              SnackBar(content: Text(getLoginErrorText(state.error)));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: (state is AuthStateLoginInProgress) ? null : _submit,
          child: buildLoginButtonChild(state),
        );
      },
    );
  }
}
