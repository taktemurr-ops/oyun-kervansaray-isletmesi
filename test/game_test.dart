import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kervansaray_isletmesi/oyun_kervansaray_isletmesi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kervansarayConfig.title.length, 33);
    expect(kervansarayConfig.tagline.length, 33);
    for (final s in kervansarayConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kervansarayConfig.gameId, kervansarayId);
    expect(kervansarayRules.gameId, kervansarayId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kervansarayRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kervansarayId, optionalMechanics: kervansarayRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kervansarayRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
