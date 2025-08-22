import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tz_dashboard/core/di/di.dart';
import 'package:tz_dashboard/core/route/app_router.dart';
// import 'src/core/route/app_router.dart';
// import 'src/core/di/di.dart';

Future<void> main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await initDependecies();
 runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget{

  const MyApp({super.key});

  @override 

  Widget build(BuildContext context,WidgetRef ref){
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'App',
      debugShowCheckedModeBanner: false,
    routerConfig: router,
    theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}