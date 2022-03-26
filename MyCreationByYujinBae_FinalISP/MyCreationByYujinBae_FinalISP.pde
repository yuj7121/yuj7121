//Name:Yujin Bae
//Date: May 20th, 2020
//Teacher: Ms. Basaraba
/*Describtion: This is the first draft for the Final Project(ISP). 
First, the intro with the title will be run for a few moments,
and then the first scene, where the rabbit is kidnapped by the fox. 
Then in the second scene, the squirrel will tell the hippo where the fox lives, 
followed by the third scene where the hippo goes to thee fox's house with the squirrel's help, 
and then the fourth scene where the hippo recue the rabbit from the fox. 
The animation will end with the ending credit with my name. 
*/


//declaration section
float squirrelX = 0;
float squirrelY = 380;
float hippoX = -100;
float hippoY = 320;
float rabbitX = 1000;
float rabbitY = 350;
float foxX = 1200;
float foxY = 330;
int scene = 0;
boolean stay = true; //for the first scene when the fox snatches the rabbit
boolean jumpUp = true; //for when the fox jumps up
float foxJump = 6; //the height of the fox as it jumps
float squirrelJump = -3; //the height at whihc the squirrel jumps
int squirrelTalk = 240; //the time for the squirrel to explains where the fox lives
int squirrelAndHippo = 3; //the variable for the squirrel and hippo to move toward the fox's house
int foxMove = 0; //the variable for the movement of the fox towards its house
int hippoStay = 100; //the variable for the hippo to stare angryly at the fox before attacking
int hippoMove = 0; //the variable used for the hippo to attack the fox
int rabbitJumpDown = 0; //the variable for the rabbit to jump down from the fox
int rabbitRun = 0; //the varable for the rabbit to run away after the fox falls
int squirrelGo = 0; //the variable for the squirrel to go with the hippo and the rabbit
int endingCircle = 2000; //the black circle for cartoon style ending
int credit = 300; //variable to mkae the ending credits move

//setup
void setup() {
  size(800, 500);
}

//the first background with a tree and grass
void background1() {
  //the sky
  stroke(#89F2FF);
  strokeWeight(1000);
  line(0, 0, 800, 0);
  //the grass
  stroke(#98FF89);
  strokeWeight(200);
  ellipse(400, 500, 1000, 100);
  //the leaves
  strokeWeight(100);
  stroke(#02DB36);
  ellipse(75, 200, 100, 100);
  //the tree trunk
  stroke(#864A00);
  strokeWeight(50);
  rect(75, 250, 1, 120);
  //right branch
  strokeWeight(20);
  for (int x=150; x>75; x-=20) {
    triangle(x, 275-x/5*2, 50, 225, 100, 250);
  }
  //left branch
  for (int x=25; x<=99; x+=20) {
    triangle(x, x+150, 50, 250, 100, 250);
  }
  //middle branch
  for (int x= 167; x<250; x+=20) {
    triangle(75, x, 50, 250, 100, 250);
  }
  //the sun
  stroke(#F6FF00);
  strokeWeight(100);
  ellipse(800, 0, 100, 100);
}

//the second background with the fox's house
void background2() {
  //the sky
  stroke(#5293FF);
  strokeWeight(1000);
  line(0, 0, 800, 0);
  //the grass
  stroke(#3DCE00);
  strokeWeight(200);
  ellipse(400, 550, 1000, 50);
  //the sun
  stroke(#FFD500);
  strokeWeight(100);
  ellipse(800, 0, 100, 100);
  //the roof of the fox's house
  strokeWeight(100);
  stroke(#FF6403);
  triangle(150, 190, 200, 140, 250, 190);
  //the bricks of the fox's house
  stroke(#000698);
  rect(130, 290, 140, 100);
}

//the squirrel
void squirrel() {
  stroke(0);
  strokeWeight(1);
  fill(#D87000);
  ellipse(squirrelX, squirrelY-35, 50, 70 ); //the body
  triangle(squirrelX+28, squirrelY-20, squirrelX+19, squirrelY-42, squirrelX+29, squirrelY-40);
  pushMatrix();
  fill(#ED8700);
  translate(squirrelX-20, squirrelY-50);
  rotate(radians(-45));//rotates the tail
  translate(-squirrelX+20, -squirrelY+50);
  arc(squirrelX-40, squirrelY-70, 60, 70, PI+HALF_PI, TWO_PI+HALF_PI); //upper tail
  arc(squirrelX-40, squirrelY-40, 50, 60, HALF_PI, PI+HALF_PI); //lower tail
  fill(255);
  noStroke();
  arc(squirrelX-40, squirrelY-40, 30, 40, HALF_PI, PI+HALF_PI); //lower tail
  arc(squirrelX-40, squirrelY-70, 30, 50, PI+HALF_PI, TWO_PI+HALF_PI); //upper tail
  stroke(0);
  strokeWeight(1);
  line(squirrelX-40, squirrelY-70, squirrelX-40, squirrelY-105); //upper outline
  popMatrix();
  fill(#FFA340);
  triangle(squirrelX-5, squirrelY-95, squirrelX+15, squirrelY-90, squirrelX, squirrelY-70); //ear
  ellipse(squirrelX+15, squirrelY-70, 40, 40);//the head
  fill(255);
  rect(squirrelX+31, squirrelY-67, 5, 13); //tooth
  strokeWeight(5);
  point(squirrelX+23, squirrelY-72);//eye
}

//the hippo
void hippo() {
  strokeWeight(1);
  stroke(0);
  fill(#A293A7);
  //tail
  triangle(hippoX-100, hippoY-13, hippoX-110, hippoY+20, hippoX-100, hippoY+10);
  //body
  rect(hippoX-100, hippoY-15, 120, 60);
  //legs
  arc(hippoX-90, hippoY+44, 20, 30, 0, PI);//the far left
  arc(hippoX-60, hippoY+44, 20, 30, 0, PI);//the middle left
  arc(hippoX-20, hippoY+44, 20, 30, 0, PI);//the middle right
  arc(hippoX+10, hippoY+44, 20, 30, 0, PI);//the far right
  fill(#BEA8C6);
  //head
  ellipse(hippoX, hippoY, 80, 80);
  //ears
  arc(hippoX-26, hippoY-28, 20, 20, radians(126), radians(330));//left ear
  arc(hippoX+27, hippoY-28, 20, 20, radians(220), radians(420));//right ear
  //nose
  noFill();
  arc(hippoX-7, hippoY+9, 5, 7, PI, TWO_PI);
  arc(hippoX+7, hippoY+9, 5, 7, PI, TWO_PI);
  //eyes
  strokeWeight(5);
  point(hippoX-20, hippoY-10);
  point(hippoX+20, hippoY-10);
}

//the rabbit
void rabbit() {
  strokeWeight(1);
  //body
  fill(#F0DAE4);
  arc(rabbitX, rabbitY, 40, 50, radians(-90), radians(170));
  //arm
  triangle(rabbitX, rabbitY, rabbitX-2, rabbitY-20, rabbitX-25, rabbitY+7);
  //head
  fill(#FFE8F3);
  ellipse(rabbitX-5, rabbitY-35, 30, 30);
  //ears
  ellipse(rabbitX+3, rabbitY-60, 10, 30);
  fill(#FFB7DA);
  noStroke();
  ellipse(rabbitX+3, rabbitY-60, 5, 20);
  pushMatrix();
  translate(rabbitX+3, rabbitY-45);
  rotate(radians(40));
  translate(-rabbitX-3, -rabbitY+45);
  fill(#FFE8F3);
  stroke(0);
  ellipse(rabbitX+3, rabbitY-60, 10, 30);
  fill(#FFB7DA);
  noStroke();
  ellipse(rabbitX+3, rabbitY-60, 5, 20);
  popMatrix();
  //tooth
  stroke(0);
  fill(255);
  rect(rabbitX-22, rabbitY-35, 4, 15);
  //eye
  strokeWeight(5);
  point(rabbitX-13, rabbitY-37);
}

//the fox
void fox() {
  strokeWeight(1);
  //legs
  fill(#742700);
  rect(foxX-80, foxY, 15, 50);  
  rect(foxX+40, foxY, 15, 60);  
  //tail
  fill(#FF5500);
  pushMatrix();
  translate(foxX+80, foxY);
  rotate(radians(20));
  translate(-foxX-80, -foxY);
  ellipse(foxX+80, foxY, 80, 30);
  fill(255);
  arc(foxX+80, foxY, 80, 30, PI+HALF_PI, TWO_PI+HALF_PI);
  popMatrix();
  //body
  fill(#FF5500);
  ellipse(foxX-10, foxY, 140, 70);
  fill(255);
  //neck
  arc(foxX-70, foxY-10, 30, 40, radians(80), radians(300));
  //ears
  fill(#FF5500);
  triangle(foxX-55, foxY-80, foxX-70, foxY-60, foxX-50, foxY-50);
  fill(255);
  triangle(foxX-56, foxY-74, foxX-65, foxY-60, foxX-55, foxY-50);
  //head
  fill(#FF5500);
  ellipse(foxX-70, foxY-40, 50, 50);
  fill(255);
  triangle(foxX-120, foxY-30, foxX-80, foxY-15, foxX-60, foxY-45);
  fill(#FF5500);
  noStroke();
  //the orange stripe
  triangle(foxX-120, foxY-30, foxX-60, foxY-30, foxX-60, foxY-45);
  ellipse(foxX-70, foxY-45, 40, 30);
  //eye
  stroke(0);
  strokeWeight(5);
  point(foxX-80, foxY-47);
}

//the intro
void intro() {
  background(#DDFFB7);
  PFont berline = loadFont("BerlinSansFBDemi-Bold-48.vlw");
  textFont(berline);
  textSize(90);
  textAlign(CENTER);
  fill(#7700F0);
  text("The Story of \n tiny Hippo", 400, 200);
  frameRate(0.4);
}

//the first scene where the rabbit gets kidnapped by the fox
void scene1() {
  frameRate(60);
  background1();
  squirrel();
  hippo();
  rabbit();
  fox();
  //the squirrel appears to the screen and climb the tree
  if (squirrelX <= 50){
    squirrelX+=2;
  } else if (squirrelY >=220){
    squirrelY-=3;
  } else if (squirrelX <=150){
    squirrelX+=2;
  }
  //the hippo, rabbit, and the squirrel appears to the screen
  if (hippoX <= 300){
    hippoX+=2;
    rabbitX-=3;
  //the fox runs towards the rabbit
  } else if (foxX>=500) {
    foxX-=3;
  } else if (stay == true){ //the rabbit is suprised
    //the suprised sign
    strokeWeight(2);
    noFill();
    beginShape();
    vertex(390, 290);
    vertex(385, 280);
    vertex(380, 300);
    vertex(365, 290);
    vertex(370, 310);
    endShape();
    frameRate(1);
    stay=false;
  } else if (jumpUp==true && rabbitX>=200){
    rabbitX-=6; //the fox jumps up ubove the hippo
    foxX-=6;
    rabbitY-=foxJump;
    foxY-=foxJump;
    foxJump-=0.2;
  } else{ //the fox lands down, and runs off the screen
    rabbitX-=6;
    foxX-=6;
    rabbitY+=2;
    foxY+=2;
    jumpUp=false;
  }
  if (foxX<=-1200){
  scene++;
  }
}

//the second scene where the squirrel tells the hippo where the fox lives
void scene2() {
  background1();
  squirrel();
  hippo();
  //the squirrel's speech bubble
  if (squirrelTalk>=0){
    stroke(255);
    strokeWeight(5);
    beginShape();
    vertex(182, 105);
    vertex(182, 112);
    vertex(190, 102);
    endShape();
    strokeWeight(50);
    for (int x=180; x>=50; x-=50){
      ellipse(280, 70, x, (x-50)/2);
    }
    stroke(0);
    strokeWeight(2);
    beginShape();
    vertex(180, 100);
    vertex(180, 120);
    vertex(190, 107);
    endShape();
    ellipse(280, 70, 230, 115);
    pushMatrix();
    scale(0.2, 0.2);
    foxX = 1000;
    foxY = 330;
    fox();
    popMatrix();
    //the roof of the fox's house
    strokeWeight(10);
    stroke(#FF6403);
    triangle(245, 50, 260, 40, 275, 50);
    //the bricks of the fox's house
    stroke(#000698);
    strokeWeight(10);
    rect(245, 60, 30, 40);
    rect(255, 70, 10, 20);
    stroke(0);
    triangle(355, 55, 375, 70, 355, 85);
    rect(315, 65, 50, 10);
    squirrelTalk--;
  } else if (squirrelX<=490 && squirrelTalk <= 0){
    //the squirrel jumps down from the tree
    squirrelX += 7;
    squirrelY += squirrelJump;
    squirrelJump+=0.25;
  } else {
    //the squirrel and the hippo runs off to the fox's house
    squirrelX+=5;
    hippoX+=5;
  }
  if (hippoX>=1600){
    //once the hippo and th squirrel is off the screen, the animation proceeds to the next scene. 
    scene++;
  }
}

//the third scene where the hippo runs to the foxe's house and faces the fox
void scene3() {
  background2();
  squirrelX = -250 + squirrelAndHippo;
  squirrelY = 450;
  hippoX = -100 + squirrelAndHippo;
  hippoY = 400;
  foxX = 1200-foxMove;
  foxY = 400;
  rabbitX = 1090-foxMove;
  rabbitY = 400;
  squirrel();
  rabbit();
  fox();
  hippo();
  //the squirrel and the hippo arrive at the fox's house
  if (squirrelAndHippo<=350){
    squirrelAndHippo+=2;
  } else if (foxMove <= 600){
    //the fox comes to its house with the rabbit
    foxMove += 4;
  } else {
    scene++;
  }
}

//the fourth scene where the hippo rescue the rabbit
void scene4() {
  background2();
  squirrelX = 101-squirrelGo;
  squirrelY = 450;
  hippoX = 251 + hippoMove;
  hippoY = 400;
  foxX = 600;
  foxY = 400;
  rabbitX = 490-rabbitRun;
  rabbitY = 400+rabbitJumpDown;
  rabbit();
  strokeWeight(3);
  //the fox should only fall after it is attacked by the hippo
  if (hippoMove>=310 || rabbitJumpDown!=0){
    //the fox is still unconcious
    pushMatrix();
    translate(foxX, foxY+50);
    rotate(radians(140));
    translate(-foxX, -foxY);
    fox();
    popMatrix();
    //the fox's closed eye
    strokeWeight(3);
    line(foxX+98, foxY+37, foxX+84, foxY+32);
    line(foxX+98, foxY+32, foxX+84, foxY+37);
  } else {
    fox();
  }
  if (hippoStay>=0){
    //a delay before the hippo attacks the fox
    hippo();
    hippoStay--;
  } else if (hippoMove<=310 && rabbitY==400){
    //the hippo attacks the fox!
    hippo();
    hippoMove+=8;
  } else if (rabbitJumpDown<=40){
    hippo();
    rabbitJumpDown+=3;
    rabbitRun+=2;
  } else if (hippoStay>=-50){
    //the little delay before the hippo and the rabbit moves away from teh fox
    hippo();
    hippoStay--;
  } else {
    //the hippo returns with the rabbit
    pushMatrix();
    translate(hippoX, hippoY);
    scale(-1, 1);
    translate(-hippoX, -hippoY);
    hippo();
    popMatrix();
    rabbitRun += 3;
    hippoMove-=3;
  }
  //the squirrel stands still unutil the rabbit is rescued
  if (rabbitX>=190){
    squirrel();
    //the squirrel goes with the rabbit and the hippo
  } else if (rabbitX<=210){
    squirrelGo+=3;
    //the squirrel goes with the hippo and the rabbit
    pushMatrix();
    translate(squirrelX, squirrelY);
    scale(-1, 1);
    translate(-squirrelX, -squirrelY);
    squirrel();
    popMatrix();
  }
  //the angry eyebrows of the hippo
  if (rabbitX>=450){
    line(hippoX-25, 375, hippoX-9, 385);
    line(hippoX+25, 375, hippoX+9, 385);
  }
  if (squirrelX<=-350){
    scene++;
  }
}

//the ending credits
void end() {
  noFill();
  stroke(0);
  strokeWeight(20);
  if (endingCircle>=120){
    ellipse(670, 420, endingCircle, endingCircle);
    endingCircle-=20;
  } else if (endingCircle>=10) {
    //the cartoon styled ending that features the fox
    endingCircle--;
  } else {
    //black background
    for (int x=800; x>=20; x-=20){
      rect(0, 0, x, x);
    }
  PFont edward = loadFont("EdwardianScriptITC-90.vlw");
  textFont(edward);
  textAlign(CENTER);
  text("THE END", 400, credit);
  PFont garmond = loadFont("Garamond-40.vlw");
  textFont(garmond, 30);
  //the ending credits
  text("Made by Yujin Bae", 400, credit+120);
  text("Special thanks to...", 400, credit+240);
  text("Mom for helping me design the fox to look more realistic, ", 400, credit+300);
  text("Dad for scolding me to keep up with the deadline, ", 400, credit+360);
  text("My friends for giving me tips when I was stuck, ", 400, credit+420);
  text("Ms. Basaraba for providing helpful comments every week, ", 400, credit+480);
  text("... and my panic monster for stoping my procrastination.", 400, credit+600);
  credit--;
  }
}

//the animation
void draw() {
  if (scene==0) {
    intro();
    scene++;
  } else if (scene==1) {
    scene1();
  } else if (scene==2) {
    scene2();
  } else if (scene==3) {
    scene3();
  } else if (scene==4) {
    scene4();
  } else if (scene==5) {
    end();
  }
}
