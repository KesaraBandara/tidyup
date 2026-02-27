import 'package:flutter/material.dart';
import 'package:tidyup/models/note_model.dart';
import 'package:tidyup/services/note_service.dart';
import 'package:tidyup/utils/constants.dart';
import 'package:tidyup/utils/router.dart';
import 'package:tidyup/utils/text_styles.dart';
import 'package:tidyup/widget/note_category_card.dart';

class NoteByCategory extends StatefulWidget {
  final String category;
  const NoteByCategory({super.key, required this.category});

  @override
  State<NoteByCategory> createState() => _NoteByCategoryState();
}

class _NoteByCategoryState extends State<NoteByCategory> {

  List<Note> noteList = [];
  void initState(){
    _loadCategoriesNotes();
        super.initState();
  }

  // load all notes by category
     Future<void> _loadCategoriesNotes() async {
    final noteService = NoteService();
    noteList = await noteService.getNotesByCategory(widget.category);
    setState(() {});
  }

    //edit note
  void _editNote(Note note) {
    //navigate to the edit note page
    AppRouter.router.push('/edit-note', extra: note);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           //remove the back button
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AppRouter.router.push(
              "/notes",
            );
          },
        ),
      ),
       body: SingleChildScrollView(
         child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.category,
                style: AppTextStyles.appTitle,
              ),
                            const SizedBox(
                height: 30,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.kDefaultPadding,
                  mainAxisSpacing: AppConstants.kDefaultPadding,
                  childAspectRatio: 7 / 11,
                ),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  return NoteCategoryCard(
                    noteTitle: noteList[index].title,
                    noteContent: noteList[index].content,
                    removeNote: () async {},
                   editNote: () async {
                      _editNote(noteList[index]);
                   }, 
                   viewSingleNote: () {  },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}