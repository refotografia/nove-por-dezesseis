import processing.sound.*;
PFont letraInicio;
int tempoSegundos;

SqrOsc triOsc;
Env env;

float attackTime = 0.001;
float sustainTime = 0.2;
float sustainLevel = 0.2;
float releaseTime = 1.2;

boolean debugDados = false;

SoundFile riovstimeline;

float cspeed1 = random(-20, 20);
float cspeed2 = random(-20, 20);
float cspeed3 = random(-20, 20);
float cspeed4 = random(-20, 20);
float cspeed5 = random(-20, 20);
float cX1;
float cX2;
float cX3;
float cX4;
float cX5;
float csize = 80;

void setup() {
  size(720, 1280);
  letraInicio = loadFont("ArialMT-20.vlw");
  background(0);
  frameRate(2.2);
  cX1 = width/2;
  cX2 = width/2;
  cX3 = width/2;
  cX4 = width/2;
  cX5 = width/2;

  triOsc = new SqrOsc(this);
  env  = new Env(this);
  //triOsc.amp(0.4);
  triOsc.freq(400);
  //env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);


  riovstimeline = new SoundFile(this, "3min.wav");
  riovstimeline.amp(1);
  riovstimeline.play(); // o som começa mesmo junto com o template de abertura, espero que seja OK
}

void draw() {

  int m = millis();
  tempoSegundos = m / 1000;

  if (tempoSegundos<12) {
    background(0);
    fill(255);
    textFont(letraInicio, 20);
    textAlign(LEFT);
    text("RIO VS TIMELINE", width/2, 250);
    fill(127);
    text("Sobre nomofobia\ne a vida dos nossos olhos.", width/2, 350);
    fill(255);
    text("Guilherme Maranhão", width/2, 600);
    fill(127);
    text("refotografia.blog", width/2, 680);
  }

  if (tempoSegundos==12) {
    background(0);
    //triOsc.stop();
    //triOsc.amp(0.4);
  }

  if (tempoSegundos>12) {
    float y1 = random(25);
    float y2 = (y1/2)+(height/16);

    for (int j = 0; j < 16; j++) {
      float x1 = random(40);
      float x2 = (x1/2)+(random(0.8, 1.2)*(width/9));

      for (int i = 0; i < 9; i++) {

        float w = random(10, 40);
        strokeWeight(w);

        if (millis()<19000) {
          float corFadein = map(millis(), 12000, 19000, 0, 1);
          stroke(corFadein*random(0, 20), corFadein*random(0, 35), corFadein*random(127, 255));
        } else if (millis()>168000) {
          float corFadein = map(millis(), 168000, 180000, 1, 0);
          stroke(corFadein*random(0, 20), corFadein*random(0, 35), corFadein*random(127, 255));
        } else {
          stroke(random(0, 20), random(0, 35), random(127, 255));
        }

        x1 = (x1*random(0.97, 1.02));
        y1 = (y1*random(0.98, 1.02));
        x2 = (x2*random(0.97, 1.01));
        y2 = (y2*random(0.99, 1.01));

        line(x1, y1, x2, y2);

        x1 = x1+(random(0.8, 1.2)*(width/9));
        x2 = x2+(random(0.8, 1.2)*(width/9));
      }

      y1 = y1+(random(0.8, 1.2)*(height/16));
      y2 = y2+(random(0.8, 1.2)*(height/16));
    }

    noStroke();
    if (millis()<19000) {
      float corFadein = map(millis(), 12000, 19000, 0, 1);
      fill(color(corFadein*255, corFadein*255, 0, corFadein*85));
    } else if (millis()>168000) {
      float corFadein = map(millis(), 168000, 180000, 1, 0);
      fill(color(corFadein*255, corFadein*255, 0, corFadein*85));
    } else {
      fill(color(255, 255, 0, 85)); // no inicio os círculos eram verdes, dai o nome do arquivo...
    }

    cX1 = cX1 + cspeed1;
    cX2 = cX2 + cspeed2;
    cX3 = cX3 + cspeed3;
    cX4 = cX4 + cspeed4;
    cX5 = cX5 + cspeed5;
    circle(cX1, height/6, (csize*random(0.9, 1.1)));
    circle(cX2, height/3, (csize*random(0.9, 1.1)));
    circle(cX3, height/2, (csize*random(0.9, 1.1)));
    circle(cX4, height/1.5, (csize*random(0.9, 1.1)));
    circle(cX5, height/1.25, (csize*random(0.9, 1.1)));

    if (cX1 > width - csize || cX1 < csize) {
      cspeed1 *= -1.1;
    }
    if (cX2 > width - csize || cX2 < csize) {
      cspeed2 *= -1.1;
    }
    if (cX3 > width - csize || cX3 < csize) {
      cspeed3 *= -1.1;
    }
    if (cX4 > width - csize || cX4 < csize) {
      cspeed4 *= -1.1;
    }
    if (cX5 > width - csize || cX5 < csize) {
      cspeed5 *= -1.1;
    }

    if (millis() > 50000 && millis() < 168000 && random(0, 1) > 0.97) { // para acontecer depois dos primeiros 50 segundos e antes dos últimos 10 segundos
      strokeWeight(125); // fica uma linha bem larga, as vezes parece umas figuras humanas
      stroke(255, 127, 0); // um tom alaranjado interessante que completa o duo do azul e amarelo
      line(cX1, height/6, cX3, height/2);
      line(cX3, height/2, cX5, height/1.25);
      line(cX2, height/3, cX4, height/1.5);

      triOsc.amp(0.1);
      env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
      //println("tocou"+millis());
    }


    if (debugDados) {
      fill(0);
      rect(20, 20, 120, 60);
      fill(255);
      text(millis(), 50, 50);
    }

    if (millis() > 180000) {  // encerra depois de 3 minutos
      exit();
    }
  }
}

void keyPressed() {
  if (key=='d' || key=='D') {
    debugDados = !debugDados;
  }
}
