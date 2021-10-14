#!/bin/bash
# Mesh refinement study
for (( inner = 1; inner <= 3; inner++))
do
    for (( outer = 1; outer <= 3; outer++))
    do
        for (( sector_id = 1; sector_id <= 3; sector_id++))
	do
            sectors=$(( $sector_id * 2))
            sides=$(($outer * 2 + $sectors + 2))
            id="${inner}${outer}${sectors}"
            aprun -n 1 /u/sciteam/park2/projects/moltres-latest/moltres-opt -i /u/sciteam/park2/msr-nts-benchmark/moltres/full_mesh.i Mesh/concentric_circle/num_sectors=$sectors Mesh/concentric_circle/rings="'$inner $outer'" Mesh/generated_mesh/nx=$sides Mesh/generated_mesh/ny=$sides --mesh-only full_mesh.e
            aprun -n 32 /u/sciteam/park2/projects/moltres-latest/moltres-opt -i /u/sciteam/park2/msr-nts-benchmark/moltres/nts.i 2>&1 | tee nts-$id.out
	done
    done
done
