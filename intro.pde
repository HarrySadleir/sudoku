void intro() {
  background(255);
  strokeWeight(5);
  
  fill(255);
  stroke(0);
  rect(200, 250, 200, 100);
  textSize(50);
  fill(0);
  text("play", 250, 310);
  
  textSize(70);
  
  text("SUDOKU", 163, 80);
  
  if(mousePressed && mouseX >=200 && mouseY >= 250 && mouseX<=400 && mouseY<= 350) mode = 1;
}
