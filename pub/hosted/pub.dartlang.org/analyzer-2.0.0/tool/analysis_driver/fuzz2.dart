import 'package:analyzer/file_system/memory_file_system.dart';
import 'package:analyzer/src/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/src/dart/analysis/file_byte_store.dart';
import 'package:analyzer/src/test_utilities/mock_sdk.dart';

main(List<String> args) async {
  final input = args[0];

  var resourceProvider = MemoryResourceProvider();

  MockSdk(resourceProvider: resourceProvider);

  var path = '/home/test/lib/test.dart';
  resourceProvider.newFile(path, input);

  var collection = AnalysisContextCollectionImpl(
    resourceProvider: resourceProvider,
    includedPaths: [path],
    sdkPath: sdkRoot,
    byteStore: FileByteStore(
      '/usr/local/google/home/scheglov/dart/fuzz2/bin/byte_store',
    ),
  );
  var session = collection.contextFor(path).currentSession;
  await session.getResolvedLibrary2(path);
//  print(result.units[0].errors);
//  print(input.length);
}
