
/* Music App, Final Project */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
int appWidth, appHeight;
int paperWidth = 279;
int paperHeight = 216;

// Music Variables
Minim minim;

int numberOfSongs = 3;
int numberOfSoundEffect = 1;

AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs];
AudioPlayer[] soundEffects = new AudioPlayer[numberOfSoundEffect];

int currentSong = 0;

// UI Element Positions and Sizes
float exitBtnX, exitBtnY, exitBtnW, exitBtnH;
float photoX, photoY, photoW, photoH;
float lyricsX, lyricsY, lyricsW, lyricsH;
float titleX, titleY, titleW, titleH;
float writerX, writerY, writerW, writerH;
float progressX, progressY, progressW, progressH;
float btnBaseX, btnBaseY, btnTotalW, btnW, btnH;

void setup() {

  fullScreen();

  appWidth = displayWidth;
  appHeight = displayHeight;

  // Exit Button
  exitBtnH = appHeight * 15 / paperHeight;
  exitBtnW = exitBtnH;
  exitBtnX = appWidth - exitBtnW;
  exitBtnY = 0;

  // Photo Album
  photoX = appWidth * 14 / paperWidth;
  photoY = appHeight * 20 / paperHeight;
  photoW = appWidth * 120 / paperWidth;
  photoH = appHeight * 88 / paperHeight;

  // Lyrics
  lyricsX = appWidth * 144 / paperWidth;
  lyricsY = appHeight * 20 / paperHeight;
  lyricsW = appWidth * 120 / paperWidth;
  lyricsH = appHeight * 88 / paperHeight;

  // Title
  titleX = appWidth * 14 / paperWidth;
  titleY = appHeight * 120 / paperHeight;
  titleW = appWidth * 120 / paperWidth;
  titleH = appHeight * 20 / paperHeight;

  // Writer
  writerX = appWidth * 144 / paperWidth;
  writerY = appHeight * 120 / paperHeight;
  writerW = appWidth * 120 / paperWidth;
  writerH = appHeight * 20 / paperHeight;

  // Progress Bar
  progressX = appWidth * 14 / paperWidth;
  progressY = appHeight * 150 / paperHeight;
  progressW = appWidth * 250 / paperWidth;
  progressH = appHeight * 10 / paperHeight;

  // Bottom Buttons
  btnBaseX = appWidth * 14 / paperWidth;
  btnBaseY = appHeight * 175 / paperHeight;
  btnTotalW = appWidth * 250 / paperWidth;
  btnW = btnTotalW / 9;
  btnH = appHeight * 25 / paperHeight;

  // =========================
  // MUSIC SETUP
  // =========================

  minim = new Minim(this);

  String[] songName = new String[numberOfSongs];

  songName[0] = "Eureka.mp3";
  songName[1] = "Ghost_Walk.mp3";
  songName[2] = "Start_Your_Engines.mp3";

  for (int i = 0; i < numberOfSongs; i++) {

    playList[i] = minim.loadFile(songName[i]);

    if (playList[i] == null) {
      println("Could not find: " + songName[i]);
    } else {
      playListMetaData[i] = playList[i].getMetaData();
    }
  }

  soundEffects[0] = minim.loadFile("Car_Door_Closing.mp3");

  if (playList[currentSong] != null) {
    playList[currentSong].play();
  }

  println("All boxes drawn successfully!");
}

void draw() {

  background(255);

  stroke(0);
  strokeWeight(2);
  noFill();
  textAlign(CENTER, CENTER);

  // Exit Button
  rect(exitBtnX, exitBtnY, exitBtnW, exitBtnH);

  fill(0);
  textSize(16);
  text("X", exitBtnX + exitBtnW/2, exitBtnY + exitBtnH/2);
  noFill();

  // Photo Album
  rect(photoX, photoY, photoW, photoH);

  fill(0);
  textSize(20);
  text("Photo Album", photoX + photoW/2, photoY + photoH/2);
  noFill();

  // Lyrics Box
  rect(lyricsX, lyricsY, lyricsW, lyricsH);

  fill(150);
  textSize(16);
  text("Here are the lyrics", lyricsX + lyricsW/2, lyricsY + 20);

  fill(0, 100, 255);
  textSize(22);
  text("Scrolling right now!", lyricsX + lyricsW/2, lyricsY + 44);

  fill(150);
  textSize(16);
  text("Endlessly scrolling...", lyricsX + lyricsW/2, lyricsY + 68);
  noFill();

  // Music Title
  rect(titleX, titleY, titleW, titleH);

  fill(0);
  textSize(20);

  if (playListMetaData[currentSong] != null) {
    text(playListMetaData[currentSong].title(),
      titleX + titleW/2,
      titleY + titleH/2);
  } else {
    text("Music Title",
      titleX + titleW/2,
      titleY + titleH/2);
  }

  noFill();

  // Writer Box
  rect(writerX, writerY, writerW, writerH);

  fill(0);

  if (playListMetaData[currentSong] != null) {
    text(playListMetaData[currentSong].author(),
      writerX + writerW/2,
      writerY + writerH/2);
  } else {
    text("Song Writer & Features",
      writerX + writerW/2,
      writerY + writerH/2);
  }

  noFill();

  // Progress Bar
  rect(progressX, progressY, progressW, progressH);

  if (playList[currentSong] != null) {

    float progress =
      map(playList[currentSong].position(),
      0,
      playList[currentSong].length(),
      0,
      progressW);

    fill(0, 200, 0);
    rect(progressX, progressY, progress, progressH);
    noFill();
  }

  // Bottom Buttons
  for (int i = 0; i < 9; i++) {

    float currentBtnX = btnBaseX + (i * btnW);

    rect(currentBtnX, btnBaseY, btnW, btnH);

    PFont symbolFont = createFont("Arial Unicode MS", 16);
    textFont(symbolFont);

    fill(0);
    textSize(16);

    String label = "";

    if (i == 0) label = "🔄";
    else if (i == 1) label = "+10s";
    else if (i == 2) label = "-10s";
    else if (i == 3) label = "||";
    else if (i == 4) label = "▶";
    else if (i == 5) label = "■";
    else if (i == 6) label = "⏭";
    else if (i == 7) label = "⏮";
    else if (i == 8) {
      label = "❤";
      fill(255, 0, 0);
    }

    text(label,
      currentBtnX + btnW/2,
      btnBaseY + btnH/2);

    noFill();
  }
}

void mousePressed() {
}

void keyPressed() {

  if (key == 'P' || key == 'p')
    playList[currentSong].loop(0);

  if (key == 'O' || key == 'o') {

    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    }
  }

  if (key == 'S' || key == 's') {

    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].rewind();
    }
  }

  if (key == 'L' || key == 'l')
    playList[currentSong].loop(1);

  if (key == 'K' || key == 'k')
    playList[currentSong].loop();

  if (key == 'F' || key == 'f')
    playList[currentSong].skip(10000);

  if (key == 'R' || key == 'r')
    playList[currentSong].skip(-10000);

  if (key == 'W' || key == 'w') {

    if (playList[currentSong].isMuted()) {
      playList[currentSong].unmute();
    } else {
      playList[currentSong].mute();
    }
  }

  if (key == 'N' || key == 'n') {

    playList[currentSong].pause();
    playList[currentSong].rewind();

    if (currentSong == numberOfSongs - 1) {
      currentSong = 0;
    } else {
      currentSong++;
    }

    playList[currentSong].play();
  }

  if (key == 'Y' || key == 'y') {

    playList[currentSong].pause();
    playList[currentSong].rewind();

    currentSong = int(random(numberOfSongs));

    playList[currentSong].play();
  }

  if (key == 'Q' || key == 'q')
    exit();
}

void stop() {

  for (int i = 0; i < numberOfSongs; i++) {

    if (playList[i] != null) {
      playList[i].close();
    }
  }

  minim.stop();

  super.stop();
}
