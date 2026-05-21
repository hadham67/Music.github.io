/* Music App, Final Project */

// Import Minim Library (if needed in the future)

// Global Variables
int appWidth, appHeight;
int paperWidth = 279; // Paper width in mm
int paperHeight = 216; // Paper height in mm

// UI Element Positions and Sizes
float exitBtnX, exitBtnY, exitBtnW, exitBtnH;
float photoX, photoY, photoW, photoH;
float lyricsX, lyricsY, lyricsW, lyricsH;
float titleX, titleY, titleW, titleH;
float writerX, writerY, writerW, writerH;
float progressX, progressY, progressW, progressH;
float btnBaseX, btnBaseY, btnTotalW, btnW, btnH;

void setup() {
  // Set up the screen
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;

  // Exit Button
  exitBtnH = appHeight * 15 / paperHeight;
  exitBtnW = exitBtnH;
  exitBtnX = appWidth - exitBtnW;
  exitBtnY = 0;

  // Photo Album & Lyrics
  photoX = appWidth * 14 / paperWidth;
  photoY = appHeight * 20 / paperHeight;
  photoW = appWidth * 120 / paperWidth;
  photoH = appHeight * 88 / paperHeight;

  lyricsX = appWidth * 144 / paperWidth;
  lyricsY = appHeight * 20 / paperHeight;
  lyricsW = appWidth * 120 / paperWidth;
  lyricsH = appHeight * 88 / paperHeight;

  // Title & Song Writer
  titleX = appWidth * 14 / paperWidth;
  titleY = appHeight * 120 / paperHeight;
  titleW = appWidth * 120 / paperWidth;
  titleH = appHeight * 20 / paperHeight;

  writerX = appWidth * 144 / paperWidth;
  writerY = appHeight * 120 / paperHeight;
  writerW = appWidth * 120 / paperWidth;
  writerH = appHeight * 20 / paperHeight;

  // Progress Bar
  progressX = appWidth * 14 / paperWidth;
  progressY = appHeight * 150 / paperHeight;
  progressW = appWidth * 250 / paperWidth;
  progressH = appHeight * 10 / paperHeight;

  // Bottom Bar Buttons
  btnBaseX = appWidth * 14 / paperWidth;
  btnBaseY = appHeight * 175 / paperHeight;
  btnTotalW = appWidth * 250 / paperWidth;
  btnW = btnTotalW / 9;
  btnH = appHeight * 25 / paperHeight;

  // Draw the UI
  background(255);
  stroke(0);
  strokeWeight(2);
  noFill();
  textAlign(CENTER, CENTER);

  // Draw Exit Button
  rect(exitBtnX, exitBtnY, exitBtnW, exitBtnH);
  fill(0);
  textSize(16);
  text("X", exitBtnX + exitBtnW / 2, exitBtnY + exitBtnH / 2);
  noFill();

  // Draw Photo Album
  rect(photoX, photoY, photoW, photoH);
  fill(0);
  textSize(20);
  text("Photo Album", photoX + photoW / 2, photoY + photoH / 2);
  noFill();

  // Draw Lyrics Box
  rect(lyricsX, lyricsY, lyricsW, lyricsH);
  fill(150);
  textSize(16);
  text("Here are the lyrics", lyricsX + lyricsW / 2, lyricsY + 20);
  fill(0, 100, 255);
  textSize(22);
  text("Scrolling right now!", lyricsX + lyricsW / 2, lyricsY + 44);
  fill(150);
  textSize(16);
  text("Endlessly scrolling...", lyricsX + lyricsW / 2, lyricsY + 68);
  noFill();

  // Draw Music Title & Writer
  rect(titleX, titleY, titleW, titleH);
  fill(0);
  textSize(20);
  text("Music Title", titleX + titleW / 2, titleY + titleH / 2);
  noFill();

  rect(writerX, writerY, writerW, writerH);
  fill(0);
  textSize(18);
  text("Song Writer & Features", writerX + writerW / 2, writerY + writerH / 2);
  noFill();

  // Draw Progress Bar
  rect(progressX, progressY, progressW, progressH);
  fill(0);
  textSize(14);
  text("Progress Bar", progressX + progressW / 2, progressY + progressH / 2);
  noFill();

  // Draw Bottom Bar Buttons
  for (int i = 0; i < 9; i++) {
    float currentBtnX = btnBaseX + (i * btnW);
    rect(currentBtnX, btnBaseY, btnW, btnH);

    PFont symbolFont = createFont("Arial Unicode MS", 16);
    textFont(symbolFont);

    fill(0); // Default text color to black
    textSize(16);

    String label = "";

    // Assign labels to buttons
    if (i == 0) label = "🔄"; // Loop
    else if (i == 1) label = "+10s"; // Skip 10 seconds
    else if (i == 2) label = "-10s"; // Rewind 10 seconds
    else if (i == 3) label = "||"; // Pause
    else if (i == 4) label = "▶"; // Play
    else if (i == 5) label = "■"; // Stop
    else if (i == 6) label = "⏭"; // Next Song
    else if (i == 7) label = "⏮"; // Previous Song
    else if (i == 8) {
      label = "❤"; // Heart
      fill(255, 0, 0); // Make the heart red
    }

    // Draw the label
    text(label, currentBtnX + btnW / 2, btnBaseY + btnH / 2);
    noFill(); // Reset fill for the next button
  }

  println("All boxes drawn successfully!");
}

void draw() {
}

void mousePressed() {
}

void keyPressed() {
}
