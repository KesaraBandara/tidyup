import 'package:flutter/material.dart';
import 'package:tidyup/services/note_service.dart';
import 'package:tidyup/utils/constants.dart';
import 'package:tidyup/utils/text_styles.dart';

class CreateNotePage extends StatefulWidget {
  final bool isNewCategory;
  const CreateNotePage({super.key, required this.isNewCategory});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {

  List<String> categories = [];
  final NoteService noteService = NoteService();
  
Future _loadCategories () async{
    categories = await noteService.getAllCategories();

    setState(() {
      print(categories.length);  
    });
  } 

  @override
  void initState() {
    // TODO: implement initState
    _loadCategories();
    super.initState();
  }
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Note", style: AppTextStyles.appSubtitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppConstants.kDefaultPadding / 2,
              ),
              child: Form(
                child: Form(child: Column(children: [])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
