import 'package:flutter/material.dart';
import 'package:flutter_travelapp/pages/welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool isEmpty = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final List<String> blockedDomains = [
  //   'test.com',
  //   'laptop.com',
  //   'behance.com',
  //   'figma.com',
  //   'credly.com',
  // ];

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    RegExp passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(.{8,})$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must have at least 8 characters, one uppercase letter, one lowercase letter, and one special character';
    }
    return null;
  }

  Future<void> signInWithGoogle() async {
    try {
      // Sign in with Google logic goes here
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool _obscurePassword = true;

  Future<void> signInWthEmailAndPassword() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage(),
      ),
    );
  }

  Future<void> createUserWithEmailAndPassword() async {}

  Widget _title() {
    return Text(
      'Travel App',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
    bool isPassword,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String? value) =>
            title == 'email' ? _validateEmail(value) : _validatePassword(value),
        controller: controller,
        obscureText: isPassword && _obscurePassword,
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(),
          hintText: 'Enter your $title',
          suffixIcon: title == 'password'
              ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
          prefixIcon: title == 'email'
              ? Icon(Icons.email)
              : title == 'password'
                  ? Icon(Icons.lock)
                  : null,
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Error: $errorMessage',
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          isLogin
              ? signInWthEmailAndPassword()
              : createUserWithEmailAndPassword();
        }
      },
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register Instead' : 'Login Instead'),
    );
  }

  Widget _forgotPasswordButton() {
    return TextButton(
      onPressed: () {
        // Add your 'Forgot Password' logic here
        // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget _googleSignInButton() {
    return ElevatedButton(
      onPressed: signInWithGoogle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image.asset(
          //   'assets/google_logo.png',
          //   height: 20,
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                Text(isLogin ? 'Sign in with Google' : 'Register with Google'),
          ),
        ],
      ),
    );
  }

  void initState() {
    super.initState();
    // Initialize your state logic here
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("lib/img/travel.gif"),
                _entryField('email', _controllerEmail, false),
                _entryField('password', _controllerPassword, true),
                _errorMessage(),
                _submitButton(),
                _loginOrRegisterButton(),
                _forgotPasswordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
