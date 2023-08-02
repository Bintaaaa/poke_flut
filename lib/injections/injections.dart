import 'package:common/core/di/dependecy.dart';
import 'package:pokemons/di/domain_pokemon_injection.dart';

class Injections {
  initialize() {
    _registerSharedDependencies();
    _registerDomains();
  }

  void _registerDomains() {
    DomainPokeminInjection();
  }

  _registerSharedDependencies() {
    RegisterCoreModule();
  }
}
