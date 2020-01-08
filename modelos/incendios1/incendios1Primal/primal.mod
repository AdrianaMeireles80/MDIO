/*********************************************
 * OPL 12.8.0.0 Model
 * Author: 
 * Creation Date: 5 Dec 2018 at 09:54:56
 *********************************************/
// Números de nodos
int n=...;

range o = 1..n;
range d = 1..n;

// Custos do arco o->d
int c[o][d]=...;

// Var de decisão 
dvar int x[o][d];

// Função objetivo
minimize ( sum (i in o,j in d) x[i][j]*c[i][j] );

// Restrições
subject to {
	
	nodo_proprio:
	forall (i in 1..n)
	  x[i][i] == 0;
	
	caminhos_nodo_1:
	sum (j in 2..n) (x[1][j] - x[j][1]) == n-1;
	
	caminhos_outros_nodos:
	forall (i in 2..n)	
		sum (j in 1..n) (x[i][j] - x[j][i]) == -1;
	
	todos_positivos: 
	forall (i in 1..n,j in 1.. n)
	  x[i][j]>=0;
}