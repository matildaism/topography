class Mesh {
	ArrayList<Float> vertices;
	int size;

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

		return vertices.get(y * size + x);
	}

	void setVertex(int x, int y, float z) {
		
		vertices.set((y * size + x), z);
	}


	void draw() {

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


