import 'dart:developer';
import 'dart:io';

void main() {
  final projectRoot = Directory.current.path;
  final libDir = '$projectRoot/lib';

  // Create directories
  //!!!!! to Run File ==>> dart generate.dart  >> in terminal 
  createDir('$libDir/core');
  createDir('$libDir/core/utils');
  createDir('$libDir/core/theming');
  createDir('$libDir/core/constant');
  createDir('$libDir/core/networking');
  createDir('$libDir/presentation');
  //! to add new folder and its content just change the folder name 
  createDir('$libDir/presentation');
  createDir('$libDir/presentation/ui');
  createDir('$libDir/presentation/cubit');
  createDir('$libDir/presentation/ui/widgets');
  createDir('$libDir/presentation/data');
  createDir('$libDir/presentation/data/model');

  // createDir('$libDir/presentation/FolderName/data/repo');




  // Create common files
  createFile('$libDir/presentation/cubit/chat_viewmodel.dart', '''

''');






















  createFile('$libDir/presentation/firstFeature/UI/home_view.dart', '''
// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     // ex.HomeViewBody
//     body:,
//     );
//   }
// }
''');
  createFile(
      '$libDir/presentation/firstFeature/UI/widgets/home_view_body.dart', '''
// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     // ex.HomeViewBody
//     body:,
//     );
//   }
// }
''');
  log('✅ Generated project structure!');
}

void createDir(String path) {
  final dir = Directory(path);
  if (!dir.existsSync()) {
    dir.createSync();
  }
}

void createFile(String path, [String content = '']) {
  final file = File(path);
  if (!file.existsSync()) {
    file.writeAsStringSync(content);
  } else {
  }
}
