
// Simple music player GUI

// Complete Music Player GUI with coded icons
// Copy-paste this entire code into Processing

int btnCount = 9;
float btnX = 40, btnY, btnW, btnH;
float topBtnW = 60, topBtnH = 60;
float returnX, returnY, exitX, exitY;

void setup() {
  size(1152, 648);
  textFont(createFont("Arial", 29));
  
  // Calculate button sizes
  btnY = height - 110;
  btnW = (width - 2*btnX) / btnCount;
  btnH = 80;
  
  // Top corner buttons
  returnX = 10; returnY = 10;
  exitX = width - topBtnW - 10; exitY = 10;
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  noFill();

  // Equal spacing layout (25px gaps)
  float margin = 25;
  float leftMargin = 40;
  float elementWidth = width - 2*leftMargin;

  // 1. PHOTO ALBUM (big box at top)
  float photoY = topBtnH + margin;
  rect(leftMargin, photoY, elementWidth, 220);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(24);
  text("photo album", leftMargin + elementWidth/2, photoY + 110);
  noFill();

  // 2. MUSIC TITLE + SONG WRITER
  float titleY = photoY + 220 + margin;
  rect(leftMargin, titleY, 450, 110);
  noFill();
  stroke(0);
  textSize(20);
  text("music title", leftMargin + 225, titleY + 55);
  
  rect(leftMargin + 470, titleY, elementWidth - 450 - 30, 110);
  text("song writer and features", leftMargin + 470 + 200, titleY + 55);
  noFill();

  // 3. PROGRESS BAR
  float progressY = titleY + 110 + margin;
  rect(leftMargin, progressY, elementWidth, 50);
  fill(0);
  textSize(18);
  text("progress bar", leftMargin + elementWidth/2, progressY + 25);
  noFill();

  // 4. BOTTOM 9 BUTTONS WITH ICONS
  for (int i = 0; i < btnCount; i++) {
    float x = btnX + i*btnW;
    
    // Button background + hover
    if (mouseX >= x && mouseX <= x+btnW && mouseY >= btnY && mouseY <= btnY+btnH) {
      fill(230);
    } else {
      fill(245);
    }
    stroke(0);
    strokeWeight(2);
    rect(x, btnY, btnW, btnH);
    
    // Draw icon inside button
    fill(0);
    stroke(0);
    strokeWeight(3);
    drawButtonIcon(i, x, btnY, btnW, btnH);
  }
  noFill();

  // TOP-LEFT RETURN BUTTON
  strokeWeight(2);
  if (mouseX >= returnX && mouseX <= returnX+topBtnW && 
      mouseY >= returnY && mouseY <= returnY+topBtnH) {
    fill(230);
  } else {
    fill(245);
  }
  rect(returnX, returnY, topBtnW, topBtnH);
  fill(0);
  strokeWeight(4);
  textAlign(CENTER, CENTER);
  textSize(24);
  text("<", returnX + topBtnW/2, returnY + topBtnH/2);

  // TOP-RIGHT EXIT BUTTON
  if (mouseX >= exitX && mouseX <= exitX+topBtnW && 
      mouseY >= exitY && mouseY <= exitY+topBtnH) {
    fill(230);
  } else {
    fill(245);
  }
  rect(exitX, exitY, topBtnW, topBtnH);
  fill(0);
  textSize(28);
  text("X", exitX + topBtnW/2, exitY + topBtnH/2);
}

void mousePressed() {
  // Check bottom 9 buttons
  for (int i = 0; i < btnCount; i++) {
    float x = btnX + i*btnW;
    if (mouseX >= x && mouseX <= x+btnW && mouseY >= btnY && mouseY <= btnY+btnH) {
      println("Clicked button:", i, "- action here");
    }
  }
  
  // Return button
  if (mouseX >= returnX && mouseX <= returnX+topBtnW && 
      mouseY >= returnY && mouseY <= returnY+topBtnH) {
    println("Return clicked - go back");
  }
  
  // Exit button
  if (mouseX >= exitX && mouseX <= exitX+topBtnW && 
      mouseY >= exitY && mouseY <= exitY+topBtnH) {
    println("Exit clicked");
    exit();
  }
}

// DRAWS ICONS FOR EACH BUTTON (0-8)
void drawButtonIcon(int index, float x, float y, float w, float h) {
  float cx = x + w/2;
  float cy = y + h/2;
  float size = min(w, h) * 0.35;
  
  stroke(0);
  strokeWeight(3);
  noFill();
  
  switch(index) {
    case 0: // PAUSE (two bars)
      float gap = size * 0.3;
      float barW = size * 0.25;
      rect(cx - gap - barW, cy - size/2, barW, size);
      rect(cx + gap, cy - size/2, barW, size);
      break;
      
    case 1: // PLAY (triangle)
      triangle(cx - size*0.4, cy - size/2, cx - size*0.4, cy + size/2, cx + size*0.5, cy);
      break;
      
    case 2: // MUSIC LIST (lines + note)
      float lineLen = size * 0.9;
      float dy = size * 0.25;
      line(cx - lineLen/2, cy - dy, cx + lineLen/2, cy - dy);
      line(cx - lineLen/2, cy, cx + lineLen/2, cy);
      line(cx - lineLen/2, cy + dy, cx + lineLen/2, cy + dy);
      float nx = cx + lineLen/3;
      float ny = cy - dy*1.2;
      line(nx, ny, nx, ny + size*0.6);
      ellipse(nx + size*0.25, ny, size*0.25, size*0.25);
      break;
      
    case 3: // SKIP 10s
      triangle(cx - size*0.6, cy - size/2, cx - size*0.1, cy, cx - size*0.6, cy + size/2);
      triangle(cx - size*0.1, cy - size/2, cx + size*0.4, cy, cx - size*0.1, cy + size/2);
      textAlign(LEFT, CENTER);
      textSize(14);
      fill(0);
      text("10", cx + size*0.45, cy);
      break;
      
    case 4: // REVERSE 10s
      triangle(cx + size*0.6, cy - size/2, cx + size*0.1, cy, cx + size*0.6, cy + size/2);
      triangle(cx + size*0.1, cy - size/2, cx - size*0.4, cy, cx + size*0.1, cy + size/2);
      textAlign(RIGHT, CENTER);
      textSize(14);
      fill(0);
      text("10", cx - size*0.45, cy);
      break;
      
    case 5: // NEXT SONG
      triangle(cx - size*0.4, cy - size/2, cx + size*0.05, cy, cx - size*0.4, cy + size/2);
      triangle(cx + size*0.05, cy - size/2, cx + size*0.5, cy, cx + size*0.05, cy + size/2);
      line(cx + size*0.6, cy - size/2, cx + size*0.6, cy + size/2);
      break;
      
    case 6: // PREVIOUS SONG
      line(cx - size*0.6, cy - size/2, cx - size*0.6, cy + size/2);
      triangle(cx - size*0.5, cy, cx, cy - size/2, cx, cy + size/2);
      triangle(cx, cy, cx + size*0.5, cy - size/2, cx + size*0.5, cy + size/2);
      break;
      
    case 7: // LYRICS (bubble)
      float bw = size*1.1;
      float bh = size*0.8;
      float bx = cx - bw/2;
      float by = cy - bh/2;
      rect(bx, by, bw, bh, 5);
      triangle(bx + bw*0.3, by + bh, bx + bw*0.3 + size*0.25, by + bh, bx + bw*0.3, by + bh + size*0.25);
      line(bx + size*0.15, cy - size*0.15, bx + bw - size*0.15, cy - size*0.15);
      line(bx + size*0.15, cy + size*0.05, bx + bw - size*0.3, cy + size*0.05);
      break;
      
    case 8: // HEART
      beginShape();
      vertex(cx, cy + size*0.4);
      bezierVertex(cx - size*0.7, cy, cx - size*0.4, cy - size*0.6, cx, cy - size*0.3);
      bezierVertex(cx + size*0.4, cy - size*0.6, cx + size*0.7, cy, cx, cy + size*0.4);
      endShape();
      break;
  }
 
 noFill();
  strokeWeight(2);
  textAlign(CENTER, CENTER);
}
