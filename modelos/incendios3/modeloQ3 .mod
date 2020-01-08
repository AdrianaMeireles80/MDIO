/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Ricardo
 * Creation Date: 9 Dec 2018 at 16:36:25
 *********************************************/

int n = 49;

int nr = 8;

int r = 8;

int d = 15; /*horizonte temporal*/

float p[1..n]; /* probabilidade de ignicao do nodo K */

// Função que calcula as probabilidades;
execute{
	var h = 1;
	for(var e = 1; e<=7; e++){
		for(var f = 1; f<=7; f++){
			p[h] = (14-e-f)/500;
			h++;
		}
	}
}

float c[1..n][1..n] = ...; /*tempo de propagacao do arco de origem i para o nodo k*/

// Varivavel de decisao
dvar int+ t[1..n][1..n];
dvar boolean b[1..n];
dvar boolean z[1..n][1..n];

// Função objetivo
minimize sum (i in 1..n, j in 1..n) z[i][j]*p[i];

// Restrições
subject to{	
	
	forall(i in 1..n, j in 1..n, k in 1..n) t[i][j] <= t[i][k] + c[k][j] + (b[i]*r);	
	
	forall(i in 1..n, j in 1..n) z[i][j] >= (d - t[i][j])/d;
	
	sum(i in 1..n) b[i] <= nr;
	
	forall(i in 1..n) t[i][i] == 0;
		
}