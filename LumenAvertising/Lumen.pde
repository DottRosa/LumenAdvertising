class Lumen extends Scena{
  PImage nave;
  //Messaggio da mostrate a video
  String mex = "I migliori ingegneri hanno dato vita a Lumen, un razzo in grado di raggiungere Marte in appena...";
  //Opacità per la sfumatura di entrata
  int opacity = 255;
  //Nuvole generate casualmente nello sfondo
  Nuvole[] nuvole = new Nuvole[2];
  //Variabile che tiene conto dell'istante temporale in cui ci si trova
  private int mill = 0;
  //Opacità rispettivamente del messaggio e della sfumatura d'uscita
  private int opacityMex=255, opacityDay=0;
  //Posizione della nave
  PVector pos;
  //Coordinata Y del sole
  float hSole = height+200;
  //Decibell dell'effetto sonoro della propulsione
  float db = -10;
  //Navicella della scena
  Navicella navicella;
  //Oggetti per la gestione del suono
  Minim minim;
  AudioPlayer song;
  //Affordance per comunicare all'utente come interagire con la scena
  Affordance aff;
  
  
  public Lumen(PImage nave){
    this.nave = nave;
    navicella = new Navicella(width/2, height/2, true);
    //Istanzio le nuvole
    for(int i=0; i<nuvole.length; i++){
      nuvole[i] = new Nuvole();
    }
    pos = new PVector(0,0);
    aff = new Affordance(true);
  }
  
  
  
  /**
   * Disegna le componenti su schermo
   */
  public void draw(){
    //Background della scena
    background();
    nuvole();
    
    //Primo testo
    fill(255, opacityMex);
    textSize(30);
    textAlign(CENTER);
    text(mex,100,40,width-200,200);
    if(mill == 0){
      mill = millis();
    }
    textSize(55);
    
    //Dopo 4 secondi il messaggio principale scompare per fare posto al secondario
    if(millis() - mill >= 4000 && millis() - mill < 7000){
      opacityMex -= 5;
      opacityDay += 5;
    }
    
    //Secondo testo
    fill(255, opacityDay);
    text("30 giorni", width/2, 100);
    //Gestione della posizione della nave
    
    navicella.draw();
    aff.draw();  //Affordance
    
    //Quando trascorrono più di 7 secondi il messaggio secondario sparisce
    if(millis() - mill >= 7000){
      opacityDay -= 5;
      db -= 0.1;  //Decremento i decibel dell'effetto sonoro
      navicella.decollo();  //La nave si sposta verso l'alto
      if(navicella.pos.y <= -nave.height)
        uscita();
    }
    
    fill(0,opacity);
    rect(0,0,width,height);
    opacity -= opacity > 0 ? 3 : 0;
    //Decibell dell'effetto sonoro
    song.shiftGain(db, 0.0, 10000);
  }
  
  
  /**
   * Sfumatura bianca d'uscita
   */
  public void uscita(){
    fill(255,opacityUscita);
    rect(0,0,width,height);
    opacityUscita+=5;
    uscitaEffettuata = (opacityUscita >= 255);
  }
  
  
  /**
   * Disegna lo sfondo composto da Stelle. Viene simulato il passaggio
   * da notte a giorno con la presenza del sole.
   */
  public void background(){
    stars.draw();
    sun();
    stars.alba();
  }
  
  
  /**
   * Disegna un sole
   */
  private void sun(){
    fill(255,255,0);
    ellipse(width/2,hSole,300,300);
    hSole -= 0.5;
  }
    
  
  
  /**
   * Disegna le nuvole sullo sfondo
   */
  private void nuvole(){
    for(int i=0; i<nuvole.length; i++){
      nuvole[i].draw();
      if(keyPressed){
        if(keyCode == UP){
          nuvole[i].setVelY(true);
        } else if(keyCode == DOWN){
          nuvole[i].setVelY(false);
        }
      }
    }
  }
  
  
  /**
   * Imposta Minim e fa partire il suono
   */
  public void startSong(Minim minim){
    this.minim = minim;
    song = minim.loadFile("rocket.mp3");
    song.play();
  }
  
  
  /**
   * Stoppa l'effetto sonoro
   */
  public void stopSong(){
    minim.stop();
  }
  
  
  public boolean neverStart(){
    return (song == null);
  }
}