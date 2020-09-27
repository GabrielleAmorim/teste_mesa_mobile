import 'package:get/get.dart';

class TelaFiltroController extends GetxController{

  final dataFiltro = ''.obs;
  final apenasFavoritos = false.obs;


  changeData(String data){
    this.dataFiltro.value = data;
    update();
  }

  changeApenasFavoritos(bool value){
    this.apenasFavoritos.value = value;
    update();
  }

  limparFiltro(){
    this.dataFiltro.value = '';
    update();
    this.apenasFavoritos.value = false;
    update();
  }

}
