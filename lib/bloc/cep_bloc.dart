import 'package:UNNA/Api/api_postcode.dart';
import 'package:UNNA/models/ruas.dart';
import 'package:UNNA/Repositorio/api_response.dart';
import 'package:rxdart/subjects.dart';

enum CepFieldState { INITIALIZING, INCOMPLETE, INVALID, VALID }

class CepBlocState {

  CepBlocState({this.cepFieldState, this.cep, this.address});

  CepFieldState cepFieldState;
  String cep;
  Address address;

}

class CepBloc {

  CepBloc(){
    onChanged("");
  }

  final BehaviorSubject<CepBlocState> _cepController = BehaviorSubject<CepBlocState>();
  Stream<CepBlocState> get outCep => _cepController.stream;

  void searchCep(String cep) async {
    final ApiResponse apiResponse = await getAddressFromAPI(cep);

    if(apiResponse.success){
      _cepController.add(
        CepBlocState(
          cepFieldState: CepFieldState.VALID,
          cep: cep,
          address: apiResponse.result,
        )
      );
    } else {
      _cepController.add(
        CepBlocState(
          cepFieldState: CepFieldState.INVALID,
          cep: cep
        )
      );
    }
  }

  void onChanged(String cep){
    cep = cep.trim().replaceAll('-', '').replaceAll('.', '');
    if(cep.isEmpty || cep.length < 8){
      _cepController.add(
        CepBlocState(
          cepFieldState: CepFieldState.INCOMPLETE,
          cep: cep
        )
      );
    } else {
      searchCep(cep);
    }
  }

  void dispose(){
    _cepController.close();
  }

}