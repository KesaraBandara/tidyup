import 'package:flutter/material.dart';
import 'package:tidyup/models/note_model.dart';
import 'package:tidyup/services/note_service.dart';
import 'package:tidyup/utils/constants.dart';
import 'package:tidyup/utils/router.dart';
import 'package:tidyup/utils/colors.dart';
import 'package:tidyup/utils/text_styles.dart';
import 'package:tidyup/widget/notes_card.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Notes", style: AppTextStyles.appTitle),
            const SizedBox(height: 30),
            allNotes.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height + 0.5,
                    child: Center(
                      child: Text(
                        " No notes yet, add some! ",
                        style: AppTextStyles.appDescription,
                      ),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppConstants.kDefaultPadding,
                          crossAxisSpacing: AppConstants.kDefaultPadding,
                          childAspectRatio: 6 / 4,
                        ),
                    itemCount: noteWithCategory.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // go to the notes by category page
                          AppRouter.router.push(
                            "/category",
                            extra: noteWithCategory.keys.elementAt(index),
                          );
                        },
                        child: NotesCard(
                          noteCategory: noteWithCategory.keys.elementAt(index),
                          noOfNotes: noteWithCategory.values
                              .elementAt(index)
                              .length,
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
