import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'core/di/setup.dart';
import 'cubit/analyze_cubit.dart';
import 'cubit/journal_cubit.dart';
import 'screens/home_screen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:  HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
 setup();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AnalyzeCubit>()),
        BlocProvider(create: (context) => getIt<JournalCubit>()),
      ],
      // create: (context) => getIt<AnalyzeCubit>(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: const HomeScreen(),
      ),
    );
  }
}


