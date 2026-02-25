import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tidyup/services/note_service.dart';
import 'package:tidyup/utils/colors.dart';
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

  Future _loadCategories() async {
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
                child: Form(
                  child: Column(
                    children: [
                      //dropdown to select category
                      widget.isNewCategory
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                  color: AppColors.kWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  hintText: "New Category",
                                  hintStyle: TextStyle(
                                    color: AppColors.kWhiteColor.withOpacity(
                                      0.5,
                                    ),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    fontFamily: GoogleFonts.dmSans().fontFamily,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: AppColors.kWhiteColor.withOpacity(
                                        0.1,
                                      ),
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: AppColors.kWhiteColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonFormField(
                                style: TextStyle(
                                  color: AppColors.kWhiteColor,
                                  fontFamily: GoogleFonts.dmSans().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                                isExpanded: false,
                                hint: const Text("Select Category"),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppConstants.kDefaultPadding,
                                    ),
                                    borderSide: BorderSide(
                                      color: AppColors.kWhiteColor.withOpacity(
                                        0.1,
                                      ),
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppConstants.kDefaultPadding,
                                    ),
                                    borderSide: BorderSide(
                                      color: AppColors.kWhiteColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                items: categories.map((String category) {
                                  return DropdownMenuItem<String>(
                                    alignment: Alignment.centerLeft,
                                    value: category,
                                    child: Text(
                                      category,
                                      style: AppTextStyles.appButton,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {},
                              ),
                            ),
                      const SizedBox(height: 10),
                      // Title field
                      TextFormField(
                        maxLines: 2,
                        style: TextStyle(
                          color: AppColors.kWhiteColor,
                          fontSize: 30,
                        ),
                        decoration: InputDecoration(
                          hintText: "Note Title",
                          hintStyle: TextStyle(
                            color: AppColors.kWhiteColor.withOpacity(0.5),
                            fontSize: 35,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //content field
                      TextFormField(
                        maxLines: 12,
                        style: TextStyle(
                          color: AppColors.kWhiteColor,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: "Note Content",
                          hintStyle: TextStyle(
                            color: AppColors.kWhiteColor.withOpacity(0.5),
                            fontSize: 20,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      //button to save note
                      const SizedBox(height: 10),
                      Divider(
                        color: AppColors.kWhiteColor.withOpacity(0.2),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                AppColors.kFabColor,
                              ),
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Save Note",
                                style: AppTextStyles.appButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
