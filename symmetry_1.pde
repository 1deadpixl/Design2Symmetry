/**
*
* Design 2 Dots & Lines Project
* Symmetrical Composition
* Philippe Enzler
*
**/

void horizontalLines(float y0, int qty, float spread) {
	float deltaY = 0.0;
	for(int c=0;c<qty;c++) {
		int sat = 10;
		int brt = 90;
		if (c == 0) {
			stroke(0, sat, brt);
		} else {
			color myColor = color((360/qty)*c, (sat*c)/2, brt);
			// println("hue: "+hue(myColor)+", sat: "+saturation(myColor));
			stroke(myColor);
		}
		// println("weight: "+c/4.0);
		strokeWeight(c/4.0);

		int rand1 = int(random(1, spread));
		deltaY += rand1;
		// println("+y: "+(y0+deltaY)+", -y: "+(y0-deltaY));
		line(0, y0+deltaY, width, y0-deltaY);
		line(0, y0-deltaY, width, y0+deltaY);
	}
}
void verticalLines(int sets) {
	for(int v=1;v<=sets;v++) {
		int y0 = -200;
		int x0 = int(random(100,400));
		for(int c=0;c<10;c++) {
			stroke(255-(c*(255/10)));
			strokeWeight(1);
			int rand1 = int(random(10, 75));
			int rand2 = int(random(10, 20));
			int x1 = x0+(c*rand1);
			int x2 = x0-(c*rand2);
			line(x1, y0, x2, width);
			int symX1 = width-x1;
			int symX2 = width-x2;
			line(symX1, y0, symX2, width);
		}
	}
}
void dots(float growthFactor, int steps, int lines, int y0) {

	noStroke();
	int x0 = width/2;
	for(int b=0;b<lines;b++) {
		int deltaY = (height-y0-int(growthFactor*steps))/lines;
		int thisY = y0 + b*deltaY;
		// println("deltaY: "+deltaY+", thisY: "+thisY);
		for(int c=1;c<=steps;c++) {
			float diameter = growthFactor*c;
			int deltaX = ((c-1)*x0/steps);
			// println("c: "+c+", +x: "+(x0+deltaX)+", d: "+diameter);
			ellipse(x0+deltaX, thisY, diameter, diameter);
			ellipse(x0-deltaX, thisY, diameter, diameter);
		}
	}

}
void setup() {
	colorMode(HSB, 360, 100, 100);
	// blendMode(SCREEN);
	size(1200,1200); //4" square at 300ppi
	noLoop();
	// frameRate(3);
}

void draw() {
	background(0x0A324E);

	// rotate(radians(10));
	float y0 = int(random(100,200));
	for(float c=1;c<=5;c++) {
		y0 = y0+random(y0);
		println("y0: "+y0);
		horizontalLines(y0, 10, 5*c);
	}
	verticalLines(1);
	// blendMode(DIFFERENCE);
	dots(1.6, 14, 18, 200);
	stroke(0xFF);
	// line(width/2, 0, width/2, height); //horizontal center line
}
void mousePressed() {
	redraw();
}