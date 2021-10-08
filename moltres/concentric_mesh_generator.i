[Mesh]
  [./concentric_mesh]
    type = ConcentricCircleMeshGenerator
    num_sectors = 4
    radii = '1.7'
    rings = '1 2'
    has_outer_square = on
    pitch = 10
    preserve_volumes = off
    smoothing_max_it = 3
  [../]
[]
