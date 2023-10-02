import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bandhu/filter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  CollectionReference help = FirebaseFirestore.instance.collection('help');
  late String name;
  late String phonenumber;
  late String address;
  late String description;
late String imageUrl;
  FilterOption selectedFilter =
      FilterOption.Medication; // Initialize with a default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 100,),
                Image.asset("assets/images/logo1.jpg",width: 1080,height: 70,),
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your Name',
                    hintStyle: TextStyle(color: Colors.white), // Set the hint text color
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    phonenumber = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Phone Number',
                    hintStyle: TextStyle(color: Colors.white), // Set the hint text color
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    address = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Type your address',
                    hintStyle: TextStyle(color: Colors.white), // Set the hint text color
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    description = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Describe the type of help you want',
                    hintStyle: TextStyle(color: Colors.white), // Set the hint text color
                  ),
                ),

                IconButton(
                    onPressed: () async {
                      ImagePicker imagepicker = ImagePicker();
                      XFile? file = await imagepicker.pickImage(
                          source: ImageSource.gallery);
                      if(file==null)return;
                      print('{$file.path}');
                      String uniqueFilename=DateTime.now().millisecondsSinceEpoch.toString();
                      Reference referenceRoot=FirebaseStorage.instance.ref();
                      Reference referenceDirImages=referenceRoot.child('images');
                      Reference referencetoUpload=referenceDirImages.child(uniqueFilename);
                      try{
                        await referencetoUpload.putFile(File(file!.path));
imageUrl=await referencetoUpload.getDownloadURL();

                      }catch(error){}
                    },
                    icon: Icon(Icons.camera_alt))
              ],
            ),
          ),
          DropdownButton<FilterOption>(
            // Dropdown button for selecting a filter
            value: selectedFilter,
            onChanged: (newValue) {
              setState(() {
                selectedFilter = newValue!;
              });
            },
            items: FilterOption.values.map((option) {
              return DropdownMenuItem<FilterOption>(
                value: option,
                child: Text(option
                    .toString()
                    .split('.')
                    .last,style: TextStyle(color: Colors.white),), // Remove "FilterOption."
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () async {
              // Convert the enum value to a string
              String filterString = selectedFilter.toString().split('.').last;
if(imageUrl.isEmpty){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pls Upload a image")));
}
              // Check if a filter is selected before adding data
              if (filterString.isNotEmpty) {
                await help.add({
                  'name': name,
                  'address': address,
                  'phonenumber': phonenumber,
                  'description': description,
                  'filter': filterString,
                  'images':imageUrl,// Save the selected filter
                }).then((value) => print("User added"));
              } else {
                print("Please select a filter before submitting.");
              }
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
