import 'package:flutter/material.dart';

//회원가입 상태창
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('회원가입', ) ,centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child:Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: '아이디'),
                    validator: (value){
                      if(value==null || value.trim().isEmpty){
                        return "아이디를 입력해주세요.";
                      }
                      return null;
                    },
                ),
                TextFormField(
                  controller: _passwordController,
                   obscureText: true,
                  decoration: InputDecoration(labelText: '비밀번호'),
                ),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: null, child: Text('가입하기')),
              ],
            ),
          )
        )
      )

    );
  }

}

