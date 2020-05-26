import 'package:UNNA/Api/api_postcode.dart';
import 'package:UNNA/Repositorio/api_response.dart';
import 'package:UNNA/models/ruas.dart';

enum CepFieldState { INITIALIZING, INCOMPLETE, INVALID, VALID }

class CepBlocState {
  CepBlocState({
    this.cepFieldState,
    this.cep,
    this.address,
  });

  CepFieldState cepFieldState;
  String cep;
  Address address;
}

class CepBloc {
  final BehaviorSubject<CepBlocState> _cepController =
      BehaviorSubject<CepBlocState>();

  void searchCep(String cep) async {
    final ApiResponse apiResponse = await getAddressFromAPI(cep);
    if (apiResponse.success) {
    } else {
      
    }
  }

  void onChanged(String cep) {
    cep = cep.trim().replaceAll('-', '').replaceAll('.', '');
    if (cep.isEmpty || cep.length < 8) {
      _cepController
          .add(CepBlocState(cepFieldState: CepFieldState.INCOMPLETE, cep: cep));
    } else {
      searchCep(cep);
    }
  }
}

void dispose() {
  _cepController.close();
}
