//JOptionPane import used for pop-up window.
import javax.swing.JOptionPane;  

int submitButtonX, submitButtonY;  //position of submission/start button.
int buttonX, buttonY;  //position of button 1.
int buttonX2, buttonY2;  //position of button 2.
int buttonSize = 120;  //size of button.
boolean buttonOver = false; // 
boolean buttonOver2 = false; //
boolean userNumRecieved = false; //
PFont font;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  font = createFont("PTSans-Bold", 32);
  
  //creates the positions of the buttons.
  submitButtonX = width / 2;
  submitButtonY = height / 2;
  buttonX = (width / 2) + 250;
  buttonY = height / 2;
  buttonX2 = (width / 2) - 250;
  buttonY2 = height / 2;
  
  //builds pop-up window to recieve user number input.
  while(userNumRecieved == false) {
    String userNum = JOptionPane.showInputDialog("Please Enter User Number");
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

//constructs the buttons in the main window.
void draw() {
  background(0);
  update();
  
  // Start box
  fill(220,60,20);
  rect(submitButtonX, submitButtonY, 150, 70);
  
  // Timed boxes
  fill(55,146,203);
  square(buttonX, buttonY, buttonSize);
  
  fill(55,146,203);
  square(buttonX2, buttonY2, buttonSize);
  
  textFont(font);
  fill(255);
  textSize(34);
  textAlign(CENTER);
  text("Start", width / 2, height / 1.95); // made the start button align better
}

//INCOMPLETE; potential method to select "target" button.
void update() {
  if(hoverButton(buttonX, buttonY, buttonSize)) {
    buttonOver = true;
    buttonOver2 = false;
  } else if(hoverButton(buttonX2, buttonY2, buttonSize)) {
    buttonOver = false;
    buttonOver2 = true;
  } else {
    buttonOver = false;
    buttonOver2 = false;
  }
}
 
//INCOMPLETE
boolean hoverButton(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}