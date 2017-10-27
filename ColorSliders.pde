class ColorSliders {
  Slider s1, s2, s3;
  ColorSlidersEnum type;
  
  color c;
  float sliderValue1, sliderValue2, sliderValue3;

  PFont font = createFont("Arial", 52);
  boolean isLabelVisible;
  int labelX, labelY;

  ColorSliders(int x, int y, int w, int h, ColorSlidersEnum type) {
    this.type = type;
    if (type == ColorSlidersEnum.RGBSlider) {
      s1 = new Slider(x, y, w, h, "R");
      s2= new Slider(x, y+50, w, h, "G");
      s3 = new Slider(x, y+100, w, h, "B");
    } else if (type == ColorSlidersEnum.HSBSlider) {
      s1 = new Slider(x, y, w, h, "H");
      s2 = new Slider(x, y+50, w, h, "S");
      s3 = new Slider(x, y+100, w, h, "B");
    }
  }

  color GetColor() {
    return c;
  }

  void Display() {
    if (isLabelVisible) {
      fill(0);
      if (type == ColorSlidersEnum.RGBSlider)
        text("RGB (" + (int) sliderValue1 + ", " + (int) sliderValue2 + ", " + (int) sliderValue3 + ")", labelX, labelY);
      else if (type == ColorSlidersEnum.HSBSlider)
        text("HSB (" + (int) sliderValue1 + ", " + (int) sliderValue2 + ", " + (int) sliderValue3 + ")", labelX, labelY);
    }
    s1.Display();
    s2.Display();
    s3.Display();
  }

  void SetLabel(int x, int y) {
    labelX = x;
    labelY = y;
    textFont(font);
    textAlign(CENTER, CENTER);
    isLabelVisible = true;
  }

  boolean IsMouseOver() {
    if (s1.IsMouseOver() || s2.IsMouseOver() || s3.IsMouseOver()) {
      return true;
    } else return false;
  }

  void Drag() {
    s1.Drag();
    s2.Drag();
    s3.Drag();
    sliderValue1 = s1.GetColor();
    sliderValue2 = s2.GetColor();
    sliderValue3 = s3.GetColor();
    c = color(sliderValue1, sliderValue2, sliderValue3);
  }

  void Update(color c) {
    if (type == ColorSlidersEnum.RGBSlider) {
      colorMode(RGB, 255);
      sliderValue1 = red(c);
      sliderValue2 = green(c);
      sliderValue3 = blue(c);
      this.c = color(sliderValue1, sliderValue2, sliderValue3);
    } else if (type == ColorSlidersEnum.HSBSlider) {
      colorMode(HSB, 255);
      sliderValue1 = hue(c);
      sliderValue2 = saturation(c);
      sliderValue3 = brightness(c);
      this.c = color(sliderValue1, sliderValue2, sliderValue3);
    }

    this.s1.knob.c = sliderValue1;
    this.s2.knob.c = sliderValue2;
    this.s3.knob.c = sliderValue3;
    this.s1.knob.x = (int) map(sliderValue1, 0, 255, this.s1.knob.xMin, this.s1.knob.xMax);
    this.s2.knob.x = (int) map(sliderValue2, 0, 255, this.s2.knob.xMin, this.s2.knob.xMax);
    this.s3.knob.x = (int) map(sliderValue3, 0, 255, this.s3.knob.xMin, this.s3.knob.xMax);
  }

  void Lock() {
    s1.Lock();
    s2.Lock();
    s3.Lock();
  }
}

enum ColorSlidersEnum {
  RGBSlider, HSBSlider;
}