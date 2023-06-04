import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice game",
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  bool emailField = true;
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search)
          )
        ],
      ),

      body: Builder(
        builder:(context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  const Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170,
                      height: 190,
                    ),
                  ),
                  Form(
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.teal,
                              inputDecorationTheme: const InputDecorationTheme(
                                  labelStyle: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15
                                  )
                              )
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              children: [
                                if(emailField)
                                const TextField(
                                  key: ValueKey(1),
                                  //controller: controller,
                                  decoration: InputDecoration(
                                      labelText: 'Enter "dice"'
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const TextField(
                                  key: ValueKey(2),
                                  //controller: controller2,
                                  decoration: InputDecoration(
                                      labelText: 'Enter Password'
                                  ),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                const SizedBox(height: 40),
                                ButtonTheme(
                                    minWidth: 100,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orangeAccent,
                                          minimumSize: const Size(150, 50)
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          emailField = false;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    )
                                )
                              ],
                            ),
                          ))
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content:
    Text("로그인 정보를 다시 확인하세요",
        textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    )
  );
}

void showSnackBar2(BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:
      Text("비밀번호가 일치하지 않습니다",
          textAlign: TextAlign.center),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}

void showSnackBar3(BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:
      Text("dice의 철자를 확인하세요",
          textAlign: TextAlign.center),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}