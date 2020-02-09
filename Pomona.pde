
ArrayList<Button> buttons;
ArrayList<SoundFile> soundFiles;
int w = 100;
int h = 100;

void setup() {
  size(1200, 800);
  buttons = new ArrayList<Button>();
  soundFiles = new ArrayList<SoundFile>();

  createButton(100, 100, "rain", "rain.mp3");
  createButton(600, 800, "cars", "cars.mp3");
  createButton(600, 400, "heavy rain", "heavyRain.mp3");
  createButton(400, 50, "tunnel", "tunnelOrig.mp3");
  createButton(225, 225, "furnace", "furnace.mp3");
  createButton(700, 600, "crowd", "crowd.mp3");
  //createButton(200, 50, "tunnel", "tunnel.mp3");
  createButton(100, 300, "wind", "wind1.mp3");
    createButton(200, 300, "wind", "wind1.mp3");

}


void createButton(int px, int py, String name, String file) {
  buttons.add(new Button(px, py, w, h, name, file));
  soundFiles.add(new SoundFile(this, file));
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
