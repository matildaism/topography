// this class deals with getting values from a terrain image and sending it to the mesh

class Texture {
	PImage img;
	Mesh mesh;
	int sampleSize = 1;
	int travelX;
	int travelY;
	int speed = 1;
	float angle = radians(45);
	float texScale;

	Texture(Mesh msh) {
		img = loadImage("alaska.jpg");
  		img.loadPixels();

  		mesh = msh;
  		texScale = mesh.scaleY/mesh.scaleX;

	}
// travel across the texture image, updating the mesh with new z values
	void updateMesh() {
		//the x and y loop counters also form the coordinates
		for(int y = 0; y < mesh.size; y++) {
	  		for(int x = 0; x < mesh.size; x++) {

	  			color pixel = img.get(travelX + x*sampleSize, int(y*texScale*sampleSize));
	  			// the image is black and white so rgb channels have the same value, we just need one
	  			float p = map(red(pixel), 0, 255, 0, 1);

	  			mesh.setVertex(x, y, p);
	  			println(x, y, p);
	  		}
	  	}
	  	travelX+=speed*sin(angle);
	  	if(travelX > img.width) {
	  		travelX = 0;
	  	}
	  	println(travelX);
	}
}