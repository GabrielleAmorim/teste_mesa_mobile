import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/controller/tela_cadastro_controller.dart';
import 'package:teste_mesa_mobile/controller/tela_filtro_controller.dart';
import 'package:teste_mesa_mobile/util/values.dart';

class TelaFiltro extends StatelessWidget {
  final TelaFiltroController _telaFiltroController =
      Get.put(TelaFiltroController());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text(
            "Filtro",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Values.MAIN_COLOR,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.find<TelaFiltroController>().limparFiltro();
                },
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Limpar",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              child: RaisedButton(
                onPressed: () {
                  DatePicker.showDatePicker(context, showTitleActions: true,
                      onConfirm: (date) {
                    var _date = '${date.day}/${date.month}/${date.year}';
                    Get.find<TelaFiltroController>().changeData(_date);
                  }, currentTime: DateTime.now(), locale: LocaleType.pt);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Data",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      GetX<TelaFiltroController>(
                        builder: (_) {
                          return Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      _.dataFiltro.value,
                                      style: TextStyle(fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Icon(Icons.date_range, size: 15),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
                color: Colors.white,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.09,
              child: Card(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text("Apenas favoritos",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      child: SizedBox(
                          width: 80,
                          height: 10,
                          child: GetX<TelaFiltroController>(
                            builder: (_) {
                              return CupertinoSwitch(
                                value: _.apenasFavoritos.value,
                                onChanged: (bool val) {
                                  _.changeApenasFavoritos(val);
                                },
                              );
                            },
                          )))
                ],
              )),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                color: Values.MAIN_COLOR,
                child: Center(
                  child: Text(
                    "Filtrar",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
            onTap: () {
              print("tocou");
            },
          ),
        ));
  }
}
