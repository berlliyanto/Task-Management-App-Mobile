import 'package:flutter/material.dart';

class ListTileWidget {
  static Widget listtileSettings(String title, IconData leading, double fontSize, double iconSize, Color colors,VoidCallback onTap){
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: fontSize, color: colors),),
      leading: Icon(leading, size: iconSize, color: colors,),
      onTap: onTap,
      focusColor: Colors.grey[200],
      splashColor: Colors.grey[200],
      hoverColor: Colors.grey[200],
    );
  }

  static Widget listtileCategory(String title, int key, double fontSize, double iconSize, Color colors,VoidCallback onTap, VoidCallback onDismiss){
    return Dismissible(
      key:  Key('$key'),
      onDismissed: (dismiss)=>onDismiss(),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: fontSize, color: colors),),
        leading: Icon(Icons.circle, size: iconSize, color: colors,),
        trailing: IconButton(onPressed: onTap, icon: Icon(Icons.edit,size: iconSize, color: colors,),),
        focusColor: Colors.grey[200],
        splashColor: Colors.grey[200],
        hoverColor: Colors.grey[200],
      ),
    );
  }
}