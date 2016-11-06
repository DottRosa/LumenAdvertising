class Navicella{
  PImage nave;
  PVector pos, forza, transPos;
  //Numero di ellipse utilizzati nell'animazione di propulsione
  final static int N_PROP = 200;
  //Array di particelle che simulano la propulsione del razzo
  Particle[] particelle = new Particle[N_PROP];
  
  float angle = 0;
  
  boolean orizontal;
  
  
  public Navicella(float x, float y, boolean orizontal){
    nave = loadImage("razzo.png");
    this.orizontal = orizontal;
    pos = new PVector(0,0);
    forza = new PVector(0,0);
    transPos = new PVector(x,y);
    for(int i=0; i<N_PROP; i++){
      particelle[i] = new Particle(width/2, (int)random(height/2, height), 30);
    }
  }
  
  
  public void draw(){
    propulsione();
    pushMatrix();
    translate(transPos.x+tan(angle),transPos.y+tan(angle));
    rotate(angle);
    imageMode(CENTER);
    image(nave, pos.x, pos.y, 120, 220);
    if (orizontal && keyPressed){
      switch(keyCode){
        case RIGHT :
           pos.x += pos.x >= width/2-nave.width/2 ? 0 : 5;
           updateAngolo(keyCode);
           break;
        case LEFT : 
           pos.x -= pos.x <= -width/2+nave.width/2 ? 0 : 5;
           updateAngolo(keyCode);
           break;
      }
    }
    updateAngolo(0);
    popMatrix();
  }
  
  
  private void updateAngolo(int tasto){
    if(tasto == RIGHT){
      angle += angle >= 0.1 ? 0 : 0.005;
    } else if(tasto == LEFT){
      angle -= angle <= -0.1 ? 0 : 0.005;
    } else if(angle!=0){
      angle += angle != 0 ? (angle < 0 ? 0.003 : -0.003) : 0;
    }
    
  }
  
  
  /**
   * Sposta la nave verticalmente
   */
  private void decollo(){
    pos.y -= 2;  
  }
  
  
  /**
   * Disegna la propulsione del razzo
   */
  private void propulsione(){
    for(int i=0; i<N_PROP; i++){
      particelle[i].display();
      particelle[i].setStartPosition(pos.x+width/2+sin(angle*10), pos.y+height/2+110-cos(angle*10));
      if(keyPressed){
        if(keyCode == UP){
          particelle[i].setVelY(true);
        } else if(keyCode == DOWN){
          particelle[i].setVelY(false);
        }
      }
    }
  }
  
  
  public void setCoord(float x, float y){
    pos.x = x;
    pos.y = y;
  }
  
  
}
  