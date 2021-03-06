import java.util.ArrayList;
import java.util.List;
import processing.sound.*;

void setup(){
  size(800, 850);
  frameRate(60);
  background(gameMenuColor);

  initializeStrings();
  loadFiles();
  loadAssets();

  InitializeIntroAnimation();

  rectMode(CENTER);
  textAlign(CENTER);
  shapeMode(CENTER);
  imageMode(CENTER);

  backgroundMusic = new SoundFile(this, "./Music/bckMusic1.wav");
  backgroundMusic.loop();
  click = new SoundFile(this, "./Music/Click.mp3");


  setGameTable(challengeSixTable);
  Challenge = 6;

  countRabbitsBegining();

  if(frameCount == 300){
    //drawPossibleMoves(2, 3);
  }

}


void draw(){

   if(gameStart == true){
    background(gameBkgColor);

    drawTable();
    drawNextMoves();

    drawPositions();
    drawFoxes();

    drawGameMenu();
    drawGameButtons();

    drawTimer();

    checkSelected();

    if(undo.size() > 0 && !levelSolving){
      drawUndo();
    }

    if(!levelSolving){
      drawSolve();
    }

    resetLevels = true;

  }else if(gameFinished){
    println(Challenge + " Challenge");
    background(gameBkgColor);
    text(winningLevel + score + end,height/2, 200);
    if(randomLevelsIn == false){
      if(Challenge < 9){
        drawButton(300,350, 150,100,normalBtnColor2, optionsExitString);
        drawButton(500,350, 150,100,normalBtnColor2, nextLevel);
      }else if(Challenge == 9){
         drawButton(425,350, 150,100,normalBtnColor2, optionsExitString);
      }
    }else{ 
     if(randomLevels.size() >= 1){
      drawButton(300,350, 150,100,normalBtnColor2, optionsExitString);
        drawButton(500,350, 150,100,normalBtnColor2, nextLevel);
     }else if(randomLevels.size() == 0){
         drawButton(425,350, 150,100,normalBtnColor2, optionsExitString);
     }
    }
  }else if (options == true){
    background(gameBkgColor);
    drawFlags();
    drawMusicButtons();
    drawButtonIesireOption();
    drawDarkModeButton();

  } else if (selectLevel == true){
    drawSelectLevels();

  } else if (instructions == true){
    drawInstructions();

  } else if(quit == true){
    exit();
  } else {
    countRabbitsBegining();
    drawIntroAnimation();
    drawStartMenu();
    if(resetLevels){
      resetTable();
      emptyList();
      levelSolving = false;
      resetLevels = false;
    }
  }

  int oneSecond = 60;

  if(levelSolving){
    if(frameCount % oneSecond == 0){
      if(undo.size() > 0){
        pressedUndo();

      } else{
        autoSolve(tableArray, Challenge);
      }
    }
  }


  if(frameCount == 300){
    //drawPossibleMoves(2, 3);
  }

}
