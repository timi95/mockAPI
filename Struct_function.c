#include <stdio.h>
#include <string.h>
#include <stdlib.h>
 
struct point
{
    int x;
    int y;
    void (*print)(const struct point*);
};

union guns
{
	void (*print)(char* string);
};

void print_guns(char* string)
{
	printf("This is the string you entered: \nstring(%s)\n",string);
}

void print_x(const struct point* p)
{
    printf("x=%d\n", p->x);
}
 
void print_y(const struct point* p)
{
    printf("y=%d\n", p->y);
}
 
int main(void)
{
    struct point p1 = { 2, 4, print_x };
    struct point p2 = { 7, 1, print_y };
	union guns g1 = { print_guns }; 
 
    p1.print(&p1);
 
    p2.print(&p2);

	g1.print("Random string");
 
    return 0;
}
