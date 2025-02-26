import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/modules/splash/splash_view.dart';
import '../../app/modules/pre_login/pre_login_view.dart';
import '../../app/modules/login/login_view.dart';

final List<GoRoute> authRoutes = [
  GoRoute(
    path: '/',
    name: 'splash',
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: '/pre-login',
    name: 'preLogin',
    builder: (context, state) => const PreLoginView(),
  ),
  GoRoute(
    path: '/login',
    name: 'login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: '/forgot-password/:type',
    name: 'forgotPassword',
    builder: (context, state) => Scaffold(
      body: Center(
        child: Text('Recuperar Senha - ${state.pathParameters['type']}'),
      ),
    ),
  ),
  GoRoute(
    path: '/register/:type',
    name: 'register',
    builder: (context, state) => Scaffold(
      body: Center(
        child: Text('Cadastro - ${state.pathParameters['type']}'),
      ),
    ),
  ),
];
