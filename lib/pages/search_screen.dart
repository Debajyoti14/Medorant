// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore
import 'package:flutter/material.dart';

import '../widgets/search_item.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/recent-searches';

  const SearchScreen(String args, {Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List medicines = [
    {
      "medicine_name": "Azax 500 Tablet",
      "mrp": "₹71.25",
      "alternative_medicines": [
        "Azibest 500mg Tablet",
        "Trulimax 500mg Tablet",
        "Zady 500 Tablet",
        "Laz 500mg Tablet",
        "Azibact 500 Tablet"
      ],
      "uses": ["Bacterial infections"],
      "prescription": "prescription Required",
      "type_of_sell": "3 tablets in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Swallow it as a whole. Do not chew, crush or break it. Azax 500 Tablet may be taken with or without food, but it is better to take it at a fixed time.",
      "chemical_class": "Macrolides",
      "manufacturer": "Sun Pharmaceutical Industries Ltd",
      "salt": "Azithromycin (500mg),",
      "therapeutic_class": "ANTI INFECTIVES",
      "side_effects": ["Vomiting", "Nausea", "Abdominal pain", "Diarrhea"],
      "habit_forming": "No",
      "action_class": "Macrolides"
    },
    {
      "medicine_name": "Antiflu 75mg Capsule",
      "mrp": "₹660.66",
      "alternative_medicines": [
        "Natflu 75mg Capsule",
        "Starflu 75mg Capsule",
        "Olsivir Capsule",
        "Mcosvir 75mg Capsule",
        "Fluvia 75mg Capsule"
      ],
      "uses": ["Influenza (flu)"],
      "prescription": "prescription Required",
      "type_of_sell": "10 capsules in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Antiflu 75mg Capsule may be taken with or without food, but it is better to take it at a fixed time.",
      "chemical_class": "Gamma amino acids derivatives {Acetamido cyclohexene}",
      "manufacturer": "Cipla Ltd",
      "salt": "Oseltamivir Phosphate (75mg),",
      "therapeutic_class": "ANTI INFECTIVES",
      "side_effects": ["Nausea", "Vomiting", "Abdominal pain", "Diarrhea"],
      "habit_forming": "No",
      "action_class": "Neuraminidase Inhibitors"
    },
    {
      "medicine_name": "Aldactone Tablet",
      "mrp": "₹31.8",
      "alternative_medicines": [
        "Spirix 25mg Tablet",
        "Genericart Spironolactone 25mg Tablet"
      ],
      "uses": [
        "Hypertension (high blood pressure)",
        "Edema",
        "Low potassium",
        "Heart failure"
      ],
      "prescription": "prescription Required",
      "type_of_sell": "15 tablets in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Swallow it as a whole. Do not chew, crush or break it. Aldactone Tablet is to be taken with food.",
      "chemical_class": "Potassium sparing diuretics",
      "manufacturer": "RPG Life Sciences Ltd",
      "salt": "Spironolactone (25mg),",
      "therapeutic_class": "CARDIAC",
      "side_effects": [
        "Nausea",
        "Vomiting",
        "Leg cramps",
        "Dizziness",
        "Drowsiness",
        "Confusion",
        "Breast enlargement in male",
        "Increased creatinine level in blood"
      ],
      "habit_forming": "No",
      "action_class": "Potassium- sparing Diuretics"
    },
    {
      "medicine_name": "Antiflu 75mg Capsule",
      "mrp": "₹660.66",
      "alternative_medicines": [
        "Natflu 75mg Capsule",
        "Starflu 75mg Capsule",
        "Olsivir Capsule",
        "Mcosvir 75mg Capsule",
        "Fluvia 75mg Capsule"
      ],
      "uses": ["Influenza (flu)"],
      "prescription": "prescription Required",
      "type_of_sell": "10 capsules in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Antiflu 75mg Capsule may be taken with or without food, but it is better to take it at a fixed time.",
      "chemical_class": "Gamma amino acids derivatives {Acetamido cyclohexene}",
      "manufacturer": "Cipla Ltd",
      "salt": "Oseltamivir Phosphate (75mg),",
      "therapeutic_class": "ANTI INFECTIVES",
      "side_effects": ["Nausea", "Vomiting", "Abdominal pain", "Diarrhea"],
      "habit_forming": "No",
      "action_class": "Neuraminidase Inhibitors"
    },
    {
      "medicine_name": "Aldactone Tablet",
      "mrp": "₹31.8",
      "alternative_medicines": [
        "Spirix 25mg Tablet",
        "Genericart Spironolactone 25mg Tablet"
      ],
      "uses": [
        "Hypertension (high blood pressure)",
        "Edema",
        "Low potassium",
        "Heart failure"
      ],
      "prescription": "prescription Required",
      "type_of_sell": "15 tablets in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Swallow it as a whole. Do not chew, crush or break it. Aldactone Tablet is to be taken with food.",
      "chemical_class": "Potassium sparing diuretics",
      "manufacturer": "RPG Life Sciences Ltd",
      "salt": "Spironolactone (25mg),",
      "therapeutic_class": "CARDIAC",
      "side_effects": [
        "Nausea",
        "Vomiting",
        "Leg cramps",
        "Dizziness",
        "Drowsiness",
        "Confusion",
        "Breast enlargement in male",
        "Increased creatinine level in blood"
      ],
      "habit_forming": "No",
      "action_class": "Potassium- sparing Diuretics"
    },
    {
      "medicine_name": "Antiflu 75mg Capsule",
      "mrp": "₹660.66",
      "alternative_medicines": [
        "Natflu 75mg Capsule",
        "Starflu 75mg Capsule",
        "Olsivir Capsule",
        "Mcosvir 75mg Capsule",
        "Fluvia 75mg Capsule"
      ],
      "uses": ["Influenza (flu)"],
      "prescription": "prescription Required",
      "type_of_sell": "10 capsules in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Antiflu 75mg Capsule may be taken with or without food, but it is better to take it at a fixed time.",
      "chemical_class": "Gamma amino acids derivatives {Acetamido cyclohexene}",
      "manufacturer": "Cipla Ltd",
      "salt": "Oseltamivir Phosphate (75mg),",
      "therapeutic_class": "ANTI INFECTIVES",
      "side_effects": ["Nausea", "Vomiting", "Abdominal pain", "Diarrhea"],
      "habit_forming": "No",
      "action_class": "Neuraminidase Inhibitors"
    },
    {
      "medicine_name": "Aldactone Tablet",
      "mrp": "₹31.8",
      "alternative_medicines": [
        "Spirix 25mg Tablet",
        "Genericart Spironolactone 25mg Tablet"
      ],
      "uses": [
        "Hypertension (high blood pressure)",
        "Edema",
        "Low potassium",
        "Heart failure"
      ],
      "prescription": "prescription Required",
      "type_of_sell": "15 tablets in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Swallow it as a whole. Do not chew, crush or break it. Aldactone Tablet is to be taken with food.",
      "chemical_class": "Potassium sparing diuretics",
      "manufacturer": "RPG Life Sciences Ltd",
      "salt": "Spironolactone (25mg),",
      "therapeutic_class": "CARDIAC",
      "side_effects": [
        "Nausea",
        "Vomiting",
        "Leg cramps",
        "Dizziness",
        "Drowsiness",
        "Confusion",
        "Breast enlargement in male",
        "Increased creatinine level in blood"
      ],
      "habit_forming": "No",
      "action_class": "Potassium- sparing Diuretics"
    },
    {
      "medicine_name": "Antiflu 75mg Capsule",
      "mrp": "₹660.66",
      "alternative_medicines": [
        "Natflu 75mg Capsule",
        "Starflu 75mg Capsule",
        "Olsivir Capsule",
        "Mcosvir 75mg Capsule",
        "Fluvia 75mg Capsule"
      ],
      "uses": ["Influenza (flu)"],
      "prescription": "prescription Required",
      "type_of_sell": "10 capsules in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Antiflu 75mg Capsule may be taken with or without food, but it is better to take it at a fixed time.",
      "chemical_class": "Gamma amino acids derivatives {Acetamido cyclohexene}",
      "manufacturer": "Cipla Ltd",
      "salt": "Oseltamivir Phosphate (75mg),",
      "therapeutic_class": "ANTI INFECTIVES",
      "side_effects": ["Nausea", "Vomiting", "Abdominal pain", "Diarrhea"],
      "habit_forming": "No",
      "action_class": "Neuraminidase Inhibitors"
    },
    {
      "medicine_name": "Aldactone Tablet",
      "mrp": "₹31.8",
      "alternative_medicines": [
        "Spirix 25mg Tablet",
        "Genericart Spironolactone 25mg Tablet"
      ],
      "uses": [
        "Hypertension (high blood pressure)",
        "Edema",
        "Low potassium",
        "Heart failure"
      ],
      "prescription": "prescription Required",
      "type_of_sell": "15 tablets in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Swallow it as a whole. Do not chew, crush or break it. Aldactone Tablet is to be taken with food.",
      "chemical_class": "Potassium sparing diuretics",
      "manufacturer": "RPG Life Sciences Ltd",
      "salt": "Spironolactone (25mg),",
      "therapeutic_class": "CARDIAC",
      "side_effects": [
        "Nausea",
        "Vomiting",
        "Leg cramps",
        "Dizziness",
        "Drowsiness",
        "Confusion",
        "Breast enlargement in male",
        "Increased creatinine level in blood"
      ],
      "habit_forming": "No",
      "action_class": "Potassium- sparing Diuretics"
    },
    {
      "medicine_name": "Antiflu 75mg Capsule",
      "mrp": "₹660.66",
      "alternative_medicines": [
        "Natflu 75mg Capsule",
        "Starflu 75mg Capsule",
        "Olsivir Capsule",
        "Mcosvir 75mg Capsule",
        "Fluvia 75mg Capsule"
      ],
      "uses": ["Influenza (flu)"],
      "prescription": "prescription Required",
      "type_of_sell": "10 capsules in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Antiflu 75mg Capsule may be taken with or without food, but it is better to take it at a fixed time.",
      "chemical_class": "Gamma amino acids derivatives {Acetamido cyclohexene}",
      "manufacturer": "Cipla Ltd",
      "salt": "Oseltamivir Phosphate (75mg),",
      "therapeutic_class": "ANTI INFECTIVES",
      "side_effects": ["Nausea", "Vomiting", "Abdominal pain", "Diarrhea"],
      "habit_forming": "No",
      "action_class": "Neuraminidase Inhibitors"
    },
    {
      "medicine_name": "Aldactone Tablet",
      "mrp": "₹31.8",
      "alternative_medicines": [
        "Spirix 25mg Tablet",
        "Genericart Spironolactone 25mg Tablet"
      ],
      "uses": [
        "Hypertension (high blood pressure)",
        "Edema",
        "Low potassium",
        "Heart failure"
      ],
      "prescription": "prescription Required",
      "type_of_sell": "15 tablets in 1 strip",
      "how_to_use":
          "Take this medicine in the dose and duration as advised by your doctor. Swallow it as a whole. Do not chew, crush or break it. Aldactone Tablet is to be taken with food.",
      "chemical_class": "Potassium sparing diuretics",
      "manufacturer": "RPG Life Sciences Ltd",
      "salt": "Spironolactone (25mg),",
      "therapeutic_class": "CARDIAC",
      "side_effects": [
        "Nausea",
        "Vomiting",
        "Leg cramps",
        "Dizziness",
        "Drowsiness",
        "Confusion",
        "Breast enlargement in male",
        "Increased creatinine level in blood"
      ],
      "habit_forming": "No",
      "action_class": "Potassium- sparing Diuretics"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent Search',
          style: TextStyle(color: const Color(0xFF706FE5), fontSize: 26),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: medicines
              .map(
                (data) => SearchItem(
                  medicineName: data['medicine_name'],
                  price: data['mrp'],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
