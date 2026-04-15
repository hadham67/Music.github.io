// =======================================================
// Display
// =======================================================
fullScreen();
int appWidth = displayWidth;
int appHeight = displayHeight;

// =======================================================
// Pathways & Folders
// =======================================================
String upArrow = "..";
String dependenciesFolder = "dependencies";
String imagesFolder = "images";
String imageName1 = "weeknd";
String imageName2 = "bike";
String imageName3 = "SoccerBall";
String fileExtension = ".jpg";
String open = "/";

String imageDirectory = upArrow + open + upArrow + open + dependenciesFolder + open + imagesFolder + open;
String pathway1 = imageDirectory + imageName1 + fileExtension;
String pathway2 = imageDirectory + imageName2 + fileExtension;
String pathway3 = imageDirectory + imageName3 + fileExtension;

// =======================================================
// Loading Images
// =======================================================
PImage image1 = loadImage( pathway1 );
PImage image2 = loadImage( pathway2 );
PImage image3 = loadImage( pathway3 );

int imageWidth1 = 0;
int imageHeight1 = 0;

// Tell the computer to automatically read The Weeknd's true size
if (image1 != null) {
  imageWidth1 = image1.width;
  imageHeight1 = image1.height;
}

// =======================================================
// Population: DIVs
// =======================================================
int numberOfButtons = 7;
int widthOfButton = appWidth/(numberOfButtons + 2);
int beginningButtonSpace = widthOfButton;
float imageDivX = 20 * ( appWidth / 120 );
float imageDivY = 10 * ( appHeight / 280 );
float imageDivWidth = 80 * ( appWidth / 120 );
float imageDivHeight = 60 * ( appHeight / 280 );

// =======================================================
// Drawing DIV and Image (With Clean Aspect Ratio Math)
// =======================================================
rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);

if (image1 != null) {
  // 1. Calculate the true ratio of The Weeknd
  float image1Ratio = float(imageWidth1) / float(imageHeight1);
  
  // 2. Start by assuming we will perfectly fill the WIDTH of the div
  float imageWidthAdjusted1 = imageDivWidth;
  float imageHeightAdjusted1 = imageWidthAdjusted1 / image1Ratio;
  
  // 3. WHILE LOOP: If that height overflows the bottom of our div, shrink it!
  while ( imageHeightAdjusted1 > imageDivHeight ) {
    imageWidthAdjusted1 *= 0.99; // Shrink the width by 1%
    imageHeightAdjusted1 = imageWidthAdjusted1 / image1Ratio; // Recalculate height
  }
  
  // 4. Draw the perfectly scaled image of The Weeknd!
  image(image1, imageDivX, imageDivY, imageWidthAdjusted1, imageHeightAdjusted1);
} else {
  // Safety net if the pathway breaks
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Could not find The Weeknd!", imageDivX + imageDivWidth/2, imageDivY + imageDivHeight/2);
  noFill();
}
