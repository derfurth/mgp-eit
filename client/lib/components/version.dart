import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Displays the current version and build number.
class Version extends StatelessWidget {
  const Version({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final info = snapshot.data;
        final text =
            info == null ? '...' : 'v${info.version} MGP r${info.buildNumber} ';
        return Text(text);
      },
    );
  }
}
