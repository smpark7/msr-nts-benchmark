[Mesh]
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
    inputs = 'square square'
    pattern = '1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
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
  [./fuel_block]
    type = SubdomainBoundingBoxGenerator
    input = outer_block
    bottom_left = '0 80 0'
    top_right = '80 160 0'
    block_id = 1
    block_name = fuel
    location = inside
    restricted_subdomains = '0'
  []
[]
