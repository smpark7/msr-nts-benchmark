[Mesh]
  [./fuel_channel]
    type = FileMeshGenerator
    file = fuel_channel.e
  []
  [./square]
    type = FileMeshGenerator
    file = square.e
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
