
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>

//Functions
double x_func(double x, double y, double ydot);
double y_func(double x, double y, double x_dot);
void data(double x, double y, FILE* datafile);
double input(void);
void plotter(FILE* datafile);
void stats(double max, double min, int i);


int main() {


    double y5 = 42164.1;
    double x5 = 4670.46;
    double y_dot5 = 0;
    double x_dot5 = -9.238231;
    int ans = 1;
    double tf5 = 3;
    printf("The current starting values are as follows:\n");
    printf("x: 4670.46 [km]\n");
    printf("y: 42164.1 [km]\n");
    printf("x_dot: -9.238231 [km/s]\n");
    printf("y_dot: 0 [km/s]\n");
    printf("Finial time: 3\n");
    printf("Would you like to change any of these [yes = 1/no = 2]:");
    scanf("%d", &ans);

    if (ans == 1)
    {
        printf("x: ");
        scanf("%lf", &x5);
        printf("y: ");
        scanf("%lf", &y5);
        printf("x_dot: ");
        scanf("%lf", &x_dot5);
        printf("y_dot: ");
        scanf("%lf", &y_dot5);
        printf("Finial Time: ");
        scanf("%lf", &tf5);

    }

GOBACK: {
    double h = 0.00138;
    double dv = input();
    FILE* datafile;
    datafile = fopen("orbitdata.dat", "w+");
    //Knowns
   double epsilon = 0.0001;
   double y = y5 / 384400;
   double x = x5 / 384400;
   double y_dot = y_dot5 / (1.0183028463);
   double x_dot = (x_dot5 - dv) / (1.0183028463);
   double time = 0;
    if (ans == 'y')
    {

    }
   


    //Vars
    double xk1, xk2, xk3, xk4, xk5, xk6, yk1, yk2, yk3, yk4, yk5, yk6;  
    double xl1, xl2, xl3, xl4, xl5, xl6, yl1, yl2, yl3, yl4, yl5, yl6; 
    double y1, y2;
    double x1, x2;  
    double R;

    double  delta = 0;

    double tf = tf5;

    double x_dot_1, x_dot_2, ydot_1, ydot_2;
    int i = 0;
    double max = 0, min = 0;


    while (time < tf) {
        if (h < tf - time) {
            h = h;
        }
        else {
            h = tf - time;
        }

        yl1 = h * y_dot;
        xl1 = h * x_dot;
        yk1 = h * (y_func(x, y, x_dot));
        xk1 = h * (x_func(x, y, y_dot));

        yl2 = h * (y_dot + yl1 / 4);
        xl2 = h * (x_dot + xl1 / 4);
        yk2 = h * (y_func(x + xk1 / 4, y + yk1 / 4, x_dot + xl1 / 4));
        xk2 = h * (x_func(x + xk1 / 4, y + yk1 / 4, y_dot + yl1 / 4));

        yl3 = h * (y_dot + 3 * yl1 / 32 + 9 * yl2 / 32);
        xl3 = h * (x_dot + 3 * xl1 / 32 + 9 * xl2 / 32);
        yk3 = h * (y_func(x + 3 * xk1 / 32 + 9 * xk2 / 32, y + 3 * yk1 / 32 + 9 *  yk2 / 32, x_dot + 3 * xl1 / 32 + 9 * xl2 / 32));
        xk3 = h * (x_func(x + 3 * xk1 / 32 + 9 * xk2 / 32, y + 3 * yk1 / 32 + 9 *  yk2 / 32, y_dot + 3 * yl1 / 32 + 9 * yl2 / 32));

        yl4 = h * (y_dot + 1932 * yl1 / 2197 - 7200 * yl2 / 2197 + 7296 * yl3 / 2197);
        xl4 = h * (x_dot + 1932 * xl1 / 2197 - 7200 * xl2 / 2197 + 7296 * xl3 / 2197);
        yk4 = h * (y_func(x + 1932 * xk1 / 2197 - 7200 * xk2 / 2197 + 7296 * xk3 / 2197, y + 1932 * yk1 / 2197 - 7200 *  yk2 / 2197 + 7296 * yk3 / 2197, x_dot + 1932 * xl1 / 2197 - 7200 * xl2 / 2197 + 7296 * xl3 / 2197));
        xk4 = h * (x_func(x + 1932 * xk1 / 2197 - 7200 * xk2 / 2197 + 7296 * xk3 / 2197, y + 1932 * yk1 / 2197 - 7200 *  yk2 / 2197 + 7296 * yk3 / 2197, y_dot + 1932 * yl1 / 2197 - 7200 * yl2 / 2197 + 7296 * yl3 / 2197));

        yl5 = h * (y_dot + 439 * yl1 / 216 - 8 * yl2 + 3680 * yl3 / 513 - 845 * yl4 / 4104);
        xl5 = h * (x_dot + 439 * xl1 / 216 - 8 * xl2 + 3680 * xl3 / 513 - 845 * xl4 / 4104);
        yk5 = h * (y_func(x + 439 * xk1 / 216 - 8 * xk2 + 3680 * xk3 / 513 - 845 * xk4 / 4104, y + 439 * yk1 / 216 - 8 *  yk2 + 3680 * yk3 / 513 - 845 * yk4 / 4104, x_dot + 439 * xl1 / 216 - 8 * xl2 + 3680 * xl3 / 513 - 845 * xl4 / 4104));
        xk5 = h * (x_func(x + 439 * xk1 / 216 - 8 * xk2 + 3680 * xk3 / 513 - 845 * xk4 / 4104, y + 439 * yk1 / 216 - 8 *  yk2 + 3680 * yk3 / 513 - 845 * yk4 / 4104, y_dot + 439 * yl1 / 216 - 8 * yl2 + 3680 * yl3 / 513 - 845 * yl4 / 4104));

        yl6 = h * (y_dot - 8 * yl1 / 27 + 2 * yl2 - 3544 * yl3 / 2565 + 1859 * yl4 / 4104 - 11 * yl5 / 40);
        xl6 = h * (x_dot - 8 * xl1 / 27 + 2 * xl2 - 3544 * xl3 / 2565 + 1859 * xl4 / 4104 - 11 * xl5 / 40);
        yk6 = h * (y_func(x - 8 * xk1 / 27 + 2 * xk2 - 3544 * xk3 / 2565 + 1859 * xk4 / 4104 - 11 * xk5 / 40, y - 8 * yk1 / 27 + 2 *  yk2 - 3544 * yk3 / 2565 + 1859 * yk4 / 4104 - 11 * yk5 / 40, x_dot - 8 * xl1 / 27 + 2 * xl2 - 3544 * xl3 / 2565 + 1859 * xl4 / 4104 - 11 * xl5 / 40));
        xk6 = h * (x_func(x - 8 * xk1 / 27 + 2 * xk2 - 3544 * xk3 / 2565 + 1859 * xk4 / 4104 - 11 * xk5 / 40, y - 8 * yk1 / 27 + 2 *  yk2 - 3544 * yk3 / 2565 + 1859 * yk4 / 4104 - 11 * yk5 / 40, y_dot - 8 * yl1 / 27 + 2 * yl2 - 3544 * yl3 / 2565 + 1859 * yl4 / 4104 - 11 * yl5 / 40));

        x1 = x + 25 * xl1 / 216 + 1408 * xl3 / 2565 + 2197 * xl4 / 4104 - xl5 / 5;
        x2 = x + 16 * xl1 / 135 + 6656 * xl3 / 12825 + 28561 * xl4 / 56430 - 9 * xl5 / 50 + 2 * xl6 / 55;

        y1 = y + 25 * yl1 / 216 + 1408 * yl3 / 2565 + 2197 * yl4 / 4104 - yl5 / 5;
        y2 = y + 16 * yl1 / 135 + 6656 * yl3 / 12825 + 28561 * yl4 / 56430 - 9 * yl5 / 50 + 2 * yl6 / 55;

        x_dot_1 = x_dot + 25 * xk1 / 216 + 1408 * xk3 / 2565 + 2197 * xk4 / 4104 - xk5 / 5;
        x_dot_2 = x_dot + 16 * xk1 / 135 + 6656 * xk3 / 12825 + 28561 * xk4 / 56430 - 9 * xk5 / 50 + 2 * xk6 / 55;

        ydot_1 = y_dot + 25 * yk1 / 216 + 1408 * yk3 / 2565 + 2197 * yk4 / 4104 - yk5 / 5;
        ydot_2 = y_dot + 16 * yk1 / 135 + 6656 * yk3 / 12825 + 28561 * yk4 / 56430 - 9 * yk5 / 50 + 2 * yk6 / 55;

        R = pow(y1 - y2, 2) + pow(x1 - x2, 2) + pow(x_dot_1 - x_dot_2, 2) + pow(ydot_1 - ydot_2, 2);
        R = sqrt(R) / h;


        if (h < min) {
            min = h;
        }

        if (h > max) {
            max = h;
        }

        delta = 0.84 * pow(epsilon / R, (1 / 4));
        if (R <= epsilon) {

            time = time + h;
            y = y1;
            x = x1;
            y_dot = ydot_1;
            x_dot = x_dot_1;
            i++;

            data(x, y, datafile);

        }

        else {
            h = delta * h;
        }
    }


    fclose(datafile);
    plotter(datafile);
    stats(max, min, i);

    }
int finished = 0;
printf("To continue type the number '2' and type anything else to quit\n");
scanf("%d", &finished);
if (finished == 2) {
    goto GOBACK;
}
else {
    return 0;
}
}
//deltav ask
double input(void)
{
    double deltav;
    printf("What is the desired dv [km/s]?\n");
    scanf("%lf", &deltav);

    return deltav;
}

//xddot function
double x_func(double x, double y, double ydot)
{
    double  u = 0.01215;
    double xddot;

    xddot = (-((1 - u)*(x - u))) / (pow(cbrt(pow((x - u), 2) + pow(y, 2)),1/3)) - ((u*(x + 1 - u)) / (pow((cbrt(pow(x + (1 - u), 2))),1/3) + pow(y, 2))) + 2 * ydot + x;

    return xddot;
}

//y ddot function
double y_func(double x, double y, double x_dot)
{
    double  u = 0.01215;
    double yddot;

    yddot = (-((1 - u) * (y))) / (pow(cbrt((pow((x - u), 2)) + pow(y, 2)),1/3)) - ((u * y) / (pow(cbrt((pow((x + (1 - u)), 2)) + pow(y, 2)),1/3))) - 2 * x_dot + y;

    return yddot;
}

//To Si convert
void data(double x, double y, FILE* datafile) {
    x = x * 384400;
    y = y * 384400;
    fprintf(datafile, "%lf\t%lf\n", x, y);
}


void plotter(FILE* datafile)
{
    FILE* p = popen("gnuplot -persistent", "w");

    if (p == NULL)
    {
        printf("Error opening pipe to GNU plot.\n");
        exit(0);
    }

    //dumb terminal
    fprintf(p, "set terminal dumb \n");

    fprintf(p, "set style circle \n");
    fprintf(p, "set object circle at  4670.46,0 radius char 1 fillstyle empty border lc rgb '#9900FF' lw 2 \n");
    fprintf(p, "set object circle at  -379729.54,0 radius char 0.5 fillstyle empty border lc rgb '#76A5AF' lw 2 \n");
    fprintf(p, "set title 'Earth Moon synodic Frame'; set xlabel 'S1'; set ylabel 'S2' \n");
    fprintf(p, "plot 'orbitdata.dat'\n");



    fprintf(p, "set terminal png size 1024,768; set output 'xyz.png'\n");

    fprintf(p, "set object circle at  4670.46,0 radius char 1 fillstyle empty border lc rgb '#9900FF' lw 2 \n");
    fprintf(p, "set object circle at  -379729.54,0 radius char 0.5 fillstyle empty border lc rgb '#76A5AF' lw 2 \n");

    fprintf(p, "set title 'Earth-Moon Synodic Frame'; set xlabel 'S1 [km]'; set ylabel 'S2 [km]' \n");
    fprintf(p, "plot 'orbitdata.dat'");

    fclose(p);
}
//printing function
void stats(double max, double min, int i) {
    printf("\nMax step size: %lf \nMin step size: %lf \n", max, min);
    printf("Number of function evaluations used: %d\n", i);
}


