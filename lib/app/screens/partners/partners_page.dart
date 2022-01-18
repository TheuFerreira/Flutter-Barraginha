import 'package:flutter/material.dart';

class PartnersPage extends StatelessWidget {
  const PartnersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (

      appBar: AppBar
        (
        centerTitle: true,

        title: Container
          (
          child: Text
            (
            'Parceiros',

            style: TextStyle
              (
                fontSize: 25,
                fontWeight: FontWeight.w400
            ),

          ),
          padding: EdgeInsets.only(top: 50),

        ),
        toolbarHeight: 200,
      ),

      body: Column
        (
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40,),
            child: Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                Container
                  (
                  child: Icon
                    (
                    Icons.person, size: 90,
                  ),

                  decoration: BoxDecoration
                    (
                      color: Colors.grey[100],
                      boxShadow:
                      // ignore: prefer_const_literals_to_create_immutables
                      [
                        BoxShadow(color: Colors.black26,
                            spreadRadius: 0,
                            blurRadius: 1,
                            blurStyle: BlurStyle.normal,
                            offset: Offset.fromDirection(90)),
                      ],

                      borderRadius: BorderRadius.circular(20)

                  ),
                ),

                SizedBox(width: 10,),

                Container
                  (
                  width: 290,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column
                      (
                      children:
                      // ignore: prefer_const_literals_to_create_immutables
                      [
                        Text
                          (
                          'Pessoa 1',
                          style: TextStyle
                            (
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text
                          (
                          'orem ipsum phasellus elementum condimentum justo vehicula diam, dictum donec id erat vel fusce pulvinar, aenean ',
                          style: TextStyle
                            (
                            color: Colors.black38,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,

                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration
                    (
                      color: Colors.grey[100],
                      boxShadow:
                      // ignore: prefer_const_literals_to_create_immutables
                      [
                        BoxShadow(color: Colors.black26,
                            spreadRadius: 0,
                            blurRadius: 1,
                            blurStyle: BlurStyle.normal,
                            offset: Offset.fromDirection(90)),
                      ],

                      borderRadius: BorderRadius.circular(20)

                  ),
                ),
              ],
            ),
          ),
          Divider
          (
            thickness: 1,

          )
        ],
      ),
    );
  }
}
