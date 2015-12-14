################################################################################
# Ecologie Numerique 2015-2016
# M. Bruhin & M. Mentha / EPFL - 14.09.2015
# [TITRE]
################################################################################

setwd('C:/Users/max/Documents/cours MA3/Ecologie numérique/projet/EcolnumProject/creation_matrice_espece')

################################################################################
#Import de la matrice espece et de la matrice environnement
################################################################################

#----------------------
#Matrice espece
#----------------------

spe = read.table("matrice_espece.dat")

setwd('C:/Users/max/Documents/cours MA3/Ecologie numérique/projet/EcolnumProject/creation_matrice_environnement')

env = read.table("treated_env.dat")
