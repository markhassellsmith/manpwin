// Polygon.h: polygon class.
//
//////////////////////////////////////////////////////////////////////

#pragma once

#include	"Plot.h"

#define	DWORD	unsigned long
#define	MAXPOINT    20

//Declaration of class point (renamed to avoid Windows POINT conflict)
class PolyPoint
    {
    public:
    int x,y;
    };

class CPoly
    {
    private:
    PolyPoint p[MAXPOINT];
    int inter[MAXPOINT],x,y;
    int v,xmin,ymin,xmax,ymax;
    public:
    int c;
    DWORD colour;
    void read(int x, int y, int i);
    void calcs();
    void init(int vertices, DWORD color);
    void display(CPlot Plot);
    void ints(double);
//    void intsx(double);
    void sort(int);
    void sort(int, int, CPlot Plot);
    };
