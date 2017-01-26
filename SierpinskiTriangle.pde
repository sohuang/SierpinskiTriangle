public int threshold = 1;
public int len = 100;
public float h = 0;

public void setup() {
	size(640, 480);
	colorMode(HSB);
	background(0);
	noStroke();
	// fill(255);
}

public void draw() {
	background(0);
	
	sierpinski(width/2 - len/2, height/2 + len/2, len);
	// h += 0.01;
}

//optional
public void mouseDragged() {
	len = (int)map(mouseX, 0, width, 30, height);
	threshold = (int)map(mouseY, 0, height, 1, 20);
}

public void sierpinski(int x, int y, int len) {
	if (len <= threshold) {
		float n = noise(h);
		// seems to not have  much red
		fill(map(n, 0.2, 1, 0, 255), 200, 200);
		beginShape(TRIANGLES);
		vertex(x, y);
		vertex(x + len, y);
		vertex(x + len/2, y - len);
		endShape();
		h += 0.05;
		
	} else {
		sierpinski(x, y, len/2);
		sierpinski(x + len/2, y, len/2);
		sierpinski(x + len/4, y - len/2, len/2);
	}
}