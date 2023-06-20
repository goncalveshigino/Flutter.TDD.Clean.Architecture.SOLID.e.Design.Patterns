import 'package:flutter/material.dart';
import 'package:fordev/ui/pages/pages.dart';

import '../../components/component.dart';



class LoginPage extends StatelessWidget {

final LoginPresenter presenter;

LoginPage(this.presenter);

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
                 
                    StreamBuilder<String>(
                      stream: presenter.emailErrorStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          decoration:  InputDecoration(
                            labelText: 'Email', 
                            icon: Icon(Icons.email, color: Theme.of(context).primaryColorLight), 
                            errorText:  snapshot.data,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: presenter.validateEmail,
                        );
                      }
                    ),
                 
                     Padding(
                       padding:  const EdgeInsets.only(top: 8.0, bottom: 32.0),
                       child: TextFormField(
                        decoration:  InputDecoration(
                          labelText: 'Senha', 
                          icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight), 
                        ),
                        obscureText: true,
                        onChanged: presenter.validatePassword,
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

