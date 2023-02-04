import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI INDEX',
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController= TextEditingController();
  var inController= TextEditingController();

  var result="";
  var bgColor=Colors.purple.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BODY MASS INDEX"),
        centerTitle: true,
        backgroundColor:Colors.purple,
      ),
      body: Container(
        color:bgColor,


        child: Center(
          child: Container(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
              Text("BMI",style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 15,),
          
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text("Enter Your Weight(in KG): ",
                  ),
                  
                  prefixIcon:Icon(Icons.person),
                ),
                keyboardType: TextInputType.number ,
              ),
              SizedBox(height: 15,),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text("Enter Your Height(in FEET): "),
                  prefixIcon:Icon(Icons.height),
                ),
                keyboardType: TextInputType.number ,
              ),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                  label: Text("Enter Your height(in INCH): "),
                  prefixIcon:Icon(Icons.height),
                ),
                keyboardType: TextInputType.number ,
              ),
              SizedBox(height: 15,),
      
      
            ElevatedButton(onPressed: (){
              var wt=wtController.text.toString();
              var ft= ftController.text.toString();
              var inch=inController.text.toString();
      
              if(wt!="" && ft!="" && inch!=""){
                //BMI = kg/m^2
      
                var iWt= int.parse(wt);
                var iFt= int.parse(ft);
                var iIn= int.parse(inch);
      
                var tInch=(iFt*12)+iIn;
                var tCm= tInch*2.54;
                var tM= tCm/100;
                var bmi= iWt/(tM*tM);


                var msg="";

                if(bmi>25){
                  msg="You are OverWeight!!";
                  bgColor=Colors.red.shade500;
                }
                else if(bmi<18){
                  msg="You are UnderWeight!";
                  bgColor=Colors.yellowAccent.shade400;
                }
                else{
                  msg="You are Healthy";
                  bgColor=Colors.green.shade500;
                }
                setState(() {
                  result="$msg \nYour BMI IS : ${bmi.toStringAsFixed(3)}";
                });
              }
              else{
                setState(() {
                  result = "Please fill all the required blanks :) ";
                });
              }
            }, 
            
            child:Text("CALCULATE"), ),
            SizedBox(height: 15,),
            Text('$result', style: TextStyle(fontSize: 35, fontFamily: "Times New Roma, Times, serifn"),),
            ]
            ),
          ),
        ),
      ),
    );
  }
}