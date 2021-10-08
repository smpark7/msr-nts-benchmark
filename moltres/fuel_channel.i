[Mesh]
  [./fuel_channel]
    type = FileMeshGenerator
    file = concentric_mesh.e
  []
  [./rename_block]
    type = RenameBlockGenerator
    input = fuel_channel
    old_block_id = '1 2'
    new_block_name = 'fuel mod'
  []
[]
