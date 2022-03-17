[Mesh]
  uniform_refine = 1
  [./concentric_circle]
    type = ConcentricCircleMeshGenerator
    num_sectors = 2
    radii = '1.7'
    rings = '1 1'
    has_outer_square = on
    pitch = 10
    preserve_volumes = off
    smoothing_max_it = 3
  [../]
  [./fuel_channel]
    type = RenameBlockGenerator
    input = concentric_circle
    old_block_id = '1 2'
    new_block_name = 'fuel mod'
  []

  [./generated_mesh]
    type = GeneratedMeshGenerator
    dim = 2
    nx = 6
    ny = 6
    xmin = -5.0
    xmax = 5.0
    ymin = -5.0
    ymax = 5.0
  []
  [./square]
    type = RenameBoundaryGenerator
    input = generated_mesh
    old_boundary = '0 1 2 3'
    new_boundary = '2 3 4 1'
  []

  [./full_mesh]
    type = PatternedMeshGenerator
    inputs = 'fuel_channel square'
    pattern = '0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 ;
               0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 ;
               0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 ;
               0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 ;
               0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 ;
               0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 ;
               0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 ;
               0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1'
    x_width = 10
    y_width = 10
  []

  [./transform]
    type = TransformGenerator
    input = full_mesh
    transform = translate_min_origin
  []
  [./outer_block]
    type = SubdomainBoundingBoxGenerator
    input = transform
    bottom_left = '0 0 0'
    top_right = '160 160 0'
    block_id = 0
    block_name = outer
    location = inside
    restricted_subdomains = '0'
  []
[]
