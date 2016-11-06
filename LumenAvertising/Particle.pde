class Particle{
  //Vettori posizione e velocità
  private PVector pos, velocity;
  //Diametro della particella
  private int diameter;
  //Colore della particella
  private color c;
  //Possibili colori applicabili alla particella
  private final color[] colori = {
    color(255,0,0),   //Rosso
    color(240,154,0), //Arancione 
    color(255,255,0)  //Giallo
  };
  //Indice scelto casualmente per applicare uno dei colori
  private int indexColor;
  //Coordinate spaziali dell'origine della particella
  private float xStart=width/2, yStart=height/2;
  //Opacità della particella
  private float opacity = 100;
  
  private float velY = 0;
  
  /**
   * Costruttore che genera una particella nella posizione (x,y) con diametro 
   * pari a diameter
   */
  public Particle(float x, float y, int diameter){
    this.pos = new PVector(x,y);
    this.velocity = new PVector(random(-0.2, 0.2), random(1,1.5));
    this.diameter = diameter;
    indexColor = (int)random(0,colori.length);  //Scelgo un indice a caso tra i colori
  }
  
  
  /**
   * Disegna una particella
   */
  public void display(){
    fill(colori[indexColor], opacity);
    noStroke();
    pushMatrix();
    ellipse(pos.x, pos.y, diameter, diameter+10);
    popMatrix();
    update();  //Aggiorno la posizione e la velocità
    bordo();  //Verifico se la particella esce dallo schermo
  }
  
  
  /**
   * Aggiorna il valore "opacity" della particella, riducendolo
   */
  public void opacizza(){
    opacity -= 5;
  }
  
  
  /**
   * Aggiorna i vettori velocità e posizione. La velocità varia
   * al variare della posizione del mouseY
   */
  public void update(){
    PVector aggiunta = new PVector(0,velY);
    pos.add(velocity.add(aggiunta));
  }
  
  
  /**
   * Verifica se la particella esce dallo schermo. Se accade vengono
   * aggiornate la sua posizione, velocità e opacità
   */
  public void bordo(){
    if(pos.y >= height){
      pos.x = xStart;
      pos.y = yStart;
      velocity.x = random(-0.2, 0.2);
      velocity.y = random(1,1.5);
      opacity = 100;
    }
  }
  
  
  /**
   * Setta la nuova posizione di origine della particella
   */
  public void setStartPosition(float x, float y){
    xStart = x;
    yStart = y;
  }
  
  
  public void setVelY(boolean up){
    if(up){
      velY += velY >= 3 ? 0 : random(0.1, 0.5);
      velY = velY > 3 ? 3 : velY;
    } else {
      velY -= velY <= 0 ? 0 : random(0.1, 0.5);
      velY = velY < 0 ? 0 : velY;
    }
  }
}