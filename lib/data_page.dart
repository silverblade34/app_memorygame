List<String> fillsourceArray() {
  return [
    'assets/memorygame/img1.jpeg',
    'assets/memorygame/img1.jpeg',
    'assets/memorygame/img2.jpeg',
    'assets/memorygame/img2.jpeg',
    'assets/memorygame/img3.jpeg',
    'assets/memorygame/img3.jpeg',
    'assets/memorygame/img4.jpeg',
    'assets/memorygame/img4.jpeg',
    'assets/memorygame/img5.jpeg',
    'assets/memorygame/img5.jpeg',
    'assets/memorygame/img6.jpeg',
    'assets/memorygame/img6.jpeg',
    'assets/memorygame/img7.jpeg',
    'assets/memorygame/img7.jpeg',
  ];
}

enum Level { Hard, Medium, Easy }

List getSourceArray(Level level) {
  List<String> levellist = new List<String>();
  List sourceArray = fillsourceArray();
  if (level == Level.Hard) {
    sourceArray.forEach((element) {
      levellist.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 6; i++) {
      levellist.add(sourceArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 4; i++) {
      levellist.add(sourceArray[i]);
    }
  }
  levellist.shuffle();
  return levellist;
}

List<bool> getInitialitemState(Level level) {
  List<bool> initialitemstate = new List<bool>();
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      initialitemstate.add(true);
    }
  }else if (level == Level.Medium) {
    for (int i = 0; i < 18; i++) {
      initialitemstate.add(true);
    }
  }else if (level == Level.Easy) {
    for (int i = 0; i < 18; i++) {
      initialitemstate.add(true);
    }
  }
  return initialitemstate;
}
