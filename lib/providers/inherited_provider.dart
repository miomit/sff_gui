import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sff_gui/providers/checksum_provider.dart';

class InheritedProvider extends StatelessWidget {
  final Widget? _child;

  const InheritedProvider({
    super.key,
    Widget? child,
  }) : _child = child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChecksumProvider()),
      ],
      child: _child,
    );
  }
}
