import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/common/error_text.dart';
import 'package:reddit_clone/core/common/loader.dart';
import 'package:reddit_clone/core/utils.dart';
import 'package:reddit_clone/features/community/controller/community_controller.dart';
import 'package:reddit_clone/models/community_model.dart';
import 'package:reddit_clone/theme/palette.dart';

class AddPostTypeScreen extends ConsumerStatefulWidget {
  final String type;

  const AddPostTypeScreen({super.key, required this.type});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPostTypeScreenState();
}

class _AddPostTypeScreenState extends ConsumerState<AddPostTypeScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final linkController = TextEditingController();
  File? bannerFile;
  List<Community> communities = [];
  Community? selectedCommunity;

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    linkController.dispose();
  }

  void selectBannerImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        bannerFile = File(res.files.first.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTypeImage = widget.type == 'image';
    final isTypeText = widget.type == 'text';
    final isTypeLink = widget.type == 'link';
    final currentTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Post ${widget.type}'), actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Share',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
                filled: true,
                hintText: 'Enter title here',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(18)),
            maxLength: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          if (isTypeImage)
            GestureDetector(
              onTap: selectBannerImage,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: const [10, 4],
                strokeCap: StrokeCap.round,
                color: currentTheme.textTheme.bodyText2!.color!,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: bannerFile != null
                      ? Image.file(bannerFile!)
                      : const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                          ),
                        ),
                ),
              ),
            ),
          if (isTypeText)
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Enter description here',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(18)),
            ),
          if (isTypeLink)
            TextField(
              controller: linkController,
              decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Enter link here',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(18)),
            ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text('Enter community'),
          ),
          ref.watch(userCommunitiesProvider).when(
              data: (data) {
                communities = data;
                if (data.isEmpty) {
                  return const SizedBox();
                }

                return DropdownButton(
                    value: selectedCommunity ?? data[0],
                    items: data
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedCommunity = val;
                      });
                    });
              },
              error: (error, stackTrace) => ErrorText(error: error.toString()),
              loading: () => const Loader())
        ]),
      ),
    );
  }
}