import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _loginController.text = '';
    _passwordController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: BlocBuilder<AuthBloc, AuthState>(
        bloc: _authBloc,
        builder: (context, state) {
          if (state is AuthLogining) {
            return const Center(
              child: SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()),
            );
          }
          if (state is AuthUnknownState) {
            return const Center(
              child: SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()),
            );
          }
          // if (state is AuthSuccessedState) {
          //   context.router.navigate(TaskListRoute(forMe: false));
          //   return const SizedBox();
          // }
          if (state is AuthErrorState) {
            return ErrorPage(
              errorMessage: state.exception.toString(),
            );
          }
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(color: backgroundColor
                  // image: DecorationImage(
                  //   image: AssetImage("/images/login_page.webp"),
                  //   fit: BoxFit.cover,
                  // ),
                  ),
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(136, 172, 172, 172),
                          spreadRadius: 3,
                          blurRadius: 15),
                    ],
                  ),
                  width: 400,
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "images/logo.svg",
                            width: 150,
                            // height: 25,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          if (state is AuthFailedState)
                            Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(state.message,
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(color: dangerColor)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          TextFormField(
                            autofocus: true,
                            controller: _loginController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: blueColor),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: blueColor),
                              ),
                              border: const OutlineInputBorder(),
                              label: Text(
                                'Логин',
                                style: theme.textTheme.labelMedium!
                                    .copyWith(color: blueColor),
                              ),
                              // icon: Icon(Icons.login),
                              hintText: "Введите логин",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Необходимо ввести логин';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: blueColor),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: blueColor),
                              ),
                              border: const OutlineInputBorder(),
                              label: Text(
                                'Пароль',
                                style: theme.textTheme.labelMedium!
                                    .copyWith(color: blueColor),
                              ),
                              // icon: Icon(Icons.password),
                              hintText: "Введите пароль",
                              // helperText:
                              //     "Пароль используется для входа в систему",
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.length < 3) {
                                return 'Некорректный пароль';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkBlueColor,
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                // Прошли валидацию
                                _authBloc.add(LogInEvent(
                                    username: _loginController.text,
                                    password: _passwordController.text));
                              }
                              // Не прошли валидацию
                            },
                            child: const Text(
                              'Войти',
                              style: TextStyle(color: whiteColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
