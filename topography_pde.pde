import peasy.*; // camera library
import gifAnimation.*; // gif library
import controlP5.*;    // GUI library

Mesh mesh = new Mesh(4);
Texture texture;
GifMaker gifExport;
PeasyCam cam;
ControlP5 controlP5;


void setup() {
	size(800, 800, P3D);
	stroke(240);
	strokeWeight(3.0/1.5);
	background(50);
	noFill();

	// make the clipping plane closer
	float cameraZ = ((height/2.0) / tan(PI*60.0/360.0)); 
	perspective(PI/3.0, width/height, cameraZ/20.0, cameraZ*10.0);

	//cam = new PeasyCam(this, 300);
  	//cam.setMinimumDistance(1);
  	//cam.setMaximumDistance(2000);

  	//gifExport = new GifMaker(this, "topography.gif");
  	//gifExport.setRepeat(0);        // make it an "endless" animation
  	//gifExport.setQuality(2);

  	texture = new Texture(mesh);
  	texture.updateMesh();  // get the first set of z values from the texture image

  	controlP5 = new ControlP5(this);
  	controlP5.addSlider("sample size",0,100,1.0,30,30,100,10);
  	controlP5.addSlider("x offset",0,50,0.0,30,50,100,10);

}

void draw() {
	background(50);
	pushMatrix();
	translate(250, 350);
	scale(1.5);
  	rotateX(0.8);
  	rotateY(-0.3);
  	

  	// update mesh z values with data from the texture image every 4 frames
  	if(frameCount % 4 == 0) {
  		texture.updateMesh();
  	}
  	mesh.draw();
  	popMatrix();

	if(frameCount > 1 && frameCount % 4 == 0) {
	     	//gifExport.addFrame();
	    } 
	  
	  //gifExport.setDelay(0);
	}

void keyPressed() {
    if (key == ENTER) {
      println("key pressed");
     
      //gifExport.finish();
    }
}

void controlEvent(ControlEvent theEvent) {
  /* events triggered by controllers are automatically forwarded to
     the controlEvent method. by checking the name of a controller one can
     distinguish which of the controllers has been changed.
  */
  /* check if the event is from a controller otherwise you'll get an error
     when clicking other interface elements like Radiobutton that don't support
     the controller() methods
  */
  
	if(theEvent.isController()) {

		if(theEvent.controller().name()=="sample size") {
			texture.sampleSize = int(theEvent.controller().value());
		}
		if(theEvent.controller().name()=="x offset") {
			texture.speed = int(theEvent.controller().value());
		}
	}  
}
