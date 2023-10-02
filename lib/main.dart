import 'package:bandhu/bots/lib/providers/chats_provider.dart';
import 'package:bandhu/bots/lib/providers/models_provider.dart';
import 'package:bandhu/community/community%20page.dart';
import 'package:bandhu/community/page1.dart';
import 'package:bandhu/community/page2.dart';
import 'package:bandhu/firebase_options.dart';
import 'package:bandhu/frameeleven.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bots/lib/constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(



      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],

      child: MaterialApp(
        title: 'Flutter ChatBOT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(
              color: cardColor,
            )),
        home:  FrameElevenScreen(),
      ),

    );

  }
}

