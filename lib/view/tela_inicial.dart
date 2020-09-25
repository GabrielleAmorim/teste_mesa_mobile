import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TelaInicial extends StatelessWidget{

  var main_color = Color(0xff010a53);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: main_color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: SvgPicture.asset(
                        "assets/images/logo_me.svg",
                        excludeFromSemantics: true,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 40, left: 0),
                      child: SvgPicture.asset(
                        "assets/images/logo_s.svg",
                        excludeFromSemantics: true,
                      ),
                    ),
                    Container(
                      child: SvgPicture.asset(
                        "assets/images/logo_a.svg",
                        excludeFromSemantics: true,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 100),
                  child: SvgPicture.asset(
                    "assets/images/news.svg",
                    excludeFromSemantics: true,
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 18, right: 20, left: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.white)),
                          color: Colors.white,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {},
                          child: Text("Entrar com facebook", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18))
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 25, right: 20, left: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.white)),
                          color: main_color,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {},
                          child: Text("Entrar com e-mail", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text("Não tenho conta.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20, left: 5),
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
    );
  }


}