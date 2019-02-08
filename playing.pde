void playing() {
  for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[r].length; c++) {
      grid[r][c].show();
    }
  }

  for (int r = 0; r < bigGrid.length; r++) {
    for (int c = 0; c < bigGrid[r].length; c++) {
      bigGrid[r][c].show();
    }
  }
  
  if(hasWon()) {
    mode = 2;
  }
}

void mousePressed() {
  if (mode == 1) {
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        grid[r][c].selected = false;
      }
    }


    if (mouseY/w < 9 && mouseX/w < 9 && !grid[mouseY/w][mouseX/w].given) {
      grid[mouseY/w][mouseX/w].selected = true;
    }
  }
}

void keyPressed() {
  if (mode == 1) {
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {

        if (grid[r][c].selected) {

          if (int(key) >= 49 && int(key) <= 57) {
            grid[r][c].val = key-48;

            for (int r1 = 0; r1 < 9; r1++) {
              for (int c1 = 0; c1 < 9; c1++) {
                grid[r1][c1].check(r1, c1);
              }
            }
          }
        }
      }
    }
  }
}

boolean hasWon() {

  boolean won = true;
  for (int r1 = 0; r1 < 9; r1++) {
    for (int c1 = 0; c1 < 9; c1++) {
      if (grid[r1][c1].error == true || grid[r1][c1].val == 0) {
        won = false;
      }
    }
  }

  return won;
}
