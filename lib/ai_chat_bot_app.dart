import 'package:ai_chat_bot_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/provider_config.dart';
import 'package:provider/provider.dart';

class AiChatBotApp extends StatelessWidget {
  const AiChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: ProviderConfig.providers,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Mediviora App',
         routerConfig: AppRoutes.router,
          theme: ThemeData(
            textTheme: GoogleFonts.ubuntuTextTheme(),
          ),
        ),
      ),
    );
  }}
