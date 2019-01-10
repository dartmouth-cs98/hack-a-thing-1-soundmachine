class Pod {
  float x, y;          // placement
  float size = 60;     // size
  int c;               // color
  boolean on;          // whether pod is on or off
  AudioPlayer sound;

  Pod (AudioPlayer sound0, float x0, float y0, int c0)  {
    sound = sound0;
    x = x0; y = y0;
    c = c0;
  }

  void draw()  {
    if (on)  {
      fill(c);
    }
    else  {
      if (mouseX >= x && mouseX <= x+60 && mouseY >= y && mouseY <= y+60)  {
        fill(205);  // hover
      }
      else  {
        fill(255);
      }
    }

    strokeWeight(4);
    stroke(c);
    rect(x, y, size, size, 7);
    if (on)  {
      fill(255,70);
      ellipse(x+size/2, y+size/2, size/2, size/2);
    }
  }

  void play()  {
    sound.play(0);
  }

  void activate()  {
    on = !on;
  }

}
