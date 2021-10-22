#!/bin/bash
# Neutron energy group refinement study
inner=1
outer=3
sectors=10
sides=$(($outer * 2 + $sectors + 2))

# aprun -n 1 /u/sciteam/park2/projects/moltres-latest/moltres-opt -i /u/sciteam/park2/msr-nts-benchmark/moltres/full_mesh.i Mesh/concentric_circle/num_sectors=$sectors Mesh/concentric_circle/rings="'$inner $outer'" Mesh/generated_mesh/nx=$sides Mesh/generated_mesh/ny=$sides --mesh-only full_mesh.e

for n in 14 16
do
    aprun -n 128 /u/sciteam/park2/projects/moltres-latest/moltres-opt -i /u/sciteam/park2/msr-nts-benchmark/moltres/nts-cas$n.i 2>&1 | tee nts-cas$n.out
done
