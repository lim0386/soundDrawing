/*
 LIM, Yang Kyu's favorite Music Analysis Drawing Program.
 just one email for me.
 It helps!
 
 lim0386@gmail.com
 

 BPM = 60,000,000/MicroTempo 
 MicrosPerPPQN = MicroTempo/TimeBase 
 MicrosPerMIDIClock = MicroTempo/24 
 PPQNPerMIDIClock = TimeBase/24 
 MicrosPerSubFrame = 1000000 * Frames * SubFrames 
 SubFramesPerQuarterNote = MicroTempo/(Frames * SubFrames) 
 SubFramesPerPPQN = SubFramesPerQuarterNote/TimeBase 
 MicrosPerPPQN = SubFramesPerPPQN * Frames * SubFrames
 
 120 BPM * 4 LPB = 480 lines per minute
 */

String[] endInfo; //Finding End point
String endPoint; // Be aware... Name is very similar
float endFloat, endFinal;

String[] midiData, bpmData, percentData; //opening MIDI
String bpm, percentage; //speed and duration
float speed, duration; 

float bpmFloat, durFloat, lBpmFloat, lDurFloat, lDurFloat2;
//float bpmFloat = 0.0; 
//float durFloat = 0.0;

//float lBpmFloat = 0.0;
//float lDurFloat = 0.0;

int index, end;
int Ending;
int beatInfo, i;


int bpmNumber;

void setup() {
  size(1920, 400);
  midiData = loadStrings("midi2text.txt"); //select MF2T file

  //Finding End of this Music
  for (int j = 0; j < midiData.length; j++) { //End point finder

    end = midiData[j].indexOf("Meta TrkEnd"); //Finding which line has End track 
    //midiData = sort(midiData);
    //println(midiData);
   
   //"I am not sure this is right or not. Must fix this part 
    if (end > 0) {

      endInfo = split(midiData[j], "Meta TrkEnd"); //Using "Meta" to split
      endFloat = float(endInfo[0]); //Problem "How can I put all moving data to one String[]?"
      if (endFloat > 1) {
        endFinal = endFloat;

        //println(endFinal);
      }
    }
    
    //fix may be to here    
  }
}

void draw() {

  i++;
  index =  midiData[i].indexOf("Tempo"); // Tempo and duration finder

  if (index > 0) {
    bpmData = split(midiData[i], "Tempo"); //Using "Tempo" to split
    bpm = bpmData[1]; // This is speed music. must caculate  60000000/bpm = ??
    speed = float(bpm); //String to Float
    
    percentage = bpmData[0]; //This is duration. must caculated by "endFloat" percentage*100/enfFloat = ??
    duration = float(percentage); //also String to Float
    
  }

  durFloat = duration/endFinal*width; //Where am I?
  bpmFloat = 60000000/speed; //How fast is this Music?
  
  println(lDurFloat, lBpmFloat, durFloat, bpmFloat);
 
 //If I use line.
  //strokeWeight(1);
  //stroke(255); 
  //line(lDurFloat2, -1*lBpmFloat+(height/1.3), durFloat, -1*lBpmFloat+(height/1.3));
  //line(durFloat, -1*lBpmFloat+(height/1.3), durFloat, -1*bpmFloat+(height/1.3));

 //If I use Vertex.
  //beginShape();
  
  //vertex(lDurFloat2, -1*lBpmFloat+(height/1.3));
  //vertex(durFloat, -1*lBpmFloat+(height/1.3));
  //vertex(durFloat, -1*bpmFloat+(height/1.3));

  //endShape();
  
  //If I use shape.
  fill(0);
  //rect(lDurFloat2, -1*lBpmFloat+(height/1.3), durFloat-lDurFloat2,-1*lBpmFloat+(height/1.3)+-1*lBpmFloat+(height/1.3));
    rect(lDurFloat2, -1*lBpmFloat+(height/1.3), durFloat-lDurFloat2,100-1*lBpmFloat+(height/1.3));

  
  lBpmFloat = bpmFloat;
  lDurFloat = durFloat;
  lDurFloat2 = lDurFloat;
  
}