#for f in `ls cd44/*.pdb`; do grep -i ATOM $f > ${f:0:-4}_atoms.pdb ; done
#for f in `ls tsg6/*.pdb`; do grep -i ATOM $f > ${f:0:-4}_atoms.pdb ; done

#for f in `ls cd44/*_atoms.pdb`; do ./hdock tsg6/*_atoms.pdb $f -out ${f:0:-4}.out ; done
for f in `ls *.out`; do mkdir ${f:0:-4}; done
for f in `ls *.out`; do cp $f ${f:0:-4}; done

for f in `ls *.out`; do cd ${f:0:-4}; ../createpl *.out top100.pdb -nmax 100 -complex -models; rename s/model/${f:0:-4}/g *.pdb; done

