//JOptionPane import used for pop-up window.
import javax.swing.JOptionPane;  

//SoundFile import for audio.
//REQUIRES 'Sound' LIBRARY TO BE INSTALLED.
import processing.sound.SoundFile;
SoundFile audio;

int submitButtonX, submitButtonY;  //position of submission/start button.
int buttonX, buttonY;  //position of button 1.
int buttonX2, buttonY2;  //position of button 2.
int buttonX3, buttonY3;
int buttonX4, buttonY4;
int buttonX5, buttonY5;
int buttonX6, buttonY6;
int buttonX7, buttonY7;
int buttonX8, buttonY8;

boolean startButtonIsPressed;
boolean complete = false;

String buttonText = "Start";

int buttonHeight = 120;  //size of button.
int buttonWidth = 100;

boolean userNumRecieved = false;
String userNum;

//PFont font;

float rnd;

int submitButtonWidth = 150;
int submitButtonHeight = 70;

color button1Color = color(55,146,203);
color button2Color = color(55,146,203);
color button3Color = color(55,146,203);
color button4Color = color(55,146,203);
color button5Color = color(55,146,203);
color button6Color = color(55,146,203);
color button7Color = color(55,146,203);
color button8Color = color(55,146,203);
boolean correctClick;

int misclickCount = 0;
int block = 1;
int trial = 0;

StopWatchTimer sw = new StopWatchTimer();

void setup() {
  size(800, 600);
  rectMode(CENTER);
  //font = createFont("PTSans-Bold", 34);
  
  audio = new SoundFile(this, "success.mp3");
  
  //creates the positions of the buttons.
  submitButtonX = width / 2;
  submitButtonY = height / 2;
  buttonX = (width / 2) + 250;
  buttonY = height / 2;
  buttonX2 = (width / 2) - 250;
  buttonY2 = height / 2;
  
  buttonX3 = width / 2;
  buttonY3 = (height / 2) - 200;
  buttonX4 = width / 2;
  buttonY4 = (height / 2) + 200;
  
  buttonX5 = (width / 2) - 190;
  buttonY5 = (height / 2) - 170;
  buttonX6 = (width / 2) + 190;
  buttonY6 = (height / 2) - 170;
  buttonX7 = (width / 2) - 190;
  buttonY7 = (height / 2) + 170;
  buttonX8 = (width / 2) + 190;
  buttonY8 = (height / 2) + 170;
  
  
  //builds pop-up window to recieve user number input.
  while(userNumRecieved == false) {
    userNum = JOptionPane.showInputDialog("Please Enter User Number");
    if("".equals(userNum)) {
      JOptionPane.showMessageDialog(null, "Please Enter a User Number", "Error", JOptionPane.ERROR_MESSAGE);
    }
    else if(userNum == null) {
      JOptionPane.showMessageDialog(null, "Bye!");
      exit();
      break;
    }
    else {
      JOptionPane.showMessageDialog(null, "Thank You!");
      userNumRecieved = true;
    }
  }
}

//constructs the UI in the main window.
void draw() {
  //update();
  background(0);
  
  // Start box
  fill(220,60,20);
  rect(submitButtonX, submitButtonY, submitButtonWidth, submitButtonHeight);
  
  // Timed boxes
  fill(button1Color);
  rect(buttonX, buttonY, buttonHeight, buttonWidth);
  
  fill(button2Color);
  rect(buttonX2, buttonY2, buttonHeight, buttonWidth);
  
  //textFont(font);
  fill(255);
  textSize(34);
  
  
  textSize(34);
  textAlign(CENTER);
  text(buttonText, width / 2, height / 1.95); // made the start button align better
  
  if (block == 2) {
    fill(button3Color);
    rect(buttonX3, buttonY3, buttonHeight, buttonWidth);
    fill(button4Color);
    rect(buttonX4, buttonY4, buttonHeight, buttonWidth);
  }
  if (block == 3) {
    fill(button3Color);
    rect(buttonX3, buttonY3, buttonHeight, buttonWidth);
    fill(button4Color);
    rect(buttonX4, buttonY4, buttonHeight, buttonWidth);
    fill(button5Color);
    rect(buttonX5, buttonY5, buttonHeight, buttonWidth);
    fill(button6Color);
    rect(buttonX6, buttonY6, buttonHeight, buttonWidth);
    fill(button7Color);
    rect(buttonX7, buttonY7, buttonHeight, buttonWidth);
    fill(button8Color);
    rect(buttonX8, buttonY8, buttonHeight, buttonWidth);
  }
}

// function determining the correct action of each button based on the state of the trial.
void mousePressed() {
  if (buttonText == "Continue") {
    buttonText = "Start";
  }
  // positioning of the buttons is from the middle not from the corner, so that's why you need to  +/- 
  // half of the width to get the right click area
  if (mouseX >= (submitButtonX - submitButtonWidth/2) && mouseX <= (submitButtonX + submitButtonWidth/2) 
  && mouseY >= (submitButtonY - submitButtonHeight/2) && mouseY <= (submitButtonY + submitButtonHeight/2)) {
    sw.start();
    rnd = 0.0;
    if (block == 1) {
      rnd = random(1);
    } else if (block == 2) {
      rnd = random(2);
    } else if (block == 3) {
      rnd = random(4);
    }
    //println("Starting Test");
    // randomly choosing which button to light up
    if(rnd >= 0.5 && rnd < 1) {
      button1Color = color(255);
    }
    else if (rnd < 0.5) {
      button2Color = color(255);
    }
    else if (rnd >= 1 && rnd < 1.5) {
      button3Color = color(255);
    }
    else if (rnd >= 1.5 && rnd < 2) {
      button4Color = color(255);
    }
    else if (rnd >= 2 && rnd < 2.5) {
      button5Color = color(255);
    }
    else if (rnd >= 2.5 && rnd < 3) {
      button6Color = color(255);
    }
    else if (rnd >= 3 && rnd < 3.5) {
      button7Color = color(255);
    }
    else if (rnd >= 3.5 && rnd <= 4) {
      button8Color = color(255);
    }
  }
  
  //check button 1
  else if (mouseX > (buttonX - buttonWidth/2) && mouseX < (buttonX + buttonWidth/2) 
  && mouseY > (buttonY - buttonHeight/2) && mouseY < (buttonY + buttonHeight/2) && rnd >= 0.5 && rnd < 1) {
    sw.stop();
    audio.play();
    button1Color = color(55,146,203);
    button2Color = color(55,146,203);
    rnd = 0.0;
    trial++;
    println("user " + userNum + "     block " + block + "    trial " + trial + "    elapsed time " + sw.millisecond() + "    errors " + misclickCount);
    misclickCount = 0;
  }
  
  //check button 2
  else if (mouseX > (buttonX2 - buttonWidth/2) && mouseX < (buttonX2 + buttonWidth/2) 
  && mouseY > (buttonY2 - buttonHeight/2) && mouseY < (buttonY2 + buttonHeight/2) && rnd < 0.5) {
    sw.stop();
    audio.play();
    button1Color = color(55,146,203);
    button2Color = color(55,146,203);
    rnd = 0.0;
    trial++;
    println("user " + userNum + "     block " + block + "    trial " + trial + "    elapsed time " + sw.millisecond() + "    errors " + misclickCount);
    misclickCount = 0;
    
  //check button 3
  } else if (block >= 2 && rnd >= 1 && rnd < 1.5 && mouseX >= (buttonX3 - buttonWidth/2) && mouseX <= (buttonX3 + buttonWidth/2) && mouseY >= (buttonY3 - buttonHeight/2) && mouseY <= (buttonY3 + buttonHeight/2)) {
    sw.stop();
    audio.play();
    button1Color = color(55,146,203);
    button2Color = color(55,146,203);
    button3Color = color(55,146,203);
    button4Color = color(55,146,203);
    rnd = 0.0;
    trial++;
    println("user " + userNum + "     block " + block + "    trial " + trial + "    elapsed time " + sw.millisecond() + "    errors " + misclickCount);
    misclickCount = 0;
    
  //check button 4
  } else if (block >= 2 && rnd >= 1.5 && rnd < 2 && mouseX > (buttonX4 - buttonWidth/2) && mouseX < (buttonX4 + buttonWidth/2) && mouseY > (buttonY4 - buttonHeight/2) && mouseY < (buttonY4 + buttonHeight/2)) {
    sw.stop();
    audio.play();
    button1Color = color(55,146,203);
    button2Color = color(55,146,203);
    button3Color = color(55,146,203);
    button4Color = color(55,146,203);
    rnd = 0.0;
    trial++;
    println("user " + userNum + "     block " + block + "    trial " + trial + "    elapsed time " + sw.millisecond() + "    errors " + misclickCount);
    misclickCount = 0;
    
  //check button 5
  } else if (block == 3 && rnd >= 2 && rnd < 2.5 && mouseX > (buttonX5 - buttonWidth/2) && mouseX < (buttonX5 + buttonWidth/2) && mouseY > (buttonY5 - buttonHeight/2) && mouseY < (buttonY5 + buttonHeight/2)) {
    sw.stop();
    audio.play();
    button1Color = color(55,146,203);
    button2Color = color(55,146,203);
    button3Color = color(55,146,203);
    button4Color = color(55,146,203);
    button5Color = color(55,146,203);
    rnd = 0.0;
    trial++;
    println("user " + userNum + "     block " + block + "    trial " + trial + "    elapsed time " + sw.millisecond() + "    errors " + misclickCount);
    misclickCount = 0;
    
  //check button 6
  } else if (block == 3 && rnd >= 2.5 && rnd < 3 && mouseX > (buttonX6 - buttonWidth/2) && mouseX < (buttonX6 + buttonWidth/2) && mouseY > (buttonY6 - buttonHeight/2) && mouseY < (buttonY6 + buttonHeight/2)) {
    sw.stop();
    audio.play();
    button1Color = color(55,146,203);
    button2Color = color(55,146,203);
    button3Color = color(55,146,203);
    button4Color = color(55,146,203);
    button5Color = color(55,146,203);
    button6Color = color(55,146,203);
    rnd = 0.0;
    trial++;
    println("user " + userNum + "     block " + block + "    trial " + trial + "    elapsed time " + sw.millisecond() + "    errors " + misclickCount);
    misclickCount = 0;
    
  //check button 7
  } else if (block == 3 && rnd >= 3 && rnd < 3.5 && mouseX > (buttonX7 - buttonWidth/2) && mouseX < (buttonX7 + buttonWidth/2) && mouseY > (buttonY7 - buttonHeight/2) && mouseY < (buttonY7 + buttonHeight/2)) {
    sw.stop();
    audio.play();
    button1Color = color(55,146,203);
    button2Color = color(55,146,203);
    button3Color = color(55,146,203);
    button4Color = color(55,146,203);
    button5Color = color(55,146,203);
    button6Color = color(55,146,203);
    button7Color = color(55,146,203);
    rnd = 0.0;
    trial++;
    println("user " + userNum + "     block " + block + "    trial " + trial + "    elapsed time " + sw.millisecond() + "    errors " + misclickCount);
    misclickCount = 0;
    
  //check button 8
  } else if (block == 3 && rnd >= 3.5 && rnd <= 4 && mouseX > (buttonX8 - buttonWidth/2) && mouseX < (buttonX8 + buttonWidth/2) && mouseY > (buttonY8 - buttonHeight/2) && mouseY < (buttonY8 + buttonHeight/2)) {
    sw.stop();
    audio.play();
    button1Color = color(55,146,203);
    button2Color = color(55,146,203);
    button3Color = color(55,146,203);
    button4Color = color(55,146,203);
    button5Color = color(55,146,203);
    button6Color = color(55,146,203);
    button7Color = color(55,146,203);
    button8Color = color(55,146,203);
    rnd = 0.0;
    trial++;
    println("user " + userNum + "     block " + block + "    trial " + trial + "    elapsed time " + sw.millisecond() + "    errors " + misclickCount);
    misclickCount = 0;
  }
  
  //misclick
  else if (rnd > 0) {
    misclickCount++;
    //println("user " + userNum + "     block " + block + "    trial " + trial + "    elapsed time " + sw.millisecond() + "    errors " + misclickCount);
  }
  if (trial == 20) {
    buttonText = "Continue";
    trial = 0;
    if (block < 3) {
      block++;
    } else {
      block = 1;
    }

  }
}


//class for calculating the elapsed time.
class StopWatchTimer {
  
  int startTime = 0, stopTime = 0;
  boolean running = false;  
  
  void start() {
    startTime = millis();
    running = true;
  }
  
  void stop() {
    stopTime = millis();
    running = false;
  }
  
  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    }
    else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }
    
    int millisecond() {
      return (getElapsedTime());
    }
    
}