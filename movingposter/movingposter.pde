int posterBackground = 255;
int textId = 1;
float actorX;              
float actorY;              
float eyeW;                
float eyeH;                
float margin;              
float gutter;              
                           
Eye eye1;                  
Eye eye2;                  
Eye eye3;                  
Eye eye4;                  
Eye eye5;                  
Eye eye6;                  
Eye eye7;                  
Eye eye8;                  
Eye eye9;                  
                           
Text text;                 
                           
void setup() {             
  fullScreen(2);          
  setupScreen();           
  shapeMode(CENTER);       
  setupOpenCV();           
  eyeW = width * 0.25;     
  eyeH = width * 0.25;     
  margin = width * 0.05;   
  gutter = width * 0.075;  
                           
  eye1 = new Eye(eyeW * 0.5 + margin, eyeH * 0.5 + margin, eyeW, eyeH);
  eye2 = new Eye(eyeW * 1.5 + margin + gutter, eyeH * 0.5 + margin, eyeW, eyeH);
  eye3 = new Eye(eyeW * 2.5 + margin + gutter * 2, eyeH * 0.5 + margin, eyeW, eyeH);
  eye4 = new Eye(eyeW * 0.5 + margin, eyeH * 1.5 + margin + gutter, eyeW, eyeH);
  eye5 = new Eye(eyeW * 1.5 + margin + gutter, eyeH * 1.5 + margin + gutter, eyeW, eyeH);
  eye6 = new Eye(eyeW * 2.5 + margin + gutter * 2, eyeH * 1.5 + margin + gutter, eyeW, eyeH);
  eye7 = new Eye(eyeW * 0.5 + margin, eyeH * 2.5 + margin + gutter * 2, eyeW, eyeH);
  eye8 = new Eye(eyeW * 1.5 + margin + gutter, eyeH * 2.5 + margin + gutter * 2, eyeW, eyeH);
  eye9 = new Eye(eyeW * 2.5 + margin + gutter * 2, eyeH * 2.5 + margin + gutter * 2, eyeW, eyeH);
                          
  text = new Text(width / 2, height * 0.9);
};                        
                          
void draw() {             
  background(posterBackground);
                          
  eye1.setActorPos(heapPoint.x, heapPoint.y);
  eye2.setActorPos(heapPoint.x, heapPoint.y);
  eye3.setActorPos(heapPoint.x, heapPoint.y);
  eye4.setActorPos(heapPoint.x, heapPoint.y);
  eye5.setActorPos(heapPoint.x, heapPoint.y);
  eye6.setActorPos(heapPoint.x, heapPoint.y);
  eye7.setActorPos(heapPoint.x, heapPoint.y);
  eye8.setActorPos(heapPoint.x, heapPoint.y);
  eye9.setActorPos(heapPoint.x, heapPoint.y);
                          
  eye1.draw();            
  eye2.draw();            
  eye3.draw();            
  eye4.draw();            
  eye5.draw();            
  eye6.draw();            
  eye7.draw();            
  eye8.draw();            
  eye9.draw();            
                          
  eye1.move();            
  eye2.move();            
  eye3.move();            
  eye4.move();            
  eye5.move();            
  eye6.move();            
  eye7.move();            
  eye8.move();            
  eye9.move();            
                          
  text.draw(textId);            
  PVector heapPoint = faceLocation();
  if (faces.length > 0) {
    textId = 2;
  } else {
    textId = 1;
  }
};                        
