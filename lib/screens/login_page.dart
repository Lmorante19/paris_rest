import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/services/auth_service.dart';
import 'package:prueba2/providers/providers.dart';
import 'package:prueba2/screens/screens.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginForm = Provider.of<LoginFormProvider>(context);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: LoginForm.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              onChanged: (value) => LoginForm.email = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese su correo electrónico';
                }
                return null;
              },
              onSaved: (value) {
                LoginForm.email = value!;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
              onChanged: (value) => LoginForm.password = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese su contraseña';
                }
                return null;
              },
              onSaved: (value) {
                LoginForm.password = value!;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (LoginForm.isValidForm()) {
                  // enviar una solicitud HTTP al backend para autenticar al usuario
                  final authService =
                      Provider.of<AuthService>(context, listen: false);
                  final String? errorMessage = await authService.login(
                      LoginForm.email, LoginForm.password);
                  if (errorMessage == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    print('exito');
                  } else {
                    print(errorMessage);
                  }
                } else {
                  print('datos invalidos');
                }
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
