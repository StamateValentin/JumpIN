
void setGameTable(String[][] challenge){

  resetAutoSolving();

  for(int i = 4; i >= 0; i--){
    for(int j = 4; j >= 0; j--){
      tableArray[i][j] = challenge[i][j];
    }
  }

  boolean foxVerticalMoved = false;
  boolean foxHorizontalMoved = false;

  for(int i = 4; i >= 0; i--){
    for(int j = 4; j >= 0; j--){
      if(tableArray[i][j].equals("FV") && !foxVerticalMoved){
        moveFoxVertical(i, j);
        foxVerticalMoved = true;
      }

      if(tableArray[i][j].equals("FH") && !foxHorizontalMoved){
        moveFoxHorizontal(i, j);
        foxHorizontalMoved = true;
      }
    }
  }

  showHorizontalFox = foxHorizontalMoved;
  showVerticalFox = foxVerticalMoved;

}

void moveFoxVertical(int i, int j){
  coordonateFoxVI = convertCoordToY(j) - 40;
  coordonateFoxVJ =  convertCoordToX(i) - 25;
  fSecondI = j;
  fSecondJ = i;
}

void moveFoxHorizontal(int i, int j){
  coordonateFoxHI = convertCoordToY(i) + 8;
  coordonateFoxHJ =  convertCoordToX(j) - 70;
  fOneI = i + 1;
  fOneJ = j + 1;
}
