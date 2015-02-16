import peasy.*;

PeasyCam cam;

Mesh mesh = new Mesh(4);
Texture texture;


void setup() {
	size(800, 800, P3D);
	stroke(240);
	strokeWeight(3.0/30.0);
	background(50);
	noFill();

	float cameraZ = ((height/2.0) / tan(PI*60.0/360.0)); 
	perspective(PI/3.0, width/height, cameraZ/20.0, cameraZ*10.0);

	cam = new PeasyCam(this, 300);
  	cam.setMinimumDistance(1);
  	cam.setMaximumDistance(500);

  	texture = new Texture(mesh);
  	texture.getPixel();

}

void draw() {
	background(50);
	scale(30.0);

  	rotateX(-0.5);
  	rotateY(-0.5);

  	translate(-1.5, -1.5);
  	mesh.draw();

	/*for(int y=0; y<mesh.size; y++){
		for(int x=0; x<mesh.size; x++){
			int z = mesh.getVertex(x, y);

			line(x, y, z, x, y, z+10);
		}
	}*/


}
