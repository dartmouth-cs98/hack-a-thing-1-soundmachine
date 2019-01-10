class Song {
  int x, y, s;         // where and how big the song button is
  AudioPlayer song;
  PImage album;        // the picture of the album
  boolean selected;    // whether a song is selected or not

  Song (AudioPlayer song0, PImage album0, int x0, int y0, int s0)  {
    song = song0; album = album0;
    x = x0; y = y0; s = s0;
  }

  void draw()  {
    image(album, x, y);

    if (mouseX >= x && mouseX <= x+s && mouseY >= y && mouseY <= y+s)  {
      fill(255, 100);
      stroke(255); strokeWeight(4);
      rect(x, y, s, s);
    }
    if (selected)  {
      fill(129, 84, 180, 100);
      stroke(255);
      rect(x, y, s, s);
    }
  }

  void select()  {
    selected = true;
    song.play();
  }

  void deselect()  {
    selected = false;
    song.pause();
  }
}
