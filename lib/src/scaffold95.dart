import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'button95.dart';
import 'globals.dart';
import 'toolbar95.dart';
import 'utils.dart';

class Scaffold95 extends StatelessWidget {
  const Scaffold95({
    required this.title,
    required this.body,
    this.toolbar,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Toolbar95? toolbar;

  @override
  Widget build(BuildContext context) {
    return Elevation95(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WindowHeader95(title: title),
          const SizedBox(height: 4),
          if (toolbar != null) toolbar!,
          if (toolbar != null) const SizedBox(height: 4),
          body,
        ],
      ),
    );
  }
}

class WindowHeader95 extends StatefulWidget {
  const WindowHeader95({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String? title;

  @override
  _WindowHeader95State createState() => _WindowHeader95State();
}

class _WindowHeader95State extends State<WindowHeader95> {
  late bool _canPop;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _canPop = Navigator.of(context).canPop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0, left: 2.0, right: 2.0),
        child: Container(
          height: 33,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Flutter95.headerDark,
                Color(0xffBCCCE7),
              ],
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 6),
              Image(image: AssetImage('assets/icons/aol_icon_white_32.png')),
              const SizedBox(width: 6),
              Text(
                widget.title!,
                style: TextStyle(fontFamily: 'MSBold', fontSize: 20, height: 1, color: Colors.white),
              ),
              Spacer(),
              if (_canPop) CloseButton95(),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class CloseButton95 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Button95(
      height: 24,
      padding: EdgeInsets.zero,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.close,
        size: 20,
      ),
    );
  }
}
