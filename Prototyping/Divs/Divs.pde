// =======================================================
// Display Setup
// =======================================================
fullScreen();
println(displayWidth, displayHeight);
int appWidth = displayWidth;
int appHeight = displayHeight;

int paperWidth = 279; // Landscape 8.5x11 inches in mm
int paperHeight = 216; 

// =======================================================
// DIV Variable Declarations
// =======================================================
float exitBtnX, exitBtnY, exitBtnW, exitBtnH;

// Row 2: Photo & Lyrics
float photoX, photoY, photoW, photoH;
float lyricsX, lyricsY, lyricsW, lyricsH;

// Row 3: Title & Song Writer
float titleX, titleY, titleW, titleH;
float writerX, writerY, writerW, writerH;

// Row 4: Progress Bar 
float progressX, progressY, progressW, progressH;

// Row 5: Bottom Buttons
float btnBaseX, btnBaseY, btnTotalW, btnW, btnH;

// =======================================================
// Population (Math / Unitless Ratios)
// =======================================================

// 1) Exit Button (Perfect Square, but smaller!)
exitBtnH = appHeight * 15 / paperHeight; // Scaled down from 20 to 15
exitBtnW = exitBtnH;                     // Force width to match exactly!
exitBtnX = appWidth - exitBtnW;          // Glue it to the far right edge
exitBtnY = 0;                            // Glue it to the top edge

// 2) Photo Album & Lyrics Boxes (Wide: 120, Height: 88)
photoX = appWidth * 14 / paperWidth; 
photoY = appHeight * 20 / paperHeight;
photoW = appWidth * 120 / paperWidth; 
photoH = appHeight * 88 / paperHeight;

lyricsX = appWidth * 144 / paperWidth; 
lyricsY = appHeight * 20 / paperHeight; 
lyricsW = appWidth * 120 / paperWidth; 
lyricsH = appHeight * 88 / paperHeight;

// 3) Title + Song Writer Row
titleX = appWidth * 14 / paperWidth;
titleY = appHeight * 120 / paperHeight;
titleW = appWidth * 120 / paperWidth;
titleH = appHeight * 20 / paperHeight;

writerX = appWidth * 144 / paperWidth;
writerY = appHeight * 120 / paperHeight;
writerW = appWidth * 120 / paperWidth;
writerH = appHeight * 20 / paperHeight;

// 4) Progress Bar 
progressX = appWidth * 14 / paperWidth;
progressY = appHeight * 150 / paperHeight;
progressW = appWidth * 250 / paperWidth; 
progressH = appHeight * 10 / paperHeight;

// 5) Bottom Bar 9 Buttons
btnBaseX = appWidth * 14 / paperWidth;
btnBaseY = appHeight * 175 / paperHeight;
btnTotalW = appWidth * 250 / paperWidth; 
btnW = btnTotalW / 9; 
btnH = appHeight * 25 / paperHeight;

// =======================================================
// Drawing the DIVs
// =======================================================
background(255);
stroke(0);
strokeWeight(2);
noFill();
textAlign(CENTER, CENTER);

// --- Draw Exit Button ---
rect(exitBtnX, exitBtnY, exitBtnW, exitBtnH);
fill(0); textSize(16); // Shrunk the text slightly to fit the smaller button
text("X", exitBtnX + exitBtnW/2, exitBtnY + exitBtnH/2);
noFill();

// --- Draw Photo Album ---
rect(photoX, photoY, photoW, photoH);
fill(0); textSize(20); 
text("photo album", photoX + photoW/2, photoY + photoH/2);
noFill();

// --- Draw Lyrics Box & Fake Highlight ---
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

// --- Draw Music Title & Writer ---
rect(titleX, titleY, titleW, titleH);
fill(0); textSize(20);
text("music title", titleX + titleW/2, titleY + titleH/2);
noFill();

rect(writerX, writerY, writerW, writerH);
fill(0); textSize(18); 
text("song writer & features", writerX + writerW/2, writerY + writerH/2);
noFill();

// --- Draw Progress Bar ---
rect(progressX, progressY, progressW, progressH);
fill(0); textSize(14);
text("progress bar", progressX + progressW/2, progressY + progressH/2);
noFill();

// --- Draw 9 Bottom Buttons ---
int btnCount = 9;
for (int i = 0; i < btnCount; i++) {
  float currentBtnX = btnBaseX + (i * btnW);
  rect(currentBtnX, btnBaseY, btnW, btnH);

  fill(0);
  textSize(14); 
  
  String label = "";
  if (i == 0) label = "pause";
  else if (i == 1) label = "play";
  else if (i == 2) label = "shuffle"; 
  else if (i == 3) label = "skip 10s"; 
  else if (i == 4) label = "rev 10s";
  else if (i == 5) label = "next";
  else if (i == 6) label = "prev";
  else if (i == 7) {
    label = "save\nsong"; 
    textSize(11); 
  }
  else if (i == 8) {
    label = "infinite\nshuffle"; 
    textSize(11); 
  }

  text(label, currentBtnX + btnW/2, btnBaseY + btnH/2);
  noFill();
}

println("All boxes drawn successfully!");
