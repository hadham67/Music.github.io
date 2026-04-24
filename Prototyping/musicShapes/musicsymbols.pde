
// =======================================================
// 1) THIS IS THE FIX! (Variable Declarations)
// We have to tell the computer these exist before we use them!
// =======================================================
float btnBaseX, btnBaseY, btnTotalW, btnW, btnH;

// =======================================================
// Screen Setup 
// =======================================================
fullScreen();
int appWidth = displayWidth;
int appHeight = displayHeight;

int paperWidth = 279; // Landscape 8.5x11 inches in mm
int paperHeight = 216; 

// =======================================================
// Bottom Bar Math
// =======================================================
btnBaseX = appWidth * 14 / paperWidth;
btnBaseY = appHeight * 175 / paperHeight;
btnTotalW = appWidth * 250 / paperWidth; 
btnW = btnTotalW / 9; 
btnH = appHeight * 25 / paperHeight;

// =======================================================
// Drawing the Bottom Bar (Bulletproof Text Version)
// =======================================================
background(255); 
stroke(0);
strokeWeight(2);
noFill();
textAlign(CENTER, CENTER);

int btnCount = 9;
for (int i = 0; i < btnCount; i++) {
  float currentBtnX = btnBaseX + (i * btnW);
  rect(currentBtnX, btnBaseY, btnW, btnH);

  fill(0);
  textSize(20); 
  
  String label = "";
  if (i == 0) label = "||";      
  else if (i == 1) label = ">";   
  else if (i == 2) label = "shfl"; 
  else if (i == 3) label = ">>";  
  else if (i == 4) label = "<<";  
  else if (i == 5) label = ">|";  
  else if (i == 6) label = "|<";  
  else if (i == 7) {
    label = "<3";                 
    fill(255, 0, 0); 
  }
  else if (i == 8) {
    label = "loop";               
  }

  text(label, currentBtnX + btnW/2, btnBaseY + btnH/2);
  noFill(); 
}
