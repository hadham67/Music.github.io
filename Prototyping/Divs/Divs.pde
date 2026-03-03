
// Simple music player GUI

String[] btnLabels = {
  "pause", "play", "music list",
  "skip 10s", "reverse 10s", "next song",
  "previous song", "lyrics", "favorite"
};

int btnCount = 9;
float btnX, btnY, btnW, btnH;

// top buttons (exit)
float topBtnW = 60;
float topBtnH = 60;
float returnX, returnY;
float exitX, exitY;

void setup() {
  size(1152, 648);
  textFont(createFont("Arial", 22));

  // bottom bar position and size
  btnY = height - 110;
  btnX = 40;
  btnW = (width - 2*btnX) / btnCount;
  btnH = 80;

  // top-left (return) and top-right (exit) buttons
  returnX = 10;
  returnY = 10;
  exitX = width - topBtnW - 10;
  exitY = 10;
}

void draw() {
  background(255);
  stroke(0);
  noFill();

  // EQUAL SPACING SYSTEM (25px between all elements)
  float margin = 25;
  float leftMargin = 40;
  float elementWidth = width - 2*leftMargin;

  // 1. PHOTO ALBUM 
  float photoY = topBtnH + margin;              
  float photoX = leftMargin;
  float photoW = elementWidth;
  float photoH = 220;                           
  rect(photoX, photoY, photoW, photoH);
  drawCenteredText("photo album", photoX, photoY, photoW, photoH);

  // 2. MUSIC TITLE + SONG WRITER (equal spacing below photo)
  float titleY = photoY + photoH + margin;
  rect(leftMargin, titleY, 450, 110);
  drawCenteredText("music title", leftMargin, titleY, 450, 110);

  rect(leftMargin + 470, titleY, elementWidth - 450 - 30, 110);
  drawCenteredText("song writer and features", leftMargin + 470, titleY, elementWidth - 450 - 30, 110);

  // 3. PROGRESS BAR (equal spacing below title)
  float progressY = titleY + 110 + margin;
  rect(leftMargin, progressY, elementWidth, 50);
  drawCenteredText("progress bar", leftMargin, progressY, elementWidth, 50);

  // 4. BOTTOM BUTTONS (equal spacing below progress bar)
  float buttonsY = progressY + 50 + margin;
  for (int i = 0; i < btnCount; i++) {
    float x = btnX + i*btnW;
    if (overRect(x, btnY, btnW, btnH)) {
      fill(230);
    } else {
      fill(245);
    }
    stroke(0);
    rect(x, btnY, btnW, btnH);
    fill(0);
    drawCenteredText(btnLabels[i], x, btnY, btnW, btnH);
  }

  // top-left Return button
  if (overRect(returnX, returnY, topBtnW, topBtnH)) {
    fill(230);
  } else {
    fill(245);
  }
  stroke(0);
  rect(returnX, returnY, topBtnW, topBtnH);
  fill(0);
  textAlign(CENTER, CENTER);
  text("<", returnX + topBtnW/2, returnY + topBtnH/2);

  // top-right Exit button
  if (overRect(exitX, exitY, topBtnW, topBtnH)) {
    fill(230);
  } else {
    fill(245);
  }
  stroke(0);
  rect(exitX, exitY, topBtnW, topBtnH);
  fill(0);
  textAlign(CENTER, CENTER);
  text("X", exitX + topBtnW/2, exitY + topBtnH/2);
}

void mousePressed() {
  // bottom buttons
  for (int i = 0; i < btnCount; i++) {
    float x = btnX + i*btnW;
    if (overRect(x, btnY, btnW, btnH)) {
      println("Button clicked:", btnLabels[i]);
    }
  }

  // Return button action
  if (overRect(returnX, returnY, topBtnW, topBtnH)) {
    println("Return button clicked");
  }

  // Exit button action
  if (overRect(exitX, exitY, topBtnW, topBtnH)) {
    println("Exit button clicked");
    exit();
  }
}

boolean overRect(float x, float y, float w, float h) {
  return mouseX >= x && mouseX <= x+w &&
         mouseY >= y && mouseY <= y+h;
}

void drawCenteredText(String s, float x, float y, float w, float h) {
  textAlign(CENTER, CENTER);
  text(s, x + w/2, y + h/2);
}
