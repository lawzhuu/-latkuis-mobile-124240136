import 'package:flutter/material.dart';
import 'package:apk_gacoan/root.dart';

// Widget Class
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// State Class
class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoggedIn = false;

// INI BUAT NGECEK APAKAH KOLOM INPUT MASIH KOSONG APA ENGGA
  void _login({required String email, required String password}) {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: Text("Tolong diisi dulu itu anunya!"),
        ),
      );
      return;
    }

    // KALO UDAH KEINPUT BAKAL NGECEK LAGI DISINI APAKAH INPUT NYA SUDAH BENAR ATAU BELUM
    if (email == "gacoan" && password == "enak") {
      setState(() {
        _isLoggedIn = true;
      });

      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => Root(userEmail: email,)));

      // UNTUK MEMANGGIL SNACKBAR BERHASIL/GAGAL
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text("Login Berhasil!")));
    } else {
      setState(() {
        _isLoggedIn = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text("Login Gagal!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gacoan nya Kak"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                spacing: 10,
                children: [
                  
                    Image.asset(
                      'images/LogoMieGacoan.png',
                      width: 500,
                      height: 500,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Welcome To Gacoan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    SizedBox(height: 24,),
              
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          // suffix: Icon(Icons.email),
                          hintText: "masukan email elo",
                          border: OutlineInputBorder()),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          // suffix: Icon(Icons.email),
                          hintText: "masukan password nya brayy",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: 
                                  _isLoggedIn ? Colors.green : Colors.red),
                          onPressed: () {
                            _login(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          },
                          child: Text("Login")),
                    )
                ],
              ),
            ),
          ),
        )
      );
    }
  }
