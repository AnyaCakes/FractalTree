private double fractionLength = .8; 
private int smallestBranch = 10; 
int cloud=1000;

double l=0;
int r=(int)Math.random()*300;
int g=(int)Math.random()*200;
int b=(int)Math.random()*200;
int y=(int)(Math.random()*400);
int x=100;
public void setup() 
{   
	size(800,800);    
	frameRate(50);
 
} 
public void draw() 
{   

	if(l<0.2){
		l+=0.05;
	}
	else
	{
		double z=(double)Math.random()*.02-0.0099;
		l+=z;
	}
		background(50, 50, 150);   
	  
	    //cloud
    noStroke();
    fill(255, 255,255);
    ellipse(cloud,100,50,50);
    ellipse(cloud-20,115,50,50);
    ellipse(cloud,120,100,37);
    ellipse(cloud+20,115,50,50);
    
    ellipse(cloud-316,100,50,50);
    ellipse(cloud-337,115,50,50);
    ellipse(cloud-311,106,100,37);
    ellipse(cloud-300,115,50,50);
 	
 	//tree

	drawBranches(430,800,120,3*Math.PI/2,l, 150, 200, 160);
	drawBranches(100,800,120,3*Math.PI/2,l, 100, 170, 100);
	drawBranches(700,800,120,3*Math.PI/2,l, 75, 150, 120);
	//bird
	stroke(0);
     fill(0, 0, 0);
    rect(x,y,25,15,25);
    triangle(x+10,y,x+15,y-10,x+20,y);
    ellipse(x,y,15,15);
    fill(250, 250, 250);
    ellipse(x-3,y,5,5);
    fill(0, 0, 0);
    ellipse(x-3,y,3,3);
    fill(250, 175, 0);
    triangle(x-8,y+3,x-13,y,x-7,y-3);
    x=x-10;
    if(x<=-100){x=1000; y=(int)(Math.random()*400);}

    //ground
    noStroke();
    fill(150,120,100);
    rect(0,750,800,800);


    cloud-=3;
    if(cloud<=-100){cloud=1000;}
}	 



public void drawBranches(int x,int y, double branchLength, double angle, double branchAngle, int colR, int colG, int colB) 
{   
	//your code here
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle; 
	stroke(100,200,120);
	branchLength = branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength > smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1,l, r, g, b);
		drawBranches(endX2,endY2,branchLength,angle2,l, r, g, b);
	}
} 
