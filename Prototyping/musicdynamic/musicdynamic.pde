float lyricsX, lyricsY, lyricsW, lyricsH;
float titleX, titleY, titleW, titleH;
float writerX, writerY, writerW, writerH;


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// =======================================================
// GLOBAL VARIABLES
// =======================================================



Minim minim;  
int numberOfSongs = 3; 
int numberOfSoundEffect = 1;

AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
AudioMetaData[] playListMetaData = new AudioMetaData[ numberOfSongs ];
AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffect ];
int currentSong = 0; 

// =======================================================
// SETUP
// =======================================================
void setup() {
  size( 700, 500 ); 
  int appWidth = width; 
  int appHeight = height;

  // --- DRAWING DIVS ---
  lyricsX = appWidth * 144 / 279; 
  lyricsY = appHeight * 20 / 216; 
  lyricsW = appWidth * 120 / 279; 
  lyricsH = appHeight * 88 / 216;

  titleX = appWidth * 14 / 279;
  titleY = appHeight * 120 / 216;
  titleW = appWidth * 120 / 279;
  titleH = appHeight * 20 / 216;

  writerX = appWidth * 144 / 279;
  writerY = appHeight * 120 / 216;
  writerW = appWidth * 120 / 279;
  writerH = appHeight * 20 / 216;

  rect(lyricsX, lyricsY, lyricsW, lyricsH);     
  rect(titleX, titleY, titleW, titleH);         
  rect(writerX, writerY, writerW, writerH);

  // --- MUSIC LOADING (THE BULLETPROOF WAY) ---
  minim = new Minim(this); 
  
  String[] songName = new String[numberOfSongs];
  songName[0] = "Eureka.mp3";
  songName[1] = "Ghost_Walk.mp3";
  songName[2] = "Start_Your_Engines.mp3";
  
  // Load Songs
  for ( int i=0; i<numberOfSongs; i++ ) {
    playList[ i ] = minim.loadFile( songName[i] ); 
    
    if ( playList[i] == null ) { 
      println("Uh oh! Could not find the song: " + songName[i]);
      exit();
    } else {
      playListMetaData[ i ] = playList[ i ].getMetaData();
    }
  }
  
  // Load Sound Effects
  String soundEffect1 = "Car_Door_Closing.mp3";
  soundEffects[0] = minim.loadFile( soundEffect1 ); 
  
  if ( soundEffects[0] == null ) { 
    println("Uh oh! Could not find the sound effect: " + soundEffect1);
    // Notice I removed the exit() here so the program runs anyway even if this is missing!
  }
  
  // AUTO PLAY: Play the first song once everything is loaded!
  if (playList[currentSong] != null) {
    playList[currentSong].play();
  }
  
}//End Setup

// =======================================================
// DRAW (60 FPS Loop)
// =======================================================
void draw() {
  // Keep this completely empty for now! 
}

// =======================================================
// MOUSE PRESSED
// =======================================================
void mousePressed() {
}

// =======================================================
// KEYBOARD SHORTCUTS
// =======================================================
void keyPressed() {
  
  // Simple Play
  if ( key=='P' || key=='p' ) playList[currentSong].loop(0); 

  // Pause / Play Toggle
  if ( key=='O' || key=='o' ) { 
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    }
  }

  // Stop / Rewind Toggle
  if ( key=='S' | key=='s' ) {
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause(); 
    } else {
      playList[currentSong].rewind(); 
    }
  }

  // Looping
  if ( key=='L' || key=='l' ) playList[currentSong].loop(1); 
  if ( key=='K' || key=='k' ) playList[currentSong].loop(); 

  // Fast Forward & Rewind
  if ( key=='F' || key=='f' ) playList[currentSong].skip( 10000 ); 
  if ( key=='R' || key=='r' ) playList[currentSong].skip( -10000 ); 

  // Mute / Unmute
  if ( key=='W' || key=='w' ) { 
    if ( playList[currentSong].isMuted() ) {
      playList[currentSong].unmute();
    } else {
      playList[currentSong].mute();
    }
  }

  // Quit
  if ( key==CODED || keyCode==ESC ) exit(); 
  if ( key=='Q' || key=='q' ) exit(); 

  // Next Song
  if ( key=='N' || key=='n' ) { 
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
      
      if ( currentSong == numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      playList[currentSong].play();
    } else {
      playList[currentSong].rewind();
      if ( currentSong == numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
    }
  }

  // Random Song
  if ( key=='Y' || key=='y' ) {
    playList[currentSong].pause();
    playList[currentSong].rewind();
    currentSong = int(random(numberOfSongs));
    playList[currentSong].play();
  }
  
}//End Key Pressed
