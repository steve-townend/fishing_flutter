



import 'package:flutter/material.dart';

class PopupForm extends StatefulWidget {
  const PopupForm({super.key, required this.title, required this.body, required this.formKey});

  final Widget body;
  final GlobalKey<FormState> formKey;
  final String title;

 @override
  PopupFormState createState() => PopupFormState();
}

class PopupFormState extends State<PopupForm>  {

    @override
    void initState() {

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.grey[300],
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4F7942),
                  ),
                  child: Center(child: Text(widget.title, style:const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16))),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: widget.formKey,
                    child: widget.body
                  ),
                ),
              ],                          
            )
          ],
        ),
      )
    );
  }
}


