private double fractionLength = .8; 
private int smallestBranch = 10; 
//private double branchAngle = .2;  
int r=100;
double l=0.2;
int y=2;
double x=0.2;
public void setup() 
{   
	size(640,480);    

 
} 
public void draw() 
{   
	int y=r+10;
	if(r<125){
		r+=1;
		l+=0.01;
		background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,480,r,3*Math.PI/2,l);
	}
	/*else if(r>y){
		r=(int)Math.random()*100+50;
		l=0;
		y=r+50;
	}*/
	background(0);
	drawBranches(320,480,r,3*Math.PI/2,l);

//forward();
//backward();


}	 
/*public void forward(){
	while(r<0){
		y=2;
		x=0.2;
	}
	r+=y;
	l+=x;
}

public void backward(){
		while(r>150){
		y=-2;
		x=-0.2;
	}
	r+=y;
	l+=x;
}*/

public void drawBranches(int x,int y, double branchLength, double angle, double branchAngle) 
{   
	//your code here
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle; 
	strokeWeight((float)branchLength/8-(float)branchLength/16);
	stroke((float)branchLength/8-(float)branchLength/16, (float)l*300, (float)r*0.1);
	branchLength = branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength > smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1,l);
		drawBranches(endX2,endY2,branchLength,angle2,l);
	}
} 
