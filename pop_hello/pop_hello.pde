import com.hamoid.*;

// plugin d'export vidéo
VideoExport videoExport;

// statut de l'enregistrement
boolean isRecording = false;

// palette de couleurs
color colorStrokeA = color(255, 0, 0, 100);
color colorFillA = color(255, 255, 0, 100);
color colorStrokeB = color(0, 255, 0, 100);
color colorFillB = color(0, 255, 255, 100);

// couleurs par défaut
color colorStroke = colorStrokeA;
color colorFill = colorFillA;

void setup() {
  // taille de la fenêtre
  size(800, 600);

  // initialisation du plugin
  videoExport = new VideoExport(this);
}

void draw() {
  // couleur de l'arrière plan
  // attention : pas de couche alpha ici
  background(255, 255, 255);

  // masquer le curseur
  noCursor();

  // épaisseur du trait
  strokeWeight(10);
  // couleur du trait (avec couche alpha)
  stroke(colorStroke);
  // couleur de remplissage (avec couche alpha)
  fill(colorFill);
  // positionner la forme par rapport à son centre
  rectMode(CENTER);
  // afficher d'un rectangle à la position de la souris
  rect(mouseX, mouseY, 100, 50);

  // exporter la vidéo seulement si on enregistre
  if (isRecording) {
    videoExport.saveFrame();
  }
}

void mousePressed() {
  colorStroke = colorStrokeB;
  colorFill = colorFillB;
}

void mouseReleased() {
  colorStroke = colorStrokeA;
  colorFill = colorFillA;
}

void keyPressed() {
  if (key == ' ') {
    if (!isRecording) {
      videoExport.startMovie();
      isRecording = true;
    } else {
      videoExport.endMovie();
      exit();
    }
  }
}