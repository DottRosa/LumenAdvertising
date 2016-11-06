class Marte extends Scena{
  PImage mars;
  //Opacità della sfumatura iniziale
  float opacityMars = 255;
  //Opacità del messaggio
  float opacityMex = 0;
  //Messaggio per il text
  String mex = "Marte è il quarto pianeta del\nsistema solare, distante 56\nmilioni di kilometri dalla Terra";
  //Lunghezza di partenza della sottostringa di mex
  float mexLength = 1;
  
  
  public Marte(PImage mars){
    this.mars = mars;
  }
  
  
  /**
   * Disegna le componenti su schermo
   */
  public void draw(){
    background();
    stroke(0);
    image(mars, -100, 200, 500, 500);  //Immagine di Marte
    fill(0,opacityMars);
    rect(0,0,width,height);  //Rettangolo per la sfumatura di entrata
    //Riduco l'opacità, altrimenti visualizzo il messaggio
    if(opacityMars > 0){  
      opacityMars -= 2;
    } else {
      fill(255);
      textSize(25);
      text(mex.substring(0,(int)mexLength),410,200,350,200);
      if(mexLength < mex.length()){
        mexLength += 0.35;
      }
    }
  }
}