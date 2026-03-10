
// STATIC MODE MUSIC PLAYER GUI
// Paste into a NEW sketch, delete any existing code first.

// window size
size(1152, 648);
background(255);

// common settings
stroke(0);
strokeWeight(2);
noFill();
textFont(createFont("Arial", 22));
textAlign(CENTER, CENTER);

// layout values
float margin = 25;
float leftMargin = 40;
float elementWidth = width - 2*leftMargin;

// 1) TOP CORNER BUTTONS (static)

// return button
float topBtnW = 60;
float topBtnH = 60;
rect(10, 10, topBtnW, topBtnH);
fill(0);
text("<", 10 + topBtnW/2, 10 + topBtnH/2);
noFill();

// exit button
rect(width - topBtnW - 10, 10, topBtnW, topBtnH);
fill(0);
text("X", width - topBtnW/2 - 10, 10 + topBtnH/2);
noFill();

// 2) PHOTO ALBUM BOX
float photoY = topBtnH + margin;
float photoH = 230;
rect(leftMargin, photoY, elementWidth, photoH);
fill(0);
text("photo album", leftMargin + elementWidth/2, photoY + photoH/2);
noFill();

// 3) TITLE + SONG WRITER ROW
float titleY = photoY + photoH + margin;
float titleH = 110;

// music title
rect(leftMargin, titleY, 450, titleH);
fill(0);
text("music title", leftMargin + 225, titleY + titleH/2);
noFill();

// song writer and features
rect(leftMargin + 470, titleY, elementWidth - 450 - 30, titleH);
fill(0);
text("song writer and features",
     leftMargin + 470 + (elementWidth - 450 - 30)/2,
     titleY + titleH/2);
noFill();

// 4) PROGRESS BAR
float progressY = titleY + titleH + margin;
float progressH = 50;
rect(leftMargin, progressY, elementWidth, progressH);
fill(0);
text("progress bar", leftMargin + elementWidth/2, progressY + progressH/2);
noFill();

// 5) BOTTOM BAR WITH 9 BUTTONS (using a for-loop, still allowed)
int btnCount = 9;
float btnX = 40;
float btnY = height - 110;
float btnW = (width - 2*btnX) / btnCount;
float btnH = 80;

for (int i = 0; i < btnCount; i++) {
  float x = btnX + i*btnW;
  rect(x, btnY, btnW, btnH);

  // simple text labels instead of functions
  fill(0);
  textSize(14);
  String label = "";
  if (i == 0) label = "pause";
  else if (i == 1) label = "play";
  else if (i == 2) label = "music list";
  else if (i == 3) label = "skip 10s";
  else if (i == 4) label = "reverse 10s";
  else if (i == 5) label = "next song";
  else if (i == 6) label = "previous song";
  else if (i == 7) label = "lyrics";
  else if (i == 8) label = "favorite";

  text(label, x + btnW/2, btnY + btnH/2);
  noFill();
}
