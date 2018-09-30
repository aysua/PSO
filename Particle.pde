class Particle
{ 
  float posX;
  float posY;
  float velocityX;
  float velocityY;
  float speed=1;
  float myBestPosX=0;
  float myBestPosY=0;
  float C1=0.2;//Personal best effect
  float C2=0.6;//Global best effect
  float C3=1;//Previous velocity effect. If the value is big randomness is big
  Particle(float posx, float posy)
  {
    posX=posx;
    posY=posy;
  }
  void display()
  {
    ellipse(posX,posY,10,10);
  }
  
  void move(float desiredPosX,float desiredPosY)
  {
    float signX;
    float signY;
      signX=desiredPosX-posX;
      signY=desiredPosY-posY;
      if(signX!=0)
      {posX=posX+(speed*signX/abs(signX));}
      if(signY!=0)
      {posY=posY+(speed*signY/abs(signY));}
  }

  void compareMyBest(float desiredPosX,float desiredPosY)
  {
    float mydist= dist(posX,posY,desiredPosX, desiredPosY);
    float bestdist=dist(myBestPosX,myBestPosX,desiredPosX, desiredPosY);
    if(abs(mydist)<abs(bestdist))
    {
      myBestPosX=posX;
      myBestPosY=posY;
    }
  }
  void velocityFunction(float globalX, float globalY)
  {
    velocityX=(C3*velocityX)+(C1*(myBestPosX-posX))+(C2*(globalX-posX));
    velocityY=(C3*velocityY)+(C1*(myBestPosY-posY))+(C2*(globalY-posY));
    move(posX+velocityX, posY+velocityY);
  }
  
  void stop()
  {
    speed=0;
  }
  
  
}
