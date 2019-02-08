Box[][] grid = new Box[9][9];
BigBox[][] bigGrid = new BigBox[3][3];
int w;
int mode = 0;
String[] sudoku;

void setup() {
  size(600, 600);
  w = 600/9;

  textMode(CENTER);
  String[] sudoku = loadStrings("data/easySudoku" + int(random(0,1)) + ".txt");
  for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[r].length; c++) {
      grid[r][c] = new Box((c)*w, (r)*w, sudoku[r].charAt(c) - 48);
    }
  }

  for (int r = 0; r < bigGrid.length; r++) {
    for (int c = 0; c < bigGrid[r].length; c++) {
      bigGrid[r][c] = new BigBox(c*3*w, r*3*w, r, c);
    }
  }
}

void draw() {
   if(mode == 0) intro();
   if(mode == 1) playing();
   if(mode == 2) victory();

}
