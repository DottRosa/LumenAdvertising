import ddf.minim.*;

Marte marte;  //Prima scena
TerraMarte terraMarte;  //Seconda scena
Lumen lumen;  //Terza scena
Logo logo;  //Quarta scena
Minim minim;  
AudioPlayer song;

void setup(){
  size(800,600);
  //Carico le immagini
  PImage marsImage = loadImage("marte.png");
  PImage earthImage = loadImage("earth.png");
  PImage naveImage = loadImage("razzo.png");
  
  //Istanzio tutti gli oggetti
  marte = new Marte(marsImage);
  terraMarte = new TerraMarte(marsImage, earthImage);
  lumen = new Lumen(naveImage);
  logo = new Logo(naveImage);
  //Istanzio ed eseguo il suono di background
  minim = new Minim(this);
  song = minim.loadFile("DreamySpace.mp3");
  song.play();
  
  //Imposto il font
  PFont font = createFont("alienleaguebold.ttf", 32);
  textFont(font);
}

void draw(){
  background(0);
  int mill = millis();
  
  //Scena 1 - Marte
  if(mill < 13000){
    marte.draw();
    if(mill > 11000)
      marte.uscita();
  } 
  
  //Scena 2 - Terra e Marte
  if(marte.uscitaCompletata()){
    terraMarte.draw();
    if(mill > 17000){
      terraMarte.uscita();
    }
  } 
  //Scena 3 - Lumen
  if(terraMarte.uscitaCompletata()){
    if(lumen.neverStart()){
      lumen.startSong(new Minim(this));    
    }
    lumen.draw();
  }
  
  //Scena 4 - Logo  
  if(lumen.uscitaCompletata()){
    logo.draw();
    song.shiftGain(map(logo.getPosition(), height, 0, 0, -20), 0.0, 10000);
    if(logo.uscitaCompletata()){
      exit();
    }
  }
}