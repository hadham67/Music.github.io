import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//static music
Minim minim; //initates entire class
int numberOfSongs = 1; //Best Practice
int numberOfSoundEffects = 1; //Best Practice
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects];
int currentSong = numberOfSongs - numberOfSongs; //ZERO, Math Property
//
//Display
size(700, 500); //width //height
//fullScreen(); //displayWidth //displayHeight
int appWidth = width; //Best Practice
int appHeight = height;
//
//Music Loading - STRUCTURED Review
minim = new Minim(this); //Manditory
String upArrow = "../";
String musicFolder = "Music/"; //Developer Specific
String soundEffectsFolder = "Sound Effects/"; //Developer Specific
String normalFolder = "Dependancies/"; //Developer Specific
String songName1 = "groove";
String soundEffect1 = "Car_Door_Closing";
String fileExtension_mp3 = ".mp3";
//
//Directory and Pathway
String musicDirectory = upArrow + upArrow + upArrow + normalFolder + musicFolder; //Concatenation
String soundEffectsDirectory =  upArrow + upArrow + upArrow + normalFolder + soundEffectsFolder; //Concatenation
String pathway = musicDirectory + songName1 + fileExtension_mp3; //TO BE Rewritten and deleted once file is LOADED
playList[ currentSong ] = minim.loadFile( pathway ); //ERROR: Verify Spelling & Library installed, Sketch / Import Library
pathway = soundEffectsDirectory + soundEffect1 + fileExtension_mp3; //Rewritting FILE
soundEffects[currentSong] = minim.loadFile( pathway ); //ERROR: Verify Spelling & Library installed, Sketch / Import Library
//
//ERROR Check Music and Sound Effect Variables
//Thrown by commenting out FILE, playList[] or soundEffects[]
if ( playList[currentSong]==null || soundEffects[currentSong]==null) { //ERROR, play list is NULL
  //See FILE or minim.loadFile
  println("The Play List or Sound Effects did not load properly");
  printArray(playList);
  printArray(soundEffects);
  /*
  println("Music Pathway", musicDirectory);
   println("Full Music File Pathway", file);
   */
} else {
  //CAUTION: will execute if variables created properly
  playList[currentSong].play();
  soundEffects[currentSong].play();
  //
  printArray(playList);
  printArray(soundEffects);
}
//
