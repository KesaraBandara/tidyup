import 'package:flutter/material.dart';
import 'package:tidyup/models/note_model.dart';
import 'package:tidyup/services/note_service.dart';
import 'package:tidyup/utils/constants.dart';
import 'package:tidyup/utils/router.dart';
import 'package:tidyup/utils/colors.dart';
import 'package:tidyup/utils/text_styles.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NoteService noteService = NoteService();
  List<Note> allNotes = [];
  Map<String, List<Note>> noteWithCategory = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAndCreateData();
  }

  //check if user is new
  void checkAndCreateData() async {
    final bool isNewUser = await noteService.isNewUser();
    //if the user is new create the intial notes
    if (isNewUser) {
      await noteService.createInitialNotes();
    }

    //load the notes
    _loadNotes();
  }

  //load the notes
  Future<void> _loadNotes() async {
    final List<Note> loadedNotes = await noteService.loadNotes();
    final Map<String, List<Note>> notesByCategory = noteService
        .getNotesByCategoryMap(loadedNotes);
    setState(() {
      allNotes = loadedNotes;
      noteWithCategory = notesByCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            AppRouter.router.go("/");
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(color: AppColors.kWhiteColor, width: 2),
        ),
        child: Icon(Icons.add, color: AppColors.kWhiteColor, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
        child: Column(children: [Text("Notes", style: AppTextStyles.appTitle)]),
      ),
    );
  }
}
