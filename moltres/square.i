[Mesh]
  [./square]
    type = GeneratedMeshGenerator
    dim = 2
    nx = 10
    ny = 10
    xmin = -5.0
    xmax = 5.0
    ymin = -5.0
    ymax = 5.0
  []
  [./rename_boundary]
    type = RenameBoundaryGenerator
    input = square
    old_boundary = '0 1 2 3'
    new_boundary = '2 3 4 1'
  []
[]
