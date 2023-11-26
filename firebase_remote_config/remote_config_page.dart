import 'package:firebase_firestore_project/src/firebase_remote_config/firebase_remote_config_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfigPage extends StatefulWidget {
  const RemoteConfigPage({super.key});

  @override
  State<RemoteConfigPage> createState() => _RemoteConfigPageState();
}

class _RemoteConfigPageState extends State<RemoteConfigPage> {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  String _welcomeMessage = '';
  int _number = 0;
  bool _isImageHidden = false;

  @override
  void initState() {
    super.initState();
    _fetchRemoteConfigValues();
  }

  void _fetchRemoteConfigValues() {
    final FirebaseRemoteConfigService _firebaseRemoteConfigService =
        FirebaseRemoteConfigService(_remoteConfig);

    _firebaseRemoteConfigService.fetchAndActivate().then((_) {
      setState(() {
        _welcomeMessage = _remoteConfig.getString('home_page_string');
        _number = _remoteConfig.getInt('home_page_number');
        _isImageHidden = _remoteConfig.getBool('home_page_image_is_hidden');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _remoteConfig.getString('welcomeMessage'),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              _remoteConfig.getInt('number').toString(),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: _remoteConfig.getBool('isImageHidden'),
              child: Image.asset(
                'assets/images/eurovision_logo.png',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
