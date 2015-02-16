import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class topography_pde extends PApplet {



PeasyCam cam;

Mesh mesh = new Mesh(4);
Texture texture;


public void setup() {
	size(800, 800, P3D);
	stroke(240);
	strokeWeight(3.0f/30.0f);
	background(50);
	noFill();

	float cameraZ = ((height/2.0f) / tan(PI*60.0f/360.0f)); 
	perspective(PI/3.0f, width/height, cameraZ/20.0f, cameraZ*10.0f);

	cam = new PeasyCam(this, 300);
  	cam.setMinimumDistance(1);
  	cam.setMaximumDistance(500);

  	texture = new Texture(mesh);
  	texture.getPixel();

}

public void draw() {
	background(50);
	scale(30.0f);

  	rotateX(-0.5f);
  	rotateY(-0.5f);

  	translate(-1.5f, -1.5f);
  	mesh.draw();

	/*for(int y=0; y<mesh.size; y++){
		for(int x=0; x<mesh.size; x++){
			int z = mesh.getVertex(x, y);

			line(x, y, z, x, y, z+10);
		}
	}*/


}
class Mesh {
	ArrayList<Float> vertices;
	int size;

	Mesh(int sz) {
		size = sz;
		vertices = new ArrayList<Float>();

		for(int y=0; y < 4; y++){
			for(int x=0; x < 4; x++){
				vertices.add(0.0f);
			}
		}
	}

	public float getVertex(int x, int y) {

		return vertices.get(y * size + x);
	}

	public void setVertex(int x, int y, float z) {
		
		vertices.set((y * size + x), z);
	}


	public void draw() {

		for(int y = 0; y < size-1; y++) {
			beginShape(TRIANGLE_STRIP);
			vertex(0, y, getVertex(0, y));
			vertex(0, y+1, getVertex(0, y+1));

			for(int x = 0; x < size; x++) {
				vertex(x, y, getVertex(x, y));
				vertex(x, y+1, getVertex(x, y+1));
			}
			endShape();
		}
		
	}
}


class Texture {
	PImage img;
	Mesh mesh;
	int sampleSize = 320;

	Texture(Mesh msh) {
		img = loadImage("test.jpg");
  		img.loadPixels();

  		mesh = msh;

	}

	public void getPixel() {
		for(int y = 0; y < mesh.size; y++) {
	  		for(int x = 0; x < mesh.size; x++) {

	  			int pixel = img.get(x*sampleSize, y*sampleSize);
	  			float p = map(red(pixel), 0, 255, 0, 1);

	  			println(p);

	  			mesh.setVertex(x, y, p);
	  		}
	  	}
	}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "topography_pde" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
