class Stelle{
  //Numero di stelle nello sfondo
  private static final int N = 100;
  //Array di vettori posizione
  private PVector[] stars = new PVector[N];
  //Vettore di interi rappresentati l'opacità di ogni singolo punto
  private int[] opacity = new int[N];
  //Velocità di spostamento
  private PVector v;
  //Colore dello sfondo
  private float r = 0, g = 0, b = 0;
  
  
  public Stelle(){
    for(int i=0; i<N; i++){
      stars[i] = new PVector(random(0,width), random(0,height));
      opacity[i] = (int)random(1,255);
    }
    v = new PVector(0.5,0);
  }
  
  
  /**
   * Disegna uno sfondo con delle stelle
   */
  public void draw(){
    fill(r,g,b);
    stroke(0);
    rect(-1,-1,width,height);
    //Genero le stelle come punti di opacità variabile
    for(int i=0; i<N; i++){
      stroke(255, opacity[i]);
      point(stars[i].x, stars[i].y);
    }
    update();  //Aggiorno la velocità e posizione delle stelle
    endScreen();  //Verifico se le stelle sono uscite dallo schermo
    
  }
  
  /**
   * Aggiorno i vettori velocità e posizione. La velocità varia a seconda del
   * variare di mouseY
   */
  private void update(){
    //Aggiorno la velocità di ogni stella
    for(int i=0; i<N; i++){
      stars[i].add(v);
    }
    v = new PVector(0.5, map(mouseY, 0, height, -0.5, 0.5));
  }
  
  
  /**
   * Controllo della posizione di ogni punto. Se sfora lo schermo, questo viene spostato
   * dalla parte opposta
   */
  private void endScreen(){
    for(int i=0; i<N; i++){
      if(stars[i].x >= width){
        stars[i] = new PVector(0, random(0,height));
      } else if(stars[i].y >= height){
        stars[i] = new PVector(random(0, width), 0);
      } else if(stars[i].y <= 0){
        stars[i] = new PVector(random(0, width), height);
      }
    }
  }
  
  
  
  /**
   * Utilizzo dei colori per simulare il sorgere del sole
   */
  public void alba(){
    if(r < 200)
      r+=0.7;
    g+=0.5;
    b+=0.5;
  }
}