ColorSliders rgbSlider;
ColorSliders hsbSlider;

boolean isHSBColorMode;

void setup() {
  size(900, 600);
  background(0);

  rgbSlider = new ColorSliders(150, 445, 180, 10, ColorSlidersEnum.RGBSlider);
  rgbSlider.SetLabel(width/2, 100);

  hsbSlider = new ColorSliders(620, 445, 180, 10, ColorSlidersEnum.HSBSlider);
  hsbSlider.SetLabel(width/2, 200);
}


void draw() {
  colorMode(RGB, 255);
  background(rgbSlider.GetColor());
  
  fill(0);
  rect(0, 400, 900, 200);

  rgbSlider.Display();
  hsbSlider.Display();
}

// ---------------------------------//
// -------- event handlers ---------//

void mousePressed() {
  if (mouseButton == LEFT) {
    if (rgbSlider.IsMouseOver()) 
      isHSBColorMode = false;
    else if (hsbSlider.IsMouseOver()) 
      isHSBColorMode = true;
  }
}

void mouseDragged() {
  if (!isHSBColorMode) {
    colorMode(RGB);
    rgbSlider.Drag();
    hsbSlider.Update(rgbSlider.c);
  } else {
    colorMode(HSB);
    hsbSlider.Drag();
    rgbSlider.Update(hsbSlider.c);
  }
}

void mouseReleased() {
  rgbSlider.Lock();
  hsbSlider.Lock();
  isHSBColorMode = false;
  colorMode(RGB, 255);
}