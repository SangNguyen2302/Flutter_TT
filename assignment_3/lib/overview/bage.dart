
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Badge extends StatelessWidget{

  final Widget child;
  final String value;
  // late Color color;

  Badge({Key? key, required this.child,required this.value,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),

              ),
              constraints: BoxConstraints(
                  minWidth: 16,
                  minHeight: 16
              ),
              child: Text(value,textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,),),
            )
        )
      ],
    );
  }

}