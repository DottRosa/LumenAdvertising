class Nuvole{
  //Vettori di velocità e posizione
  PVector vel, pos;
  PImage nuvola;
  //URI dell'immagine da caricare, due possibili scelte
  String path;
  
  float velY = 0; 
  
  
  public Nuvole(){
    vel= new PVector(0,1);
    pos = new PVector(random(width), random(height));
    path = "nuvola"+((int)random(1,3))+".png";  //Scelgo un'immagine a caso
    nuvola =  loadImage(path);
  }
  
  
  /**
   * Disegna le nuvole su schermo
   */
  public void draw(){
    image(nuvola, pos.x, pos.y, 100, 50);
    update();  //Aggiorno la posizione e la velocità
    bordo();   //Se esce dallo schermo, viene ricreata una nuova nuvola
  }
  
  
  /**
   * Aggiorna i vettori velocità e posizione. La velocità varia a seconda
   * del mouseY
   */
  private void update(){
    PVector aggiunta = new PVector(0,velY); 
    pos.add(vel.add(aggiunta));
  }
  
  
  /**
   * Controlla se le nuvole escono dallo schermo. Se accade vengono
   * ridefinite le posizioni spaziali, la velocità e l'immagine da caricare.
   */
  public void bordo(){
    if(pos.y >= height){
      pos.x = random(width);
      pos.y = random(-50,-5);
      vel.x = random(-0.2, 0.2);
      vel.y = random(1,1.5);
      path = "nuvola"+((int)random(1,3))+".png";
      nuvola =  loadImage(path);
    }
  }
  
  
  public void setVelY(boolean up){
    if(up){
      velY += velY >= 3 ? 0 : 0.1;
    } else {
      velY = velY <= 0 ? 0 : velY-0.1;
    }
  }
}