import 'story.dart';

class StoryBrain {
  int _storyIndex = 0;

  final List<Story> _storyData = [
    Story(
        'Bạn bị lạc trong rừng vào ban đêm và thấy một ngôi nhà nhỏ có ánh đèn. Bạn có gõ cửa không?',
        'Có, tôi cần giúp đỡ.',
        'Không, tôi sẽ tiếp tục đi.'),
    Story(
        'Một người đàn ông lớn tuổi mở cửa và mời bạn vào. Ông ấy có vẻ thân thiện, nhưng bạn cũng cảm thấy sợ.',
        'Bước vào trong.',
        'Từ chối và quay lại rừng.'),
    Story(
        'Bạn tiếp tục đi và thấy một con đường dẫn đến một thị trấn.',
        'Đi theo con đường.',
        'Tìm nơi trú ẩn trong rừng.'),
    Story(
        'Bạn đã đến thị trấn an toàn! Kết thúc tốt đẹp.',
        'Chơi lại',
        ''),
    Story(
        'Bạn bị lạc trong rừng và không bao giờ được tìm thấy nữa. Kết thúc tồi tệ!',
        'Chơi lại',
        ''),
  ];

  String getStory() {
    return _storyData[_storyIndex].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyIndex].choice1;
  }

  String getChoice2() {
    return _storyData[_storyIndex].choice2;
  }

  void nextStory(int choiceNumber) {
    if (_storyIndex == 0 && choiceNumber == 1) {
      _storyIndex = 1;
    } else if (_storyIndex == 0 && choiceNumber == 2) {
      _storyIndex = 2;
    } else if (_storyIndex == 1 && choiceNumber == 1) {
      _storyIndex = 3;
    } else if (_storyIndex == 1 && choiceNumber == 2) {
      _storyIndex = 4;
    } else if (_storyIndex == 2 && choiceNumber == 1) {
      _storyIndex = 3;
    } else if (_storyIndex == 2 && choiceNumber == 2) {
      _storyIndex = 4;
    } else {
      restart();
    }
  }

  void restart() {
    _storyIndex = 0;
  }

  bool isEnd() {
    return _storyIndex == 3 || _storyIndex == 4;
  }
}
