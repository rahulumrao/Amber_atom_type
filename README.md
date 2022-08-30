# Get the AMBER atom type for a PDB file

```diff
To perform the QM/MM simulation in some package using AMBER forcefield for MM region atoms,
we usually need atom type information which amber can understand, otherwise we will get error in the calculation. 

The best way to get the atom type information is to get the PDB file from database.
```
[https://www.rcsb.org/].
```diff
For some reason let say we needed to modify the PDB file or the PDB in no avialable in database, 
in such case below mentioned method can be followed :
```

# Here are the two possible ways to fix this:

# 1. GaussView 
[https://gaussian.com/gaussview6/]

```diff
Just open the PDB file, then go to Atom Editor List, then Show MM Type.
It will printout the atom type for various forcefield (Mainly, UFF, Dreiding, AMBER).
Use this information of atom type for QM/MM caluclation.

Ex. Atom type

Row  Highlight Display  Tag  Symbol    NA      NB       NC      Bond            Angle           Dihedral   UFF Type  Dreiding Type  AMBER Type  MM Charge   AMBER Fragment
1       No      Show    1       H                                                                               H_      H_            HC        0.1123000       ACE
2       No      Show    2       C       1                       1.1112254                                       C_3     C_3           C3        -0.3662000      ACE
3       No      Show    3       H       2       1               1.1101486       109.0229829                     H_      H_            HC        0.1123000       ACE
4       No      Show    4       H       2       1       3       1.1097198       108.2239454     -118.6956357    H_      H_            HC        0.1123000       ACE
5       No      Show    5       C       2       1       4       1.5003350       110.2666327     -120.9516047    C_R     C_R           C         0.5972000       ACE
.
.
.

- Before using this list :: Make a comparison of the atom type from the AMBER parameter file 
- just to make sure it is not giving wrong type to atoms.
```

# 2. Using Amber Package Itself 
[https://ambermd.org/]

```diff
A bash script file is given in this folder which will do everything for you 
Only change the 'INPUT' and 'OUTPUT' variable according to your inputs.

Details of used module can be found in the AMBER manual with the link given. 
Just for the breaf discription the main module is 'amtechamber' which will generate a 'mol2' file 
This mol2 file will have the atom type information according to AMBER forcefield, which further can be used for the calculations.

Ex. mol2 File 

@<TRIPOS>MOLECULE
X
   22    21     1     0     0
SMALL
bcc


@<TRIPOS>ATOM
      1 H            3.0820     0.6350    -1.3020 hc         1 X         0.068700
      2 C            2.7550     1.6180    -0.9000 c3         1 X        -0.174100
      3 H1           2.0930     1.4490    -0.0250 hc         1 X         0.068700
      4 H2           2.1850     2.1450    -1.6930 hc         1 X         0.068700
      5 C1           3.9450     2.4300    -0.4810 c          1 X         0.657100
.
.
.

- Before using this list :: Make a comparison of the atom type from the AMBER parameter file 
- just to make sure it is not giving wrong type to atoms.
```

## An Powepoint file is also avialable in the folder showing the stesps involves
