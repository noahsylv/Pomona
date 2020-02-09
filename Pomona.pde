
ArrayList<Button> buttons;
ArrayList<SoundFile> soundFiles;
int w = 100;
int h = 100;

void setup() {
  size(1200, 800);
  strokeWeight(2);
  buttons = new ArrayList<Button>();
  soundFiles = new ArrayList<SoundFile>();

  createButton(100, 100, "Scene 2", "02.mp3");
  createButton(300, 100, "Scene 4", "04.mp3");
  createButton(500, 100, "Scene 14", "14.mp3");
  createButton(100, 400, "Scene 16", "16.mp3");
  

  //createButton(100, 100, "Scene 1", "rain.mp3");
  //createButton(600, 700, "cars", "cars.mp3");
  //createButton(600, 400, "heavy rain", "heavyRain.mp3", (int) (1.2 * w), h);
  //createButton(400, 50, "tunnel", "tunnelOrig.mp3");
  //createButton(225, 225, "furnace", "furnace.mp3");
  //createButton(700, 600, "crowd", "crowd.mp3");
  //createButton(200, 50, "tunnel", "tunnel.mp3");
  //createButton(100, 300, "wind", "wind1.mp3");
  //createButton(200, 500, "wind", "wind1.mp3");
}

void createButton(int px, int py, String name, String file, int unitX, int unitY){
  buttons.add(new Button(px, py, unitX, unitY, name, file));
  soundFiles.add(new SoundFile(this, file));
}

void createButton(int px, int py, String name, String file) {
  createButton(px, py, name, file, w, h);
}

void mousePressed() {
  for (Button b : buttons) {
    b.click(mouseX, mouseY);
  }
}

void mouseDragged() {
  mousePressed();
}



void draw() {
  background(0);
  for (int i = 0; i < buttons.size(); i++) {
    Button b = buttons.get(i);
    SoundFile sound = soundFiles.get(i);
    b.show();
    if (b.isOn && !sound.isPlaying()) {
      sound.loop();
    }
    if (!b.isOn && sound.isPlaying()) {
      sound.pause();
    }
    if (sound.isPlaying()) {
      sound.amp(b.amp);
    }
  }
}
