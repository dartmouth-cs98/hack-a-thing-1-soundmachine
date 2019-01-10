// Jane Lee
// CS98 hackathing 1

import ddf.minim.*;
import ddf.minim.analysis.*;

// sound variables
Minim minim;
AudioPlayer electric, snare, kick, clap;
AudioPlayer [] sound_array = new AudioPlayer[5];
AudioPlayer song1, song2;
int BUFFSZ = 1024;

// image variables
PImage row1, row2, row3, row4, row5, play_button, stop_button, song1_button, song2_button;
int album_size = 100;

Song living_moments;
Song universal_funk;
Pod[] pods = new Pod[32];

color [] color_array = { color(91, 179, 220), color(246, 192, 78), color(217, 83, 152), color(152, 220, 51) };
boolean loop = false, song1_on = false, song2_on = false, visuals = true;
int tempo = 10, counter = 0;
int activeCol = 0;
int bar_x = 235;
int speed = 40;

void setup() {
  size(1024, 550);
  smooth();

  // sounds
  minim = new Minim(this);
  song1 = minim.loadFile("song1.mp3", BUFFSZ);
  song2 = minim.loadFile("song2.mp3", BUFFSZ);

  electric = minim.loadFile("electric.wav", BUFFSZ);
  snare = minim.loadFile("snare.wav", BUFFSZ);
  kick = minim.loadFile("kick.wav", BUFFSZ);
  clap = minim.loadFile("clap.wav", BUFFSZ);
  sound_array[0] = electric;
  sound_array[1] = snare;
  sound_array[2] = kick;
  sound_array[3] = clap;

  // pods
  for (int i = 0; i < pods.length; i++) {
    int x = i%8;
    int y = i/8;
    pods[i] = new Pod(sound_array[y], 245+(x*80), 120+(y*80), color_array[y]);
  }

  // images
  row1 = loadImage("drum.png"); row1.resize(0, 50);
  row2 = loadImage("bass-drum.png"); row2.resize(0, 50);
  row3 = loadImage("bass.png"); row3.resize(0, 50);
  row4 = loadImage("cymbals.png"); row4.resize(0, 50);
  song1_button = loadImage("song1album.png"); song1_button.resize(0, album_size);
  song2_button = loadImage("song2album.png"); song2_button.resize(0, album_size);

  living_moments = new Song(song1, song1_button, 900, 150, album_size);
  universal_funk = new Song(song2, song2_button, 900, 300, album_size);

}

void draw() {
  frameRate(speed);
  background(0);

  // loop
  for (int i = 0; i < pods.length; i++) {
    pods[i].draw();
  }

  // sounds icons
  image(row1, 165, 130);
  image(row2, 165, 210);
  image(row3, 165, 290);
  image(row4, 165, 370);

  // album covers
  living_moments.draw();
  universal_funk.draw();

  if (song1_on || song2_on) {
    // music waves code inspired from CS2 website
    strokeWeight(3);
    stroke(random(255), random(255), random(255));
    if (song1_on)  {
      living_moments.select();
    }
    else if (song2_on)  {
      universal_funk.select();
    }
    if (visuals)  {
      beginShape(POLYGON);
      for (int i = 0; i < BUFFSZ - 1; i++)
      {
        if (song1_on)  {
          curveVertex(i, 50 + song1.left.get(i)*40);
        }
        else if (song2_on)  {
          curveVertex(i, 50 + song2.left.get(i)*40);
        }
      }
      endShape();
      beginShape(POLYGON);
      for (int i = 0; i < BUFFSZ - 1; i++)
      {
        if (song1_on)  {
          curveVertex(i, 500 + song1.right.get(i)*40);
        }
        else if (song2_on)  {
          curveVertex(i, 500 + song2.right.get(i)*40);
        }
      }
      endShape();
    }

  }
  if (!song1_on) {
    living_moments.deselect();
  }
  if (!song2_on) {
    universal_funk.deselect();
  }


  if (loop) {

    // show stop button
    noStroke(); fill(250, 50, 91); rect(50, 125, 80, 290, 8);
    fill(255, 100); rect(67, 253, 45, 45);

    fill(255, 50);
    rect(bar_x, 100, 80, height-200);

    if (counter%tempo == 0) {
      bar_x = (counter/10)*80 + 235;
      for (int i = activeCol; i < pods.length; i+=8) {
        if (pods[i].on) {
          pods[i].play();
        }
      }
    }
    counter = (counter+1)%(8*tempo);
    activeCol = counter/tempo;

  } else {
    // show play button
    noStroke(); fill(41, 197, 111); rect(50, 125, 80, 290, 8);
    fill(255, 100); triangle(70, 250, 115, 275, 70, 300);
    counter = 0;
  }

}

void mousePressed() {
  // play/stop
  if (mouseX >= 50 && mouseX <= 130 && mouseY >= 125 && mouseY <= 415) {
    loop = !loop;
  }

  // click album
  if (mouseX >= 900 && mouseX <= 1000 && mouseY >= 150 && mouseY <= 250) {
    song2_on = false;
    song1_on = !song1_on;
  }
  else if (mouseX >= 900 && mouseX <= 1000 && mouseY >= 300 && mouseY <= 400)  {
    song1_on = false;
    song2_on = !song2_on;
  }

  for (int i = 0; i < pods.length; i++) {
    if (mouseX >= pods[i].x && mouseX <= pods[i].x+60) {
      if (mouseY >= pods[i].y && mouseY <= pods[i].y+60) {
        pods[i].activate();
      }
    }
  }
}
