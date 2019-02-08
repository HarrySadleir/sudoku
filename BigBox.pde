class BigBox {
  int x;
  int y;
  int r;
  int c;
  Box[][] boxes;
  BigBox(int x, int y, int r, int c) {
    boxes = new Box[3][3];
    this.r = r;
    this.c = c;
    this.x = x;
    this.y = y;

    boolean willcountr = false;
    int countr = 0;
    for (int r1 = 0; r1 < grid.length; r1++) {

      int countc = 0;
      for (int c1 = 0; c1 < grid[r1].length; c1++) {

        if (r1 >= r*3 && r1 < r*3+3 && c1 >= c*3 && c1 < c*3+3) {

          boxes[countr][countc] = grid[r1][c1];
          countc++;
          willcountr = true;
        }
      }
      if (willcountr) {
        countr++;
      }
    }
  }

  void show() {
    stroke(0);
    strokeWeight(8);
    fill(255, 0);
    rect(x, y, w*3-2, w*3-2);
  }
}