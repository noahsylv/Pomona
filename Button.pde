
import processing.sound.*;
SoundFile file;

class Button {

  boolean isOn;
  String name;
  String filename;
  int px;
  int py;
  int w;
  int h;

  int barX = 10;
  int barY = 1;
  int gap = 5;

  float amp = 0.5;


  public Button(int px, int py, int w, int h, String name, String filename) {
    this.px = px;
    this.py = py;
    this.w = w;
    this.h = h;
    this.name = name;
    isOn = false;
    this.filename = filename;
  }

  void show() {
    if (!isOn) {
      fill(100);
    } else {
      fill(255);
    }
    rect(px, py, w, h);
    text(name, px, py);
    //fill(255);
    rect(px + w + gap, py, w / barX, h / barY);
    fill(100, 100, 150);
    int barHeight = (int) map(amp, 0, 1, 0, h / barY);
    rect(px + w + gap, py + h / barY - barHeight, w / barX, barHeight);
  }

  void click(int x, int y) {
    if (x > px && x < px + w) {
      if (y > py && y < py + h) {
        isOn = !isOn;
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
