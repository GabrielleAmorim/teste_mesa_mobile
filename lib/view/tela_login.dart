import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/util/values.dart';

class TelaLogin extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Entrar com e-mail", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Values.MAIN_COLOR,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                        //errorText: this.erroNome,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                      //errorText: this.erroNome,
                    ),
                ),
              ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Values.MAIN_COLOR)),
                    color: Values.MAIN_COLOR,
                    textColor: Values.MAIN_COLOR,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {},
                    child: Text("Login", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))
                ),
              ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child:           Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Values.MAIN_COLOR)),
                            color: Colors.white,
                            textColor: Values.MAIN_COLOR,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {
                              Get.to(TelaLogin());
                            },
                            child: Text("Entrar com facebook", overflow: TextOverflow.ellipsis, style: TextStyle(color: Values.MAIN_COLOR, fontWeight: FontWeight.bold, fontSize: 18))
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.only(top:30, bottom: 20),
                              child: Text("Não tenho conta.", style: TextStyle(color: Values.MAIN_COLOR, fontWeight: FontWeight.bold, fontSize: 15),)
                          ),
                          Container(
                            padding: EdgeInsets.only(top:30, bottom: 20),
                            child: GestureDetector(
                              child: Text("Cadastrar", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15)),
                              onTap: () {
                                print("Clicou");
                              },
                            ),
                          )],
                      )
                    ],
                  )
              )
            ],
          ),
              ),
            )
          ],
        ),
      )


//      Column(
//        children: [
//          Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: [
//              Container(
//                padding: EdgeInsets.all(20),
//                child: TextFormField(
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.email),
//                    border: OutlineInputBorder(),
//                    labelText: 'E-mail',
//                    labelStyle: TextStyle(
//                        fontSize: 16,
//                        color: Colors.grey,
//                        fontWeight: FontWeight.normal),
//                    //errorText: this.erroNome,
//                  ),
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
//                child: TextFormField(
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.lock),
//                    border: OutlineInputBorder(),
//                    labelText: 'Senha',
//                    labelStyle: TextStyle(
//                        fontSize: 16,
//                        color: Colors.grey,
//                        fontWeight: FontWeight.normal),
//                    //errorText: this.erroNome,
//                  ),
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 25, right: 20, left: 20),
//                width: MediaQuery.of(context).size.width,
//                height: 80,
//                child: FlatButton(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(8.0),
//                        side: BorderSide(color: Values.MAIN_COLOR)),
//                    color: Values.MAIN_COLOR,
//                    textColor: Values.MAIN_COLOR,
//                    padding: EdgeInsets.all(8.0),
//                    onPressed: () {},
//                    child: Text("Login", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))
//                ),
//              ),
//            ],
//          ),
    );
  }

}