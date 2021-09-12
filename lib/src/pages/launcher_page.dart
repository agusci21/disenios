import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _MenuPrincipal(),
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      body: _ListaOpciones(),
   );
  }
}

class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(color: Colors.blue,),
      itemCount: 20,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(FontAwesomeIcons.slideshare, color: Colors.blue,),
        title: Text('Hola Mundo'),
        trailing: Icon(Icons.chevron_right, color: Colors.blue,),
        onTap: (){},
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: Colors.blue,
                  child: Text('FA',style: TextStyle(fontSize: 50),),
                ),
              ),
            ),

            Expanded(
              child: _ListaOpciones()
            ),

            Container(color: Colors.blue, width: double.infinity, height: 2,),

            ListTile(
              trailing: Switch.adaptive(value: true, onChanged: (value){}, activeColor: Colors.blue,),
              leading: Icon(Icons.lightbulb, color: Colors.blue,),
              title: Text('Dark Mode'),
            ),

            ListTile(
              trailing: Switch.adaptive(value: true, onChanged: (value){},activeColor: Colors.blue),
              leading: Icon(Icons.add_to_home_screen, color: Colors.blue,),
              title: Text('Custom Theme'),
            ),

            
    
          ],
        ),
      ),
    );
  }
}