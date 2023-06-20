


import 'package:flutter/material.dart';

import '../components/component.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const LoginHeader(), 

             Text('Login'.toUpperCase(), textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium,), 

             Padding(
               padding: const EdgeInsets.all(32.0),
               child: Form(
                child: Column(
                  children: [
                 
                    TextFormField(
                      decoration:  InputDecoration(
                        labelText: 'Email', 
                        icon: Icon(Icons.email, color: Theme.of(context).primaryColorLight), 
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                 
                     Padding(
                       padding:  const EdgeInsets.only(top: 8.0, bottom: 32.0),
                       child: TextFormField(
                        decoration:  InputDecoration(
                          labelText: 'Senha', 
                          icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight), 
                        ),
                        obscureText: true,
                                         ),
                     ),
             
                    ElevatedButton(onPressed: null, child: Text('Entrar'.toUpperCase())),
                 
                    TextButton.icon(onPressed: (){}, icon:  Icon( Icons.person, color: Theme.of(context).primaryColorLight ), label:  Text('Criar conta', style: TextStyle( color: Theme.of(context).primaryColorLight)))
                  ],
                )
               ),
             )
          ],
        ),
      ),
    );
  }
}

