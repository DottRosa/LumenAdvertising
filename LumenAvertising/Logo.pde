class Logo extends Scena{
  //Immagini della scena
  PImage logo, nave;
  float dim = 525;
  //Opacità della scena
  int opacity = 255;
  //Messaggio da mostrare sotto il logo
  String mex = "L'universo sarà tuo";
  //Numero di ellipse per la propulsione del razzo
  final static int N_PROP = 200;
  //Particelle della propulsione del razzo
  Particle[] particelle = new Particle[N_PROP];
  //Vettore posizione del razzo
  PVector posNave;
  //Valore che determina l'ascesa della navicella
  private float up = height/4;
  //Affordance per comunicare all'utente come interagire con la scena
  private Affordance aff;
  
  
  
  public Logo(PImage nave){
    this.nave = nave;
    logo = loadImage("logo.png");
    posNave = new PVector(600, height);
    for(int i=0; i<N_PROP; i++){
      particelle[i] = new Particle(posNave.x+13, random(posNave.y+20, posNave.y+25), 5);
    }
    
    aff = new Affordance(false);
  }
  
  
  /**
   * Disegna la scena composta dal logo, da una scritta e dal razzo
   */
  public void draw(){
    imageMode(CENTER);
    background();
    image(logo, width-logo.width/2-40, height/2,dim,dim);  //Logo Lumen
    fill(255);
    textAlign(RIGHT);
    textSize(30);
    text(mex,180,height/2+80,300,200);  //Testo
    aff.draw();  //Affordance
    imageMode(CORNER);
    propulsione();  //Effetto particellare della propulsione
    navicella();  //Aggiorno la posizione della navicella
    fill(255,opacity);
    rect(0,0,width,height);
    opacity -= opacity>0?3:0;
  }
  
  
  /**
   * Aggiorna la posizione del razzo. La velocità varia con i tasti UP e DOWN.
   * Se il razzo esce dallo schermo, viene effettuata l'uscita dalla scena.
   */
  private void navicella(){
    image(nave,posNave.x, posNave.y,25,50);
    
    if(keyPressed){
      switch(keyCode){
        case UP : 
          up += up >= height ? 0 : 5;
          break;
        case DOWN :
          up -= up <= 0 ? 0 : 5;
          break;
      }
    }
    
    fill(255);
    posNave.y -= map(up, 0, height, 0.5, 2);
    if(posNave.y <= -30){
      uscita();
    }
  }
  
  
  /**
   * Disegna le particelle della propulsione, ne aggiorna la posizione di origine
   * e le opacizza man mano.
   */
  private void propulsione(){
    for(int i=0; i<N_PROP; i++){
      particelle[i].setStartPosition(posNave.x+13, random(posNave.y+20, posNave.y+25));
      particelle[i].display();
      particelle[i].opacizza();
    }
  }
  
  
  public float getPosition(){
    return posNave.y;
  }
}