import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

import 'core/theme/app_theme.dart';
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'features/portfolio/presentation/pages/portfolio_page.dart';
import 'injection_container.dart' as di;

late final Highlighter _javaDarkHighlighter;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the highlighter.
  await Highlighter.initialize(['java']);

  // Load the default dark theme and create a highlighter.
  var darkTheme = await HighlighterTheme.loadDarkTheme();
  _javaDarkHighlighter = Highlighter(language: 'java', theme: darkTheme);

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<PortfolioBloc>()..add(GetPortfolioDataEvent()),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Jonathan Mark Mwigo Portfolio',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            home: PortfolioPage(codeHighlighter: _javaDarkHighlighter),
          );
        },
      ),
    );
  }
}
