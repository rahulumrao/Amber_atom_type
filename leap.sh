#!/bin/bash

INPUT=aladi_1.pdb
OUTPUT=2_aladi.pdb

#!---------------------------------------------------------------------------
#! 	DO NOT CHANGE ANYTHING BELOW THIS LINE
#!---------------------------------------------------------------------------

# Create PDB files with pdb4amber such that it formatted according to AMBER
# https://ambermd.org/tutorials/basic/tutorial9/index.php

pdb4amber -i $INPUT  -o 1_aladi.pdb

# Using Antechamber to Create prmtop, inpcrd, and mol2 files for the simulations
# http://ambermd.org/tutorials/basic/tutorial4b/

antechamber -i 1_aladi.pdb -fi pdb -o 1_aladi.mol2 -fo mol2 -c bcc -s 2

# Use the parmchk utility to test if all the parameters we require are available.

parmchk2 -i 1_aladi.mol2 -f mol2 -o 1_aladi.frcmod

# Creating topology and coordinate files using 'tlep'

cat > leap.in << EOF

source oldff/leaprc.ff99SB
source leaprc.gaff

SUS = loadmol2 1_aladi.mol2
check SUS
loadamberparams 1_aladi.frcmod
saveoff SUS 1_aladi.lib 
saveamberparm SUS 1_aladi.prmtop 1_aladi.rst7
savepdb SUS $OUTPUT 				#2_aladi.pdb
quit()
EOF

tleap -f leap.in
