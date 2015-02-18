// this class is for the 3D virtual model

class Mesh {
	ArrayList<Float> vertices; // arraylist of z values for the mesh
	int size;

	// Multipliers so the scale of the model reflects the real structure
    // Assume 1m = 100 units.
	float scaleX = 72;
	float scaleY = 53;
	float scaleZ = 50;

	Mesh(int sz) {
		size = sz;
		vertices = new ArrayList<Float>();

		for(int y=0; y < 4; y++){
			for(int x=0; x < 4; x++){
				vertices.add(0.0);
			}
		}
	}

	float getVertex(int x, int y) {
		// transforms 2D coordinates to index in 1D arrayList
		return vertices.get(y * size + x);
	}

	void setVertex(int x, int y, float z) {
		
		vertices.set((y * size + x), z);
	}


	void draw() {

		for(int y = 0; y < size-1; y++) {
			beginShape(TRIANGLE_STRIP);
			vertex(0, scaleY*y, scaleZ*getVertex(0, y));
			vertex(0, scaleY*(y+1), scaleZ*getVertex(0, y+1));

			for(int x = 0; x < size; x++) {
				vertex(scaleX*x, scaleY*y, scaleZ*getVertex(x, y));
				vertex(scaleX*x, scaleY*(y+1), scaleZ*getVertex(x, y+1));
			}
			endShape();
		}
		
	}
}


