/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Ricardo
 * Creation Date: 7 Dec 2018 at 21:18:52
 *********************************************/
// Numero de nodos
int n = ...;

// Tempo de retardamento
int r = 8;

// Número de recursos
int nr = 8;

// Nodo de ignição
int i = 1;

// Nodo a proteger
int p = 49;

// Custos do arco o->d
int c[1..n][1..n] = ...;

// Vars de decisao
dvar int b[1..n];
dvar int t[1..n];

// Funcao objetivo
maximize t[p];

// Restrições
subject to {

	forall (j in 1..n, k in 2..n) 
		t[k] <= t[j] + c[j][k] + (b[j]*r);
	
	//O nr não pode ser excedido
	sum(j in 1..n) b[j] <= nr;
	
	t[i] == 0;
	
	b[p] == 0;
	
	//Valores que b[j] pode assumir	
	forall(j in 1..n) b[j] <= 1;
	forall(j in 1..n) b[j] >= 0;
	
	//Não negatividade
	forall(j in 1..n) t[j] >= 0;
	
		
}