class Box {
  int val;
  int c;
  int x;
  int y;

  boolean selected;
  boolean given = false;
  boolean error = false;
  Box(int x, int y) {
    val = 0;
    c = 255;
    this.x = x;
    this.y = y;
    selected = false;
  }
  
  Box(int x, int y, int val) {
    c = 255;
    this.x = x;
    this.y = y;
    this.val=val;
    println(val);
    if(val !=0) {
      given = true; 
    }
  }

  void show() {
    if (!error) {
      c = color(255);
    } else {
      c = color(255, 0, 0);
    }
    fill(c);
    if (selected) {
      stroke(0, 255, 0);
    } else {
      stroke(0);
    }
    strokeWeight(2);

    rect(x, y, w-2, w-2);

    if (val>=1) {
      textSize(50);
      fill(0);
      text(val, x+17, y+53);
    }
  }

  void check(int r, int c) {
    boolean temperror = false;

    if (this.val != 0) {
      for (Box b : grid[r]) {
        if (b != this) {
          if (b.val == this.val) {
            error = true;
            b.error = true;
            temperror = true;
          }
        }
      }

      for (int i = 0; i < 9; i++) {
        if (grid[i][c] !=this) {
          if (grid[i][c].val == this.val) {
            error = true;
            grid[i][c].error = true;
            temperror = true;
          }
        }
      }

      //index of the big box
      int r1 = r/3;
      int c1 = c/3;

      //looping through the bigbox
      for (int i = 0; i < 3; i ++) {
        for (int j = 0; j < 3; j++) {
          if (bigGrid[r1][c1].boxes[i][j] != this) { 
            if (bigGrid[r1][c1].boxes[i][j].val == this.val) {
              error = true;
              bigGrid[r1][c1].boxes[i][j].error = true;
              temperror = true;
            }
          }
        }
      }

      error = temperror;
    }
  }
}
