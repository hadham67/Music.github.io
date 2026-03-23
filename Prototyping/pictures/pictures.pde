/* Adpect Ratio
*/
// 
//Display
fullScreen();
//
String upArrow = "..";
String dependenciesFolder = "Dependencies";
String imagesFolder = "pictures";
String imageName1 = "weeknd";
String imageName2 = "bike";
String imageName3 = "SoccerBall";
String fileExtension = ".jpg";
String open = "/";
// 
// Concentration
//Note, Cut, Cut, See Absolute Pathway:
//Note,Cut Cut, See Absoloute Pathway: Dependencies\images
String imageDirectory = upArrow + open + upArrow + open + dependenciesFolder + open + imagesFolder + open;
String pathway1 = imageDirectory + imageName1 + fileExtension;
String pathway2 = imageDirectory + imageName2 + fileExtension;
String pathway3 = imageDirectory + imageName3 + fileExtension;
//
//println (pathway);
//

PImage image1 = loadImage( pathway1 );
PImage image2 = loadImage( pathway2 );
PImage image3 = loadImage( pathway3 );
//
image(image1, 0, 0);
image(image2, 0, 0);
image(image3, 0, 0);
