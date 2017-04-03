#!/bin/bash

SIM_DIR=$PWD
#created 18/03/2017 by Nora IZRI
#modif 21/03/2017

echo $1 
#récupération du premier argument d'entrée lors du lancement du shell 
model=$1
res="res.txt"
#"batch"
clean="cleanModel.sh"

	#nettoyage de l'espace de travail
	chmod +x $clean
	#./$clean
#ls $1.* > $res # à utiliser uniquement si la création du dossier associé au nom du model est supprimer (voir les lignes 54 et 55 de ce script)
ls $1* > $res
 
if [ -s $res ]; then
  	echo "fichier non vide"
	echo "Fichiers du modèle déjà existances"
else
	echo "fichier vide"
	#  #model generation
	#make -f MakefileXborne
	gcc -Wall -o generMarkov generMarkov.c
	./generMarkov -f $model


	#  #la résolution de la chaîne
	gcc -o gthLD gthLD.c 
	./gthLD -f $model Rii
 	
	#génération du fichier tgf pour une utilisation sous yEd --> graphe
	gcc -o tgf Lam2TGF.c
	./tgf -f $model

 	 
	#   #récompenses des indices
		#funReward.c
		#rewardIndice.c
		#rewardComponent.c
		#Marginal.c

	#calcul des marginales
	gcc -o marg Marginal.c
	./marg -f $model

	#calcul des récompenses
	gcc -o rewardIndice rewardIndice.c
	./rewardIndice -f $model  

	mkdir $model
	mv $model.* $model
fi     
