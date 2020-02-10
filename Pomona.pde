
ArrayList<Button> buttons;
ArrayList<SoundFile> soundFiles;
int w;
int h;
int rows = 3;
int cols = 5;



int LIMIT = 100;

PVector getPos(int i) {
  int x = w*(i % cols);
  int y = h*(i / cols);
  return new PVector(x, y);
}

void setup() {
  size(1200, 800);
  strokeWeight(2);
  buttons = new ArrayList<Button>();
  soundFiles = new ArrayList<SoundFile>();
  w = 100;
  h = 100;

  String[] sounds = loadStrings("sounds.txt");
  String[] positions = loadStrings("positions.txt");

  for (int i = 0; i < sounds.length && i < LIMIT; i++) {
    String[] pos = positions[i].split(",");
    String[] sound = sounds[i].split(",");

    //PVector coord = getPos(i);
    //    createButton((int) coord.x, (int) coord.y, 
    //      sound[0], sound[1], sound[2]);

    println(sound[0]);

    createButton(Integer.parseInt(pos[0]), Integer.parseInt(pos[1]), 
      sound[0], sound[1], sound[2]);
    buttons.get(i).amp = (sound.length > 3) ? 
      (float) Double.parseDouble(sound[3]) : 0.5;
  }
}

void createButton(int px, int py, String name, String file, int unitX, int unitY, String type) {
  buttons.add(new Button(px, py, unitX, unitY, name, file, type.equals("0")));
  soundFiles.add(new SoundFile(this, file));
}

void createButton(int px, int py, String name, String file, String type) {
  createButton(px, py, name, file, w, h, type);
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
  String playing = "";
  for (int i = 0; i < buttons.size(); i++) {
    Button b = buttons.get(i);
    SoundFile sound = soundFiles.get(i);
    b.show();

    if (b.isOn && !sound.isPlaying()) {
      if (b.loop) {
        sound.loop();
      } else {
        sound.play();
        b.isOn = false;
      }
    }

    if (b.stop && sound.isPlaying()) {
      sound.stop();
      b.stop = false;
      b.isOn = false;
    }

    if (sound.isPlaying()) {
      String status = (b.loop) ? " (Looping)" : (b.isOn ? " (x2)" : " (1x)");
      playing += b.name + status +"\n";
      sound.amp(b.amp);
    }
  }


  fill(255);
  text("Sounds playing\n" +playing, 500, 500);
}
