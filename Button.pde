
import processing.sound.*;
SoundFile file;

class Button {

  boolean isOn;
  boolean stop;
  boolean loop;
  String name;
  String filename;
  int px;
  int py;
  int w;
  int h;
  int offset = 10;

  int barX = 3;
  int barY = 1;
  int gap = 15;

  float amp = 0.5;


  public Button(int px, int py, int w, int h, String name, String filename, boolean type) {
    this.px = px;
    this.py = py;
    this.w = w;
    this.h = h;
    this.name = name;
    isOn = false;
    stop = false;
    this.filename = filename;
    loop = type;
  }

  void show() {
    fill(97, 27, 1);
    rect(px - offset/2, py - offset/2, w + offset, h + offset);
    onColor();
    rect(px, py, w, h);



    textAlign(CENTER);
    fill(100);
    rect(px + w + gap, py, w / barX, h / barY);

    onColor(true);

    int barHeight = (int) map(amp, 0, 1, 0, h / barY);
    rect(px + w + gap, py + h / barY - barHeight, w / barX, barHeight);
    textSize(20);
    fill(97, 27, 1);
    text(name, px + w/2, py + h/2);
  }

  void onColor(boolean status) {
    if (!status) {
      fill(100);
    } else {
      fill(100, 100, 150);
    }
  }

  void onColor() {
    onColor(isOn);
  }

  void click(int x, int y) {
    if (x > px && x < px + w) {
      if (y > py && y < py + h) {
        if (isOn) {
          stop = true;
        } else {
          isOn = !isOn;
        }
      }
    }
    // check volume bar
    if (x >= px + w + gap && x <= px + w + gap + w / barX) {
      if (y > py && y < py + h / barY) {
        amp = 1 - map(y, py, py + h, 0, 1);
        println(amp);
      }
    }
  }
}
