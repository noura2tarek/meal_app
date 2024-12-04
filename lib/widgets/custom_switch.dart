// Custom switch
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  CustomSwitch({
    super.key,
    required this.switchValue,
    required this.title,
    required this.subtitle,
    required this.onChanged,
  });
  bool switchValue;
  final String title;
  final String subtitle;
  final void Function(bool)? onChanged;
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.primary,
      value: widget.switchValue,
      onChanged: widget.onChanged,
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
    );
  }
}