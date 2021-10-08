#!/bin/bash

echo "Mesh concentric_mesh_generator.i"
~/projects/moltres/moltres-opt -i concentric_mesh_generator.i --mesh-only concentric_mesh.e
echo
echo "Mesh fuel_channel.i"
~/projects/moltres/moltres-opt -i fuel_channel.i --mesh-only fuel_channel.e
echo
echo "Mesh square.i"
~/projects/moltres/moltres-opt -i square.i --mesh-only square.e
echo
echo "Mesh full_mesh.i"
~/projects/moltres/moltres-opt -i full_mesh.i --mesh-only full_mesh.e
echo
echo "Delete intermediate mesh files"
rm concentric_mesh.e fuel_channel.e square.e
echo
