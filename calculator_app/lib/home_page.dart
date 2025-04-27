import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _textEditingController01 = TextEditingController();
  final TextEditingController _textEditingController02 = TextEditingController();
  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController01,
              decoration: const InputDecoration(
                hintText: "Number: 1",
                labelText: "Number: 1"
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16,),
            TextField(
              controller: _textEditingController02,
              decoration: const InputDecoration(
                  hintText: "Number: 2",
                  labelText: "Number: 2"
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24,),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              children: [
                ElevatedButton.icon(
                  onPressed: _add,
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                ),
                ElevatedButton.icon(
                  onPressed: _sub,
                  icon: const Icon(Icons.remove),
                  label: const Text("Sub"),
                ),
                ElevatedButton.icon(
                  onPressed: _mul,
                  icon: const Icon(Icons.star_border),
                  label: const Text("Multiply"),
                ),
                ElevatedButton.icon(
                  onPressed: _div,
                  icon: const Icon(Icons.ac_unit_outlined),
                  label: const Text("Divide"),
                )
              ],
            ),
            const SizedBox(height: 24,),
            Text("Result: $_result")
          ],
        ),
      ),

    );
  }
  void _add() {
    double numOne = double.tryParse(_textEditingController01.text) ?? 0;
    double numTwo = double.tryParse(_textEditingController02.text) ?? 0;

    _result = numOne + numTwo;
    _textEditingController01.clear();
    _textEditingController02.clear();

    setState(() {});
  }
  void _sub() {
    double numOne = double.tryParse(_textEditingController01.text) ?? 0;
    double numTwo = double.tryParse(_textEditingController02.text) ?? 0;

    _result = numOne - numTwo;
    _textEditingController01.clear();
    _textEditingController02.clear();

    setState(() {});
  }
  void _mul() {
    double numOne = double.tryParse(_textEditingController01.text) ?? 0;
    double numTwo = double.tryParse(_textEditingController02.text) ?? 0;

    _result = numOne * numTwo;
    _textEditingController01.clear();
    _textEditingController02.clear();

    setState(() {});
  }
  void _div() {
    double numOne = double.tryParse(_textEditingController01.text) ?? 0;
    double numTwo = double.tryParse(_textEditingController02.text) ?? 0;

    _result = numOne / numTwo;
    _textEditingController01.clear();
    _textEditingController02.clear();

    setState(() {});
  }

  @override
  void dispose() {
    _textEditingController01.dispose();
    _textEditingController02.dispose();
    super.dispose();
  }

}
