void startButton(){
  gameStart = true;
}

void exitButton(){
  gameStart = false;
}

void enterOptionButton(){
    options = true;
}

void exitOptionButton(){
  options = false;
}

void quitButton(){
   quit = true; 
}
//muta vulpile
void mouseDragged(){
 if(lockedFox){
   if(((mouseX - xOffset > 150+cellDistX*obstacolStanga+ 20) &&(mouseX - xOffset < height -200 -cellDistX*obstacolDreapta))){
     int tmp = coordonateFoxJ;
     coordonateFoxJ = mouseX - xOffset;
     //face update pozitiilor vulpii in matrice
     updateFoxPositions(tmp);
   }
 }else if(lockedFirstRabbit){
   if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -cellDistX ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width -60)){
      if(rabbitMoveUp){
        iFirstRabbit = mouseY - yOffset;
      }else if(rabbitMoveLeft){
         jFirstRabbit = mouseX - xOffset;
      }else{
        determinareDirectie();
      }
   }
 }else if(lockedSecondRabbit){
   if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -cellDistX ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width -60)){
      if(rabbitMoveUp){
        iSecondRabbit = mouseY - yOffset;
      }else if(rabbitMoveLeft){
         jSecondRabbit = mouseX - xOffset;
      }else{
        determinareDirectie();
      }
   }
 }else if(lockedThirdRabbit){
   if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -cellDistX ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width -60)){
      if(rabbitMoveUp){
        iThirdRabbit = mouseY - yOffset;
      }else if(rabbitMoveLeft){
         jThirdRabbit = mouseX - xOffset;
      }else{
        determinareDirectie();
      }
   }
 } 
}

void determinareDirectie(){
   float directie = directieMouse();
   if((directie < 0) || (directie == 90)){
       rabbitMoveUp = true;
   }else{
      rabbitMoveLeft = true; 
   }
}

void printArray(){
   for(int i = 0; i < 5; i++){
    for(int j = 0 ; j < 5; j++){
        print(tableArray[i][j] + " ");
    }
    println();
   }
}

void updateFoxPositions(int tmp){
   if(tmp > coordonateFoxJ){
       int i =  (coordonateFoxJ + 50 + 80)/cellDistX -1;
       if(tableArray[fOneI -1][i] == "F" && tableArray[fOneI -1][i-1] == "0"){
         tableArray[fOneI -1][i+1] = "0";
         tableArray[fOneI -1][i] = "F";
         tableArray[fOneI -1][i-1] = "F";
       }else{
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }
     }else{
       int i =  (coordonateFoxJ + 50 + 80)/cellDistX - 1;
       if(tableArray[fOneI -1][i] == "F" && tableArray[fOneI -1][i-2] == "F"){
         tableArray[fOneI -1][i-2] = "0";
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }else{
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }
       
     }
     printArray();
}

void mouseReleased(){
 lockedFox = false;
 lockedFirstRabbit = false;
 lockedSecondRabbit = false;
 lockedThirdRabbit = false;
 rabbitMoveUp = false;
 rabbitMoveLeft = false;
}


void determinaObstacolDreapta(){
   int j =  fOneJ -2;
   int i =  fOneI -1;
   while(j <= 4){
    if(tableArray[i][j] != "0"){
     obstacolDreapta = 5-(j); 
    }
    j++;
   }
}

void determinaObstacolStanga(){
   int j =  fOneJ -2;
   int i =  fOneI -1;
   while(j >=0 && obstacolStanga == 5 ){
    if(tableArray[i][j] != "0"){
     obstacolStanga = j+1; 
    }
    j--;
   }
   if(obstacolStanga == 5){
      obstacolStanga = 0; 
   }
}

float directieMouse(){
   float angle = atan2(mouseY - pmouseY,mouseX - pmouseX);
    println(degrees(angle));
   return degrees(angle);
}
