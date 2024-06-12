import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../common/widgets/background_image.dart';
import '../common/widgets/custom_app_bar.dart';
import '../common/widgets/reuseable_elevated_button.dart';
import '../common/widgets/text_feild_style.dart';
import '../common/widgets/text_style.dart';


class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  XFile ?photoFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //isTappable false use because if user update profile click than no action
      appBar: CustomAppBar(context,isTapppable:false),
      body: BackgroundImage(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Update Profile",
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        //image pick from galary use image_picker package
                        final imagePicker=ImagePicker();
                        final result=await imagePicker.pickImage(source: ImageSource.gallery);
                        if(result !=null){
                          photoFile=result;
                        }

                        
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Colors.grey,

                              ),
                              child: const Text("Photo"),
                            ),
                            if(photoFile !=null)
                              Image.file(File(photoFile?.path ?? ""),width: 20,height: 20,),
                              Expanded(child: Text(photoFile?.name ?? "",maxLines: 3,)),
                          ],
                        ),
                      ),
                    ),

                     const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: textFeildStyle("Email:"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: textFeildStyle("First Name:"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: textFeildStyle("Last Name:"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: textFeildStyle("Mobile:"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: textFeildStyle("Password:"),
                    ),
                    const SizedBox(height: 15,),
                    ReuseableElevatedButton(onTap: () {}),
                    const SizedBox(height: 20,),

                  ],
                ),
              ),
            ),
          )),
    );
  }
}
