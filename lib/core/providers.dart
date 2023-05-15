import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/constants/constants.dart';

final appwriteClientProvider = Provider(
  (ref) => Client()
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(),
);

final appwriteAccountProvider = Provider(
  (ref) => Account(
    ref.watch(appwriteClientProvider),
  ),
);
