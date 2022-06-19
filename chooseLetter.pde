PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;

int maxHeight = 48;
int minHeight = 16;
int letterHeight = minHeight;
int letterWidth = 30;

int x = 0;
int y = 0;
int words = 1;
int lett = 1;

boolean changeletter;
boolean nextletter;
boolean newletter;              

int numChars = 42;
color[] colors = new color[numChars];

void setup()
{
  size(810, 480);
  noStroke();
  colorMode(HSB, numChars);
  background(numChars);
  for(int i = 0; i < numChars; i++)
  {
    colors[i] = color(i, numChars, numChars);    
  }
  
  img0 = loadImage("word1.png");
  img1 = loadImage("word2.png");
  img2 = loadImage("word3.png");
  img3 = loadImage("word4.png");
  img4 = loadImage("word5.png");
  img5 = loadImage("word6.png");
  img6 = loadImage("word7.png");
  img7 = loadImage("word8.png");
  
}

void draw()
{
  if(newletter == true)
  {
    if(changeletter == true)
    {
      if(words == 1)
      {
        image(img0, x, y, letterWidth, letterHeight);
        words = 2;
      }
       else if(words == 2)
      {
        image(img1, x, y, letterWidth, letterHeight);
        words = 3;
      }
       else if(words == 3)
      {
        image(img2, x, y, letterWidth, letterHeight);
        words = 4;
      }
      else if(words == 4)
      {
        image(img3,x, y, letterWidth, letterHeight);
        words = 5;
      }
      else if(words == 5)
      {
        image(img1, x, y, letterWidth, letterHeight);
        words = 6;
      }
      else if(words == 6)
      {
        image(img4, x, y, letterWidth, letterHeight);
        words = 7;
      }
      else if(words == 7)
      {
        image(img5, x, y, letterWidth, letterHeight);
        words = 8;
      }
      else if(words == 8)
      {
        image(img6, x, y, letterWidth, letterHeight);
        words = 9;
      }
      else if(words == 9)
      {
        image(img7, x, y, letterWidth, letterHeight);
        words = 10;
      }
      else if(words == 10)
      {
        image(img1, x, y, letterWidth, letterHeight);
        words = 11;
      }
      else if(words == 11)
      {
        image(img4, x, y, letterWidth, letterHeight);
        words = 1;
      }
      
      nextletter = true;
    }
    
    if (letterHeight == minHeight)
    {
      int y_pos;
      if(lett == 1)
      {
        y_pos = y;
        rect(x, y_pos, letterWidth, letterHeight);
      }
      else if(lett == 2)
     {
       y_pos = y + minHeight;
       rect(x, y_pos, letterWidth, letterHeight);
     }
     else if(lett == 3)
     {
       y_pos = y + 2*minHeight;
       rect(x, y_pos, letterWidth, letterHeight);
     }
    }
    
    newletter = false;
    changeletter = false;
  }
}

void keyPressed()
{

  if(key >= 'a' && key <= 'z')
  {
    int keyIndex;
    if(key == 'u' || key == 'j' || key == 'm')
    {
      lett = 2;
      keyIndex = key-'a';
      letterHeight = minHeight;
      fill(colors[keyIndex]);
    }
    
    else if(key == 'i'  || key == 'k' || key == 'o' || key == 'l' || key == 'p')
    {
      lett = 3;
      keyIndex = key-'a';
      letterHeight = minHeight;
      fill(colors[keyIndex]);
    }
    
    else
    {
      lett =1;
      keyIndex = key-'a';
      letterHeight = minHeight;
      fill(colors[keyIndex]);
    }
  }
  else if((key >= ',' && key <='0') || key == '8' || key =='9' || key == ';')
  {
    lett =3;
    int keyIndex;
    keyIndex = key-18;
    letterHeight = minHeight;
    fill(colors[keyIndex]);
  }
  else if(key == '1' || key == '2' || key =='5')
  {
    lett =1;
    int keyIndex;
    keyIndex = key-17;
    letterHeight = minHeight;
    fill(colors[keyIndex]);
  }
  
  else if((key >= '3' && key <= '7' && key != '5') || key == ' ')
  {
    letterHeight = maxHeight;
    changeletter = true;
  }
  
  if(nextletter == true)
  {
    x = ( x + letterWidth );
    nextletter = false;
  }
  newletter = true;

  if (x > width - letterWidth)
  {
    x = 0;
    y+= maxHeight;
  }
  
  if( y > height - letterHeight)
  {
    y = 0;
  }
}
