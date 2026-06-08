import '../../domain/entities/stop.dart';

class StopModel extends Stop {
  const StopModel({
    required int stageNo,
    required int kmsFromSource,
    required int kmsFromLastStage,
    required String stopName,
    required String stopNameMarathi,
  }) : super(
          stageNo: stageNo,
          kmsFromSource: kmsFromSource,
          kmsFromLastStage: kmsFromLastStage,
          stopName: stopName,
          stopNameMarathi: stopNameMarathi,
        );
}
