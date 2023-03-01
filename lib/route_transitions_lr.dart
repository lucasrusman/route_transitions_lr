import 'package:flutter/material.dart';

///Tipos de animaciones
enum AnimationType { normal, fadeIn }

///Main class, [context] es el BuildContext de la aplicación en ese momento
/// [child] es el widget a navegar, [animation] es el tipo de animación
class Routetransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  Routetransitions(
      {required this.context,
      required this.child,
      this.replacement = false,
      this.animation = AnimationType.normal,
      this.duration = const Duration(milliseconds: 300)}) {
    // Navigator.push(context, MaterialPageRoute(builder: (_) => child));
    switch (animation) {
      case AnimationType.normal:
        _nomalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
      default:
    }
  }

  ///Push normal de la pagina
  void _pushPage(Route route) => Navigator.push(context, route);

  ///Push replacement de la pagina
  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  ///Código de una transición normal
  void _nomalTransition() {
    final route = MaterialPageRoute(builder: (_) => child);
    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }

  ///Controlador de la transición fadeIn
  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (_, __, ___) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut)),
              child: child);
        });
    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }
}
