import 'package:flutter/material.dart';
import 'package:um_consultation_app/viewmodels/login_viewmodel.dart';
import 'package:um_consultation_app/views/create_account_view.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
final LoginViewModel _loginViewmodel = LoginViewModel();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return PopScope( 
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(didPop) return;
      }, //keep this to prevent the desired offset from going back to default
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true, // Prevents overflow when keyboard appears
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(0, 35), // Positive integer offset
                      child: Image.asset(
                        'assets/logo/logofinal.png',
                        height: 180,
                        width: 400,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, 18), // Positive integer offset
                      child: Text(
                        'Main Campus',
                        style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      ),
                    ),
                    const SizedBox(height: 85),
                    Text(
                      'Maayong Adlaw, Ga!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(221, 22, 19, 19),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _loginViewmodel.usernameController,
                      decoration: InputDecoration(
                        hintText: 'Faculty or Student Email',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _loginViewmodel.passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 1), // Adjusted spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigate to Reset Password View (Add logic here)
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 130, vertical: 14),
                        elevation: 4,
                      ),
                      onPressed: () {
                        _loginViewmodel.login(context, _loginViewmodel.username, _loginViewmodel.password);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xffa1000b)),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => CreateAccountView()),
                        );
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Color(0xffa1000b), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
