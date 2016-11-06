class TerraMarte extends Scena{
  PImage earth, mars;
  //Dimensione delle immagini
  int dim = 100;
  //Messaggio mostrato a video
  String mex = "Nei periodi di massimo avvicinamento sono necessari 254 giorni per raggiungere il pianeta rosso";
  //Variabile per il conteggio dei giorni, da 0 a 254
  int days = 0;
  //Opacità per la sfumatura d'entrata
  float opacity = 255;
  //Vettori posizione per le due immagini
  PVector posEarth, posMars;
  
  
  
  public TerraMarte(PImage mars, PImage earth){
    this.mars = mars;
    this.earth = earth;
    posEarth = new PVector(width/5+dim/2, height/2+dim/2);
    posMars = new PVector(width-265+dim/2, height/2+dim/2);
  }
  
  
  /**
   * Disegna le componenti su schermo
   */
  public void draw(){
    background();
    fill(255);
    
    //Dispongo la scritta
    textSize(30);
    textAlign(CENTER);
    text(mex,25,100,width-50,100);
    
    //Dispongo le immagini in base al loro centro
    imageMode(CENTER);
    image(earth, posEarth.x, posEarth.y, dim, dim);
    image(mars, posMars.x, posMars.y, dim, dim);
    stroke(255);
    
    //Imposto la linea di collegamento tra Terra e Marte
    stroke(255);
    line(width/5+dim, height/2+dim/2, width/5+dim+(map(days, 0, 254, 0, /*(4*width-1820)/5))*/posMars.x-posEarth.x-dim)), height/2+dim/2);
    
    //Incremento dei valori di giorno e kilometri
    text(days+" giorni", width/2-dim, 310, 200, 50);
    text(((int)map(days, 0, 254, 0, 56))+" milioni di km", width/2-dim, 360, 200, 50);
    days = days >= 254 ? 254 : days+2;
    noStroke();
    fill(0,opacity);
    rect(0,0,width,height);
    opacity -= opacity > 0 ? 10 : 0;
  }
}