import 'package:flutter/material.dart';


void main() {
  runApp(SecureGuardApp());
}

class SecureGuardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Guard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ).copyWith(
          primary: Color(0xFF00A6A6),
          secondary: Color(0xFF039BE5),
          surface: Color(0xFF121858),
        ),
        scaffoldBackgroundColor: Color(0xFF121858),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF00A6A6),
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/options': (context) => OptionsScreen(),
        '/password_checker': (context) => PasswordCheckerScreen(),
        '/email_checker': (context) => EmailCheckerScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00A6A6), Color(0xFF121858)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/secure.png'),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final TextEditingController badgeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Secure Guard'),
        backgroundColor: Color(0xFF00A6A6),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00A6A6), Color(0xFF121858)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome! Please enter your badge number and password.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextField(
              controller: badgeController,
              decoration: InputDecoration(
                labelText: 'Badge Number',
                labelStyle: TextStyle(color: Color(0xFF039BE5)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF039BE5)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF039BE5)),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color(0xFF039BE5)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF039BE5)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF039BE5)),
                ),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color(0xFF00A6A6),
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/options');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select an Option'),
        backgroundColor: Color(0xFF00A6A6),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00A6A6), Color(0xFF121858)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoverContainer(
              text: 'Password Checker',
              onTap: () {
                Navigator.pushNamed(context, '/password_checker');
              },
            ),
            SizedBox(height: 20),
            HoverContainer(
              text: 'Email Checker',
              onTap: () {
                Navigator.pushNamed(context, '/email_checker');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HoverContainer extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverContainer({required this.text, required this.onTap});

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: _isHovering ? Color(0xFF039BE5) : Color(0xFF00A6A6),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: _isHovering
                ? [BoxShadow(color: Color(0xFF039BE5), blurRadius: 10, spreadRadius: 2)]
                : [BoxShadow(color: Colors.transparent)],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordCheckerScreen extends StatefulWidget {
  @override
  _PasswordCheckerScreenState createState() => _PasswordCheckerScreenState();
}

class _PasswordCheckerScreenState extends State<PasswordCheckerScreen> {
  final TextEditingController _controller = TextEditingController();
  String _message = '';

  void _checkPassword(String password) {
    setState(() {
      _message = _generatePasswordSuggestions(password);
    });
  }

  String _generatePasswordSuggestions(String password) {
    if (password.length < 8) {
      return 'Password should be at least 8 characters long.';
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    List<String> suggestions = [];
    if (!hasUppercase) suggestions.add('Add at least one uppercase letter.');
    if (!hasLowercase) suggestions.add('Add at least one lowercase letter.');
    if (!hasDigit) suggestions.add('Add at least one number.');
    if (!hasSpecialCharacter) suggestions.add('Add at least one special character.');

    if (suggestions.isEmpty) {
      return 'Your password is strong!';
    }

    return 'Suggestions:\n' + suggestions.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Checker'),
        backgroundColor: Color(0xFF00A6A6),
      ),
      body: KeyboardAvoider(
        autoScroll: true,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00A6A6), Color(0xFF121858)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  labelStyle: TextStyle(color: Color(0xFF039BE5)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF039BE5)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF039BE5)),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: _checkPassword,
              ),
              SizedBox(height: 20),
              Text(
                _message,
                style: TextStyle(
                  color: _message.contains('strong') ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailCheckerScreen extends StatefulWidget {
  @override
  _EmailCheckerScreenState createState() => _EmailCheckerScreenState();
}

class _EmailCheckerScreenState extends State<EmailCheckerScreen> {
  final TextEditingController emailController = TextEditingController();
  String _message = '';

  void _checkEmail(String emailContent) {
    setState(() {
      bool isSecure = checkEmailSecurity(emailContent);
      _message = isSecure ? 'The email is secure.' : 'The email is not secure.';
    });
  }

  // The organisation's own email domain. Senders from any other domain are flagged.
  static const String trustedDomain = 'company.com';

  bool checkEmailSecurity(String emailContent) {
    final domain = emailContent.split('@').last.trim().toLowerCase();
    return domain == trustedDomain;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Checker'),
        backgroundColor: Color(0xFF00A6A6),
      ),
      body: KeyboardAvoider(
        autoScroll: true,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00A6A6), Color(0xFF121858)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter Email Content',
                  labelStyle: TextStyle(color: Color(0xFF039BE5)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF039BE5)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF039BE5)),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                maxLines: 1,
                onChanged: _checkEmail,
              ),
              SizedBox(height: 20),
              Text(
                _message,
                style: TextStyle(
                  color: _message == 'The email is secure.' ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Keeps the form usable when the on-screen keyboard is open.
Widget KeyboardAvoider({required bool autoScroll, required Container child}) {
  return SingleChildScrollView(child: child);
}
