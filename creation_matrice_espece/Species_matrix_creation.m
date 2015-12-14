clear all;

[num,txt,raw] = xlsread('treated_species_data_20102011.xlsx');

%Mesures � int�grer dans la matrice esp�ce
count=num;

%Coordonn�es (esp�ce et objet) des mesures
PaddockID=cellstr(raw(2:552,1));
Species_abr=cellstr(raw(2:552,2));

%Objets
PaddockID_sd=cellstr(raw(2:19, 4));

%Esp�ces
Species_abr_sd=cellstr(raw(2:28, 5));

%Matrice esp�ce
Species_matrix=zeros(length(PaddockID_sd), length(Species_abr_sd));
number_of_countings=zeros(length(PaddockID_sd), length(Species_abr_sd));
for i=1:length(count)
    for j=1:length(PaddockID_sd)
        for k=1:length(Species_abr_sd)
            if (isequal(PaddockID(i), PaddockID_sd(j)) && isequal(Species_abr(i), Species_abr_sd(k)))
                Species_matrix(j, k)=Species_matrix(j, k)+count(i);
            end
        end
    end
end

%l'op�ration suivante permet de faire la moyenne des nombre d'individus
%d'une esp�ce compt� sur chaque transects d'un certain paddock pendant une 
%certaine ann�e.
Species_matrix=Species_matrix./3;

%Matrice esp�ce avec esp�ces en premi�re ligne et objest en premi�re colonne
Species_matrix_labelled{1, 1}=' ';
for i=1:length(Species_abr_sd)
    Species_matrix_labelled{1, i+1}=Species_abr_sd{i};
end

for i=1:length(PaddockID_sd)
    Species_matrix_labelled{i+1, 1}=PaddockID_sd{i};
end

for j=2:length(Species_abr_sd)+1
    for i=2:length(PaddockID_sd)+1
        Species_matrix_labelled{i, j}=Species_matrix(i-1, j-1);
    end
end


fileID = fopen('matrice_espece.dat','w');
[nrows,ncols] = size(Species_matrix_labelled);

fprintf(fileID, '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s\n', Species_matrix_labelled{1,:});


for row = 2:nrows
    fprintf(fileID,'%s %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f\n',Species_matrix_labelled{row,:});
end
fclose(fileID);
