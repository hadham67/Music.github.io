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
PImage image2;
PImage image3;

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
    "Party Monster.mp3",
    "Headlines.mp3",
    "Highest In The Room.mp3"
  };

  for (int i = 0; i < numberOfSongs; i++) {
    playList[i] = minim.loadFile(songName[i]);
    if (playList[i] != null) {
      playListMetaData[i] = playList[i].getMetaData();
    }
  }



  if (playList[currentSong] != null) {
    playList[currentSong].play();
  }


 // IMAGE
image1 = loadImage("weeknd.jpg");
image2 = loadImage("headline.jpg");
image3 = loadImage("highest in the room.jpg");
}
// =======================================================
// DRAW
// =======================================================

void draw() {

  background(0);

stroke(255);
strokeWeight(2);
noFill();
textAlign(CENTER, CENTER);

  // EXIT
  rect(exitBtnX, exitBtnY, exitBtnW, exitBtnH);
  fill(255);
  text("X", exitBtnX + exitBtnW/2, exitBtnY + exitBtnH/2);
  noFill();
  // EXIT

boolean exitHover =
  mouseX > exitBtnX &&
  mouseX < exitBtnX + exitBtnW &&
  mouseY > exitBtnY &&
  mouseY < exitBtnY + exitBtnH;

if (exitHover) {

  fill(255);
  stroke(255);
  rect(exitBtnX, exitBtnY, exitBtnW, exitBtnH);

  fill(0);
}
else {

  noFill();
  stroke(255);
  rect(exitBtnX, exitBtnY, exitBtnW, exitBtnH);

  fill(255);
}

text("X", exitBtnX + exitBtnW/2, exitBtnY + exitBtnH/2);

fill(0); // reset text color

  // IMAGE
rect(photoX, photoY, photoW, photoH);

if (currentSong == 0 && image1 != null) {
  image(image1, photoX, photoY, photoW, photoH);
}
else if (currentSong == 1 && image2 != null) {
  image(image2, photoX, photoY, photoW, photoH);
}
else if (currentSong == 2 && image3 != null) {
  image(image3, photoX, photoY, photoW, photoH);
}

  // LYRICS
 rect(lyricsX, lyricsY, lyricsW, lyricsH);
fill(255);
text("Lyrics Box", lyricsX + lyricsW/2, lyricsY + lyricsH/2);

// TITLE
noFill();
stroke(255);
rect(titleX, titleY, titleW, titleH);

fill(255);
if (playListMetaData[currentSong] != null) {
  text(playListMetaData[currentSong].title(),
       titleX + titleW/2,
       titleY + titleH/2);
}
// WRITER
noFill();
stroke(255);
rect(writerX, writerY, writerW, writerH);

fill(255);
if (playListMetaData[currentSong] != null) {
  text(playListMetaData[currentSong].author(),
       writerX + writerW/2,
       writerY + writerH/2);
}
  // PROGRESS BAR
stroke(255);
noFill();
rect(progressX, progressY, progressW, progressH);

if (playList[currentSong] != null) {

  float p = map(
    playList[currentSong].position(),
    0,
    playList[currentSong].length(),
    0,
    progressW
  );

  fill(255);
  rect(progressX, progressY, p, progressH);
  noFill();
}
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

  // LOOP
  
 for (int i = 0; i < 9; i++) {

  float x = btnBaseX + i * btnW;

  boolean hover =
    mouseX > x &&
    mouseX < x + btnW &&
    mouseY > btnBaseY &&
    mouseY < btnBaseY + btnH;

  if (hover) {
    fill(255);      // white button
    stroke(255);
    rect(x, btnBaseY, btnW, btnH);

    fill(0);        // black text
  }
  else {
    noFill();       // black background shows through
    stroke(255);
    rect(x, btnBaseY, btnW, btnH);

    fill(255);      // white text
  }

  textSize(32);
 if (i == 0) text("SAVE", x+btnW/2, btnBaseY+btnH/2);
else if (i == 1) text(">>", x+btnW/2, btnBaseY+btnH/2);   // +10
else if (i == 2) text("<<", x+btnW/2, btnBaseY+btnH/2);   // -10
else if (i == 3) text("||", x+btnW/2, btnBaseY+btnH/2);   // Pause
else if (i == 4) text(">", x+btnW/2, btnBaseY+btnH/2);    // Play
else if (i == 5) text("loop", x+btnW/2, btnBaseY+btnH/2);    // Loop
else if (i == 6) text(">|", x+btnW/2, btnBaseY+btnH/2);   // Next
else if (i == 7) text("|<", x+btnW/2, btnBaseY+btnH/2);   // Previous
else if (i == 8) {
  fill(255, 0, 0);
  text("<3", x+btnW/2, btnBaseY+btnH/2);
}
  noFill();
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

     if (i == 0) {
  println("Song Saved!");
}
      else if (i == 1) playList[currentSong].skip(10000);
      else if (i == 2) playList[currentSong].skip(-10000);

      else if (i == 3) {
        if (playList[currentSong].isPlaying())
          playList[currentSong].pause();
       
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

}
