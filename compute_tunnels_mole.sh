#!/bin/bash

cd /storage/plzen1/home/${USER}  

echo "Current directory: "; pwd # print current path

echo

XML_SOURCE="/storage/plzen1/home/${USER}/test_ignore_het_atoms-AF.xml"  # cesta k vzorovemu XML
MOLE_PATH="/storage/brno12-cerit/home/${USER}/TunnelsServer/mole2.exe"  # cesta k mole2.exe

for folder in pdb_alphamissence_alphafill/* ; do  # pro kazdou slozku provede nasledujici

	echo "======================================== NEXT FOLDER: /$folder ========================================"
	echo


	for file in "./$folder"*; do # for every file in folder
		
		[[ -d $file ]] && continue # skip existing folders
		
		[[ $file == *.json ]] && continue # skip json file
		
		if [[ $file == *.gz ]]; then # unzip .gz
			if [[ ${file%.*} != *.cif ]]; then
			echo "EXTRACTING $file..."
			gunzip -k $file
			fi
			
		fi
		
		echo
		echo "$file" # print name of file
		echo
		
		NEW_FOLDER="${file%%.cif*}"
		echo ">>>>>> $NEW_FOLDER"
		WORKING_DIR="/storage/plzen1/home/${USER}/alphamissence_tunnels_CYP_result/alphafill/${NEW_FOLDER#./}_result"
		echo ">>>>>> $WORKING_DIR"

		sed "s&\(<Input>\).*\(</Input>\)&\1${file}\2&;s&\(<WorkingDirectory>\).*\(</WorkingDirectory>\)&\1${WORKING_DIR}\2&" $XML_SOURCE > AF_temp_input.xml # change XML file to protein structure
		
		
		mono $MOLE_PATH  AF_temp_input.xml # run MOLE
		
		echo "-----------------------------------------------------------------------------------------------"
	done
	echo
	echo "========================================FOLDER FINISHED========================================"

done
echo "Current directory: "; pwd

echo
echo "DONE. ENJOY YOUR DAY :)"
echo


