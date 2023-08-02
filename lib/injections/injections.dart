import 'package:common/core/di/dependecy.dart';

class Injections {
  initialize() {
    _registerSharedDependencies();
    _registerDomains();
  }

  void _registerDomains() {}

  Future<void> _registerSharedDependencies() async {
    RegisterCoreModule();
  }
}
