/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Ricardo
 * Creation Date: 6 Dec 2018 at 13:30:21
 *********************************************/
// Número de nodos
int n=...;

range o = 1..n;
range d = 1..n;

// Custos do arco o->d
int c[o][d]=...;

// Vars de decisão
dvar int y[1..n];

// Função objetivo
maximize ((n-1)*y[1] + sum(i in 2..n)y[i]);

// Restrições
subject to {

	forall (i in 1..n, j in 2..n)
	  	y[j] - y[i] <= c[i][j];
	
	y[1] == 0;

	forall (i in 1..n) 	
		y[i] >= 0;
		
}