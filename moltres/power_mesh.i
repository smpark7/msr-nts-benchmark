[Mesh]
  [./file_mesh]
    type = FileMeshGenerator
    file = full_mesh.e
  []
  [./channel11]
    type = SubdomainBoundingBoxGenerator
    input = file_mesh
    bottom_left = '0 150 0'
    top_right = '10 160 0'
    block_id = 3
    block_name = fuel11
    location = inside
    restricted_subdomains = '1'
  []
  [./channel12]
    type = SubdomainBoundingBoxGenerator
    input = channel11
    bottom_left = '10 150 0'
    top_right = '20 160 0'
    block_id = 4
    block_name = fuel12
    location = inside
    restricted_subdomains = '1'
  []
  [./channel13]
    type = SubdomainBoundingBoxGenerator
    input = channel12
    bottom_left = '20 150 0'
    top_right = '30 160 0'
    block_id = 5
    block_name = fuel13
    location = inside
    restricted_subdomains = '1'
  []
  [./channel14]
    type = SubdomainBoundingBoxGenerator
    input = channel13
    bottom_left = '30 150 0'
    top_right = '40 160 0'
    block_id = 6
    block_name = fuel14
    location = inside
    restricted_subdomains = '1'
  []
  [./channel15]
    type = SubdomainBoundingBoxGenerator
    input = channel14
    bottom_left = '40 150 0'
    top_right = '50 160 0'
    block_id = 7
    block_name = fuel15
    location = inside
    restricted_subdomains = '1'
  []
  [./channel16]
    type = SubdomainBoundingBoxGenerator
    input = channel15
    bottom_left = '50 150 0'
    top_right = '60 160 0'
    block_id = 8
    block_name = fuel16
    location = inside
    restricted_subdomains = '1'
  []
  [./channel17]
    type = SubdomainBoundingBoxGenerator
    input = channel16
    bottom_left = '60 150 0'
    top_right = '70 160 0'
    block_id = 9
    block_name = fuel17
    location = inside
    restricted_subdomains = '1'
  []
  [./channel18]
    type = SubdomainBoundingBoxGenerator
    input = channel17
    bottom_left = '70 150 0'
    top_right = '80 160 0'
    block_id = 10
    block_name = fuel18
    location = inside
    restricted_subdomains = '1'
  []
  [./channel22]
    type = SubdomainBoundingBoxGenerator
    input = channel18
    bottom_left = '10 140 0'
    top_right = '20 150 0'
    block_id = 11
    block_name = fuel22
    location = inside
    restricted_subdomains = '1'
  []
  [./channel23]
    type = SubdomainBoundingBoxGenerator
    input = channel22
    bottom_left = '20 140 0'
    top_right = '30 150 0'
    block_id = 12
    block_name = fuel23
    location = inside
    restricted_subdomains = '1'
  []
  [./channel24]
    type = SubdomainBoundingBoxGenerator
    input = channel23
    bottom_left = '30 140 0'
    top_right = '40 150 0'
    block_id = 13
    block_name = fuel24
    location = inside
    restricted_subdomains = '1'
  []
  [./channel25]
    type = SubdomainBoundingBoxGenerator
    input = channel24
    bottom_left = '40 140 0'
    top_right = '50 150 0'
    block_id = 14
    block_name = fuel25
    location = inside
    restricted_subdomains = '1'
  []
  [./channel26]
    type = SubdomainBoundingBoxGenerator
    input = channel25
    bottom_left = '50 140 0'
    top_right = '60 150 0'
    block_id = 15
    block_name = fuel26
    location = inside
    restricted_subdomains = '1'
  []
  [./channel27]
    type = SubdomainBoundingBoxGenerator
    input = channel26
    bottom_left = '60 140 0'
    top_right = '70 150 0'
    block_id = 16
    block_name = fuel27
    location = inside
    restricted_subdomains = '1'
  []
  [./channel28]
    type = SubdomainBoundingBoxGenerator
    input = channel27
    bottom_left = '70 140 0'
    top_right = '80 150 0'
    block_id = 17
    block_name = fuel28
    location = inside
    restricted_subdomains = '1'
  []
  [./channel33]
    type = SubdomainBoundingBoxGenerator
    input = channel28
    bottom_left = '20 130 0'
    top_right = '30 140 0'
    block_id = 18
    block_name = fuel33
    location = inside
    restricted_subdomains = '1'
  []
  [./channel34]
    type = SubdomainBoundingBoxGenerator
    input = channel33
    bottom_left = '30 130 0'
    top_right = '40 140 0'
    block_id = 19
    block_name = fuel34
    location = inside
    restricted_subdomains = '1'
  []
  [./channel35]
    type = SubdomainBoundingBoxGenerator
    input = channel34
    bottom_left = '40 130 0'
    top_right = '50 140 0'
    block_id = 20
    block_name = fuel35
    location = inside
    restricted_subdomains = '1'
  []
  [./channel36]
    type = SubdomainBoundingBoxGenerator
    input = channel35
    bottom_left = '50 130 0'
    top_right = '60 140 0'
    block_id = 21
    block_name = fuel36
    location = inside
    restricted_subdomains = '1'
  []
  [./channel37]
    type = SubdomainBoundingBoxGenerator
    input = channel36
    bottom_left = '60 130 0'
    top_right = '70 140 0'
    block_id = 22
    block_name = fuel37
    location = inside
    restricted_subdomains = '1'
  []
  [./channel38]
    type = SubdomainBoundingBoxGenerator
    input = channel37
    bottom_left = '70 130 0'
    top_right = '80 140 0'
    block_id = 23
    block_name = fuel38
    location = inside
    restricted_subdomains = '1'
  []
  [./channel44]
    type = SubdomainBoundingBoxGenerator
    input = channel38
    bottom_left = '30 120 0'
    top_right = '40 130 0'
    block_id = 24
    block_name = fuel44
    location = inside
    restricted_subdomains = '1'
  []
  [./channel45]
    type = SubdomainBoundingBoxGenerator
    input = channel44
    bottom_left = '40 120 0'
    top_right = '50 130 0'
    block_id = 25
    block_name = fuel45
    location = inside
    restricted_subdomains = '1'
  []
  [./channel46]
    type = SubdomainBoundingBoxGenerator
    input = channel45
    bottom_left = '50 120 0'
    top_right = '60 130 0'
    block_id = 26
    block_name = fuel46
    location = inside
    restricted_subdomains = '1'
  []
  [./channel47]
    type = SubdomainBoundingBoxGenerator
    input = channel46
    bottom_left = '60 120 0'
    top_right = '70 130 0'
    block_id = 27
    block_name = fuel47
    location = inside
    restricted_subdomains = '1'
  []
  [./channel48]
    type = SubdomainBoundingBoxGenerator
    input = channel47
    bottom_left = '70 120 0'
    top_right = '80 130 0'
    block_id = 28
    block_name = fuel48
    location = inside
    restricted_subdomains = '1'
  []
  [./channel55]
    type = SubdomainBoundingBoxGenerator
    input = channel48
    bottom_left = '40 110 0'
    top_right = '50 120 0'
    block_id = 29
    block_name = fuel55
    location = inside
    restricted_subdomains = '1'
  []
  [./channel56]
    type = SubdomainBoundingBoxGenerator
    input = channel55
    bottom_left = '50 110 0'
    top_right = '60 120 0'
    block_id = 30
    block_name = fuel56
    location = inside
    restricted_subdomains = '1'
  []
  [./channel57]
    type = SubdomainBoundingBoxGenerator
    input = channel56
    bottom_left = '60 110 0'
    top_right = '70 120 0'
    block_id = 31
    block_name = fuel57
    location = inside
    restricted_subdomains = '1'
  []
  [./channel58]
    type = SubdomainBoundingBoxGenerator
    input = channel57
    bottom_left = '70 110 0'
    top_right = '80 120 0'
    block_id = 32
    block_name = fuel58
    location = inside
    restricted_subdomains = '1'
  []
  [./channel66]
    type = SubdomainBoundingBoxGenerator
    input = channel58
    bottom_left = '50 100 0'
    top_right = '60 110 0'
    block_id = 33
    block_name = fuel66
    location = inside
    restricted_subdomains = '1'
  []
  [./channel67]
    type = SubdomainBoundingBoxGenerator
    input = channel66
    bottom_left = '60 100 0'
    top_right = '70 110 0'
    block_id = 34
    block_name = fuel67
    location = inside
    restricted_subdomains = '1'
  []
  [./channel68]
    type = SubdomainBoundingBoxGenerator
    input = channel67
    bottom_left = '70 100 0'
    top_right = '80 110 0'
    block_id = 35
    block_name = fuel68
    location = inside
    restricted_subdomains = '1'
  []
  [./channel77]
    type = SubdomainBoundingBoxGenerator
    input = channel68
    bottom_left = '60 90 0'
    top_right = '70 100 0'
    block_id = 36
    block_name = fuel77
    location = inside
    restricted_subdomains = '1'
  []
  [./channel78]
    type = SubdomainBoundingBoxGenerator
    input = channel77
    bottom_left = '70 90 0'
    top_right = '80 100 0'
    block_id = 37
    block_name = fuel78
    location = inside
    restricted_subdomains = '1'
  []
  [./channel88]
    type = SubdomainBoundingBoxGenerator
    input = channel78
    bottom_left = '70 80 0'
    top_right = '80 90 0'
    block_id = 38
    block_name = fuel88
    location = inside
    restricted_subdomains = '1'
  []
[]