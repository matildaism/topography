class Texture {
	PImage img;
	Mesh mesh;
	int sampleSize = 320;

	Texture(Mesh msh) {
		img = loadImage("test.jpg");
  		img.loadPixels();

  		mesh = msh;

	}

	void getPixel() {
		for(int y = 0; y < mesh.size; y++) {
	  		for(int x = 0; x < mesh.size; x++) {

	  			color pixel = img.get(x*sampleSize, y*sampleSize);
	  			float p = map(red(pixel), 0, 255, 0, 1);

	  			println(p);

	  			mesh.setVertex(x, y, p);
	  		}
	  	}
	}
}