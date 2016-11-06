class Scena{
  //Opacità per creare l'effetto sfumatura
  float opacityUscita = 0;
  //Booleano che segnala la terminazione dell'animazione
  boolean uscitaEffettuata = false;
  Stelle stars =  new Stelle();
  
  /**
   * Disegna le componenti su schermo
   */
  public void draw(){};
  
  
  /**
   * Permette di concludere la scena con una transizione a sfumatura
   */
  public void uscita(){
    fill(0,opacityUscita);
    stroke(0);
    rect(0,0,width,height);
    opacityUscita += opacityUscita < 255 ? 5 : 0;
    uscitaEffettuata = (opacityUscita >= 255);
  }
  
  
  /**
   * Restituisce il valore booleano relativo alla fine dell'animazione
   * @return true se l'animazione è completata, false altrimenti
   */
  public boolean uscitaCompletata(){
    return uscitaEffettuata;
  }
  
  
  /**
   * Disegna lo sfondo
   */
  public void background(){
    stars.draw();
  }
}