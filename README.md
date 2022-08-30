# Get the AMBER atom type for a PDB file

```diff
To perform the QM/MM simulation in package using AMBER forcefield for MM region ,
we need atom type information which amber understand Otherwise we will get error in the calculation. 

The best way is to get the PDB file from database
```
[https://www.rcsb.org/].
```diff
For some reason let say we needed to modify the PDB file or the PDB in no avialable in database, 
in such case the mentioned method can be followd :
```

# Here are the two possible ways to fix this:

# 1. GaussView 
[https://gaussian.com/gaussview6/]

```diff
Just open the PDB file, then go to Atom Editor List, then Show MM Type.
It will printout the atom type for various forcefield (Mainly, UFF, Dreiding, AMBER).

- Before using this list :: Make a comparison of the atom type from the AMBER parameter file 
just to make sure it is not giving wrong type to atoms.
```

# 2. Using Amber package itself 
[https://ambermd.org/]

```diff
A bash script file is given in this folder which will do everything for you 
Only change the 'INPUT' and 'OUTPUT' variable according to your inputs.

Details of used module can be found in the AMBER manual with the link given. 
Just for the breaf discription the main module is 'amtechamber' which will generate a 'mol2' file 
This mol2 file will have the atom type information acoording to AMBER forcefield 
which can ve used for the caluclations.

- Before using this list :: Make a comparison of the atom type from the AMBER parameter file 
just to make sure it is not giving wrong type to atoms.
```
