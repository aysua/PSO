# PSO
First PSO Algoritm
int particleNumber=18;
Particle[] p=new Particle[particleNumber];
float[] distanceX=new float[particleNumber];
float[] distanceY=new float[particleNumber];
float[] preTargetX=new float[3];
float[] preTargetY=new float[2];
int count=0;
float globalBestX=width;
float globalBestY=height;

float targetX;
float targetY;

void setup()
{
  size(800,400);
  for(int i=0;i<particleNumber;i++){  
    p[i]=new Particle(random(300),random(300));
  }
}

void draw()
{
  targetX=mouseX;
  targetY=mouseY;
  background(100);
  ellipse(targetX, targetY,50,50);
  preTargetX[count]=targetX;
  preTargetY[count]=targetY;
  count++;
  if(count>=2)
  {
    count=0;
    if(abs(preTargetX[0]-preTargetX[1])>30)
    {      globalBestX=width;
      for(int i=0;i<particleNumber;i++)
      {  p[i].myBestPosX=0;      }
    }
    if(abs(preTargetY[0]-preTargetY[1])>30)
    {      globalBestY=height;   
      for(int i=0;i<particleNumber;i++)
        {  p[i].myBestPosY=0;      }
    }
  }
  for(int i=0;i<particleNumber;i++)
  {  
      globalBest();

     p[i].display();
     p[i].velocityFunction(globalBestX,globalBestY);
     p[i].compareMyBest(targetX,targetY);
     
    if((int(p[i].posX)>=targetX-1 && int(p[i].posX)<=targetX+1 )&& (int(p[i].posY)>=targetY-1 && int(p[i].posY)<=targetY+1 ))
    {      p[i].stop();    }
    else
    {      p[i].speed=1;    }
  }
}

void globalBest()
{
  for(int i=0;i<particleNumber;i++){  //Compares distance between target
    distanceX[i]=abs(p[i].posX-targetX);   
    distanceY[i]=abs(p[i].posY-targetY);   
  }
   
   float minimumX=min(distanceX);
   float minimumY=min(distanceY);

   int minElementX=0;
   int minElementY=0;
   
  for(int i=0;i<particleNumber;i++) //Finds the which element is min
  {
    if(distanceX[i]==minimumX)
    {minElementX=i;}
    if(distanceY[i]==minimumY)
    {minElementY=i;}
  }
    if(abs(globalBestX-targetX)>minimumX)//Previous distance vs current distance
    {      globalBestX=p[minElementX].posX;    }
    if(abs(globalBestY-targetY)>minimumY)//Previous distance vs current distance
    {      globalBestY=p[minElementY].posY;    }
       //   println(globalBestX+" "+targetX+" "+(globalBestX-targetX));
       //   println(globalBestY+" "+targetY+" "+(globalBestY-targetY));

}


