class Affordance{
  //Le due immagini relative alla tastiera bianca e nera
  PImage tastieraN, tastieraB;
  //Vettori per la posizione e le dimensioni delle immagini
  PVector dim, pos;
  //Fattore per diminuire la dimensione dell'immagine
  private final static int DIVISORE = 15;
  //Valore booleano per la specifica della tipologia di tastiera da visualizzare
  private boolean blackKeyboard;
  
  
  public Affordance(boolean blackKeyboard){
    this.blackKeyboard = blackKeyboard;
    
    tastieraN = loadImage("tastieraN.png");
    tastieraB = loadImage("tastieraB.png");
    
    dim = new PVector(tastieraN.width/DIVISORE, tastieraN.height/DIVISORE);
    pos = new PVector(width-(dim.x)/2, height-(dim.y)/2);
  }
  
  
  /**
   * Disegna la tastiera con un messaggio bianchi o neri a seconda del valore
   * booleano blackKeyboard
   */
  public void draw(){
    imageMode(CENTER);
    
    if(blackKeyboard){
      image(tastieraN, pos.x, pos.y, dim.x, dim.y);
      fill(0,0,0);
    } else {
      image(tastieraB, pos.x, pos.y, dim.x, dim.y);
      fill(255,255,255);
    }
    
    textSize(18);
    textAlign(CENTER);
    text("Usa le frecce", pos.x, pos.y-30);
  }
}