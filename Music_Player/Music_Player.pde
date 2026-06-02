
/* Music App, Final Project */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// =======================================================
// GLOBAL VARIABLES
// =======================================================

int appWidth, appHeight;
int paperWidth = 279;
int paperHeight = 216;

// MUSIC
Minim minim;

int numberOfSongs = 3;
int numberOfSoundEffect = 1;

AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs];
AudioPlayer[] soundEffects = new AudioPlayer[numberOfSoundEffect];

int currentSong = 0;

// IMAGE
PImage image1;

// UI ELEMENTS
float exitBtnX, exitBtnY, exitBtnW, exitBtnH;
float photoX, photoY, photoW, photoH;
float lyricsX, lyricsY, lyricsW, lyricsH;
float titleX, titleY, titleW, titleH;
float writerX, writerY, writerW, writerH;
float progressX, progressY, progressW, progressH;
float btnBaseX, btnBaseY, btnTotalW, btnW, btnH;

// =======================================================
// SETUP
// =======================================================

void setup() {

  fullScreen();

  appWidth = displayWidth;
  appHeight = displayHeight;

  // UI layout
  exitBtnH = appHeight * 15 / paperHeight;
  exitBtnW = exitBtnH;
  exitBtnX = appWidth - exitBtnW;
  exitBtnY = 0;

  photoX = appWidth * 14 / paperWidth;
  photoY = appHeight * 20 / paperHeight;
  photoW = appWidth * 120 / paperWidth;
  photoH = appHeight * 88 / paperHeight;

  lyricsX = appWidth * 144 / paperWidth;
  lyricsY = appHeight * 20 / paperHeight;
  lyricsW = appWidth * 120 / paperWidth;
  lyricsH = appHeight * 88 / paperHeight;

  titleX = appWidth * 14 / paperWidth;
  titleY = appHeight * 120 / paperHeight;
  titleW = appWidth * 120 / paperWidth;
  titleH = appHeight * 20 / paperHeight;

  writerX = appWidth * 144 / paperWidth;
  writerY = appHeight * 120 / paperHeight;
  writerW = appWidth * 120 / paperWidth;
  writerH = appHeight * 20 / paperHeight;

  progressX = appWidth * 14 / paperWidth;
  progressY = appHeight * 150 / paperHeight;
  progressW = appWidth * 250 / paperWidth;
  progressH = appHeight * 10 / paperHeight;

  btnBaseX = appWidth * 14 / paperWidth;
  btnBaseY = appHeight * 175 / paperHeight;
  btnTotalW = appWidth * 250 / paperWidth;
  btnW = btnTotalW / 9;
  btnH = appHeight * 25 / paperHeight;

  // MUSIC
  minim = new Minim(this);

  String[] songName = {
    "Eureka.mp3",
    "Ghost_Walk.mp3",
    "Start_Your_Engines.mp3"
  };

  for (int i = 0; i < numberOfSongs; i++) {
    playList[i] = minim.loadFile(songName[i]);
    if (playList[i] != null) {
      playListMetaData[i] = playList[i].getMetaData();
    }
  }

  soundEffects[0] = minim.loadFile("Car_Door_Closing.mp3");

  if (playList[currentSong] != null) {
    playList[currentSong].play();
  }

  // IMAGE
  image1 = loadImage("weeknd.jpg");
}

// =======================================================
// DRAW
// =======================================================

void draw() {

  background(255);

  stroke(0);
  strokeWeight(2);
  noFill();
  textAlign(CENTER, CENTER);

  // EXIT
  rect(exitBtnX, exitBtnY, exitBtnW, exitBtnH);
  fill(0);
  text("X", exitBtnX + exitBtnW/2, exitBtnY + exitBtnH/2);
  noFill();

  // IMAGE
  rect(photoX, photoY, photoW, photoH);
  if (image1 != null) {
    image(image1, photoX, photoY, photoW, photoH);
  }

  // LYRICS
  rect(lyricsX, lyricsY, lyricsW, lyricsH);
  text("Lyrics Box", lyricsX + lyricsW/2, lyricsY + lyricsH/2);

  // TITLE
  rect(titleX, titleY, titleW, titleH);
  if (playListMetaData[currentSong] != null) {
    text(playListMetaData[currentSong].title(),
      titleX + titleW/2, titleY + titleH/2);
  }

  // WRITER
  rect(writerX, writerY, writerW, writerH);
  if (playListMetaData[currentSong] != null) {
    text(playListMetaData[currentSong].author(),
      writerX + writerW/2, writerY + writerH/2);
  }

  // PROGRESS BAR
  rect(progressX, progressY, progressW, progressH);

  if (playList[currentSong] != null) {
    float p = map(playList[currentSong].position(),
      0, playList[currentSong].length(),
      0, progressW);

    rect(progressX, progressY, p, progressH);
  }

  // =======================================================
  // ICON BUTTONS (FIXED - NO BLACK BOXES)
  // =======================================================

  for (int i = 0; i < 9; i++) {

    float x = btnBaseX + i * btnW;

    rect(x, btnBaseY, btnW, btnH);

    float cx = x + btnW/2;
    float cy = btnBaseY + btnH/2;

    stroke(0);
    strokeWeight(2);
    fill(0);

    if (i == 0) {
      noFill();
      arc(cx, cy, btnW*0.5, btnW*0.5, PI/4, TWO_PI);
      line(cx + 10, cy - 5, cx + 15, cy - 10);
    }

    else if (i == 1) {
      line(cx - 10, cy, cx + 10, cy);
      line(cx, cy - 10, cx, cy + 10);
      rect(cx + 8, cy - 10, 3, 20);
    }

    else if (i == 2) {
      line(cx - 10, cy, cx + 10, cy);
      rect(cx - 11, cy - 10, 3, 20);
    }

    else if (i == 3) {
      rect(cx - 8, cy - 10, 5, 20);
      rect(cx + 3, cy - 10, 5, 20);
    }

    else if (i == 4) {
      triangle(cx - 8, cy - 10, cx - 8, cy + 10, cx + 12, cy);
    }

    else if (i == 5) {
      rect(cx - 10, cy - 10, 20, 20);
    }

    else if (i == 6) {
      triangle(cx - 12, cy - 10, cx - 12, cy + 10, cx + 2, cy);
      rect(cx + 6, cy - 10, 3, 20);
    }

    else if (i == 7) {
      triangle(cx + 12, cy - 10, cx + 12, cy + 10, cx - 2, cy);
      rect(cx - 9, cy - 10, 3, 20);
    }

    else if (i == 8) {
      beginShape();
      vertex(cx, cy + 8);
      bezierVertex(cx - 10, cy - 5, cx - 8, cy - 12, cx, cy - 3);
      bezierVertex(cx + 8, cy - 12, cx + 10, cy - 5, cx, cy + 8);
      endShape(CLOSE);
    }
  }
}

// =======================================================
// MOUSE CONTROLS
// =======================================================

void mousePressed() {

  if (mouseX > exitBtnX && mouseX < exitBtnX + exitBtnW &&
      mouseY > exitBtnY && mouseY < exitBtnY + exitBtnH) {
    exit();
  }

  for (int i = 0; i < 9; i++) {

    float x = btnBaseX + i * btnW;

    if (mouseX > x && mouseX < x + btnW &&
        mouseY > btnBaseY && mouseY < btnBaseY + btnH) {

      if (playList[currentSong] == null) return;

      if (i == 0) playList[currentSong].loop();
      else if (i == 1) playList[currentSong].skip(10000);
      else if (i == 2) playList[currentSong].skip(-10000);

      else if (i == 3) {
        if (playList[currentSong].isPlaying())
          playList[currentSong].pause();
        else
          playList[currentSong].play();
      }

      else if (i == 4) playList[currentSong].play();

      else if (i == 5) {
        playList[currentSong].pause();
        playList[currentSong].rewind();
      }

      else if (i == 6) {
        playList[currentSong].pause();
        playList[currentSong].rewind();
        currentSong++;
        if (currentSong >= numberOfSongs) currentSong = 0;
        playList[currentSong].play();
      }

      else if (i == 7) {
        playList[currentSong].pause();
        playList[currentSong].rewind();
        currentSong--;
        if (currentSong < 0) currentSong = numberOfSongs - 1;
        playList[currentSong].play();
      }

      else if (i == 8) {
        if (soundEffects[0] != null) {
          soundEffects[0].rewind();
          soundEffects[0].play();
        }
      }
    }
  }
}

// =======================================================
// STOP
// =======================================================

void stop() {
  for (int i = 0; i < numberOfSongs; i++) {
    if (playList[i] != null) playList[i].close();
  }
  minim.stop();
  super.stop();
}
