import 'package:disenios_01/src/routes/routes.dart';
import 'package:disenios_01/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _MenuPrincipal(),
      appBar: AppBar(
        title: Text('Diseños en Flutter - tablet '),
      ),
      body: _ListaOpciones(),
   );
  }
}

class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return ListView.separated(

      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.currentTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.currentTheme.accentColor,),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.currentTheme.accentColor,),
        onTap: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
    
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text('FA',style: TextStyle(fontSize: 50),),
                ),
              ),
            ),

            Expanded(
              child: _ListaOpciones()
            ),

            Container(color: appTheme.currentTheme.accentColor, width: double.infinity, height: 2,),


            ListTile(
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                onChanged: (value) => appTheme.darkTheme = value,
                activeColor: appTheme.currentTheme.accentColor,),
              leading: Icon(Icons.lightbulb, color: appTheme.currentTheme.accentColor,),
              title: Text('Dark Mode'),
            ),

            ListTile(
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                onChanged: (value) => appTheme.customTheme = value,
                activeColor: appTheme.currentTheme.accentColor),
              leading: Icon(Icons.add_to_home_screen, color: appTheme.currentTheme.accentColor,),
              title: Text('Custom Theme'),
            ),
          ],
        ),
      ),
    );
  }
}