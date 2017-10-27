class Slider {
  Knob knob;
  PFont font = createFont("arial", 36);
  int x, y, w, h;
  String name;

  Slider(int x, int y, int w, int h, String name) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.name = name;
    textFont(font);
    textAlign(CENTER, CENTER);
    knob = new Knob(x, y+(h/2), 30);
    knob.SetConstrains(x, w+x);
  }

  void Display() {
    fill(255);
    text(name, x-50, y+h/2);
    fill(200);
    rect(x, y, w, h);
    knob.Display();
  }
  
    boolean IsMouseOver() {
    return knob.IsMouseOver();
  }

  void Drag() {
    knob.Drag();
  }

  void Lock() {
    knob.isLocked = true;
  }

  float GetColor() {
    return knob.c;
  }
}

private class Knob {
  float c;
  int x, y, size;
  int xOffset, xMin, xMax;
  boolean isLocked;

  Knob(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    isLocked = true;
  }

  void Display() {
    ellipse(x, y, size, size);
  }

  void SetConstrains(int min, int max) {
    xMin = min;
    xMax = max;
  }

  boolean IsMouseOver() {
    // formula retreived from https://processing.org/examples/rollover.html
    if (sqrt(sq(x - mouseX) + sq(y - mouseY)) < size/2 ) {  
      isLocked = false;
      xOffset = mouseX - x;
      return true;
    }
    else return false;
  }

  void Drag() {
    if (!isLocked) {
      x = constrain(mouseX - xOffset, xMin, xMax);
      c = map(x, xMin, xMax, 0, 255);
    }
  }
}