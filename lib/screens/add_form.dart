import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quicklink/colors.dart';
import 'package:quicklink/logic/link_controller.dart';

class Addform extends StatefulWidget {
  @override
  _AddformState createState() => _AddformState();
}

class _AddformState extends State<Addform> {
  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  final title = TextEditingController();
  final category = TextEditingController();
  final url = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    category.dispose();
    url.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    submitForm(String title, String category, String url) {
      if (_formkey.currentState.validate()) {
        Provider.of<Links>(context, listen: false)
            .addLink(title, category, url);
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Link'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                //Title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: title,
                    decoration:
                        buildInputDecoration("My XYZ link", "Enter title here"),
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                //Categeory
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: category,
                    decoration: buildInputDecoration(
                        "Personal", "Category link belongs to"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                // url
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    decoration: buildInputDecoration(
                        "www.google.com", "Enter your link here"),
                    controller: url,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.url,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () =>
                      submitForm(title.text, category.text, url.text),
                  icon: Icon(Icons.add),
                  label: Text("Add"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String hint, String label) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        borderSide: BorderSide(
          width: 5,
          color: ThemeColor.mainColor,
        ),
      ),
    );
  }
}
