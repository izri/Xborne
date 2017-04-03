
/*---------------------------------------------*/
/*                                             */
/*partie de Code specifique a  chaque probleme */
/*                                             */
/*---------------------------------------------*/

void InitEtendue()
{
  Min[0] = 0;
  Max[0] = BufferSize;
}


void EtatInitial(E)
int *E;
{
  /*donne a E la valeur de l'etat racine de l'arbre de generation*/
  E[0] = 0;
}


double Probabilite(indexevt, E)
int indexevt;
int *E;
{
  /*
  retourne la probabilite d'apparition de l'evenement  
  variables d'etats :  nombre de clients total
  evenement i : arrivee d'un batch de taille i 
 */
double p;
if (indexevt==1) {p=0.7;} else {p=0.3/GroupSize;}
return p;
}



void Equation(E, indexevt, F, R)
int *E;
int indexevt;
int *F, *R;
{
  /*ecriture de l'equation d'evolution, transformation de E en F grace
  a l'evenemnt indexevt, mesure de la recompense R sur cette transition*/

  /*variables d'etats : nombre de clients dans le buffer
  evenements: taille du batch +1. 
  */
  if (E[0]>0) {
    F[0]=E[0]-1+indexevt-1;
  }
  else {F[0]=indexevt-1;}

  if (F[0]>Max[0]) {R[0]=F[0]-Max[0]; F[0]=Max[0];}
    else {R[0]=0;}
}


void InitParticuliere()
{
}
