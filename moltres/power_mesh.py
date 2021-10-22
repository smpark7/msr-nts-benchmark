with open("power_mesh.i", "w") as f:
    f.write("[Mesh]\n")
    f.write("  [./file_mesh]\n")
    f.write("    type = FileMeshGenerator\n")
    f.write("    file = full_mesh.e\n")
    f.write("  []\n")
    input = "file_mesh"
    blk_id = 3
    for i in range(1,9):
        for j in range(1,9):
            if j < i:
                continue
            i_s, j_s = str(i), str(j)
            header = "channel" + i_s + j_s
            bl_x, bl_y = 0 + (j-1) * 10, 160 - i * 10
            tr_x, tr_y = 0 + j * 10, 160 - (i-1) * 10
            f.write("  [./" + header + "]\n")
            f.write("    type = SubdomainBoundingBoxGenerator\n")
            f.write("    input = " + input + "\n")
            f.write("    bottom_left = '" + str(bl_x) + " " + str(bl_y)
                    + " 0'\n")
            f.write("    top_right = '" + str(tr_x) + " " + str(tr_y)
                    + " 0'\n")
            f.write("    block_id = " + str(blk_id) + "\n")
            f.write("    block_name = fuel" + i_s + j_s + "\n")
            f.write("    location = inside\n")
            f.write("    restricted_subdomains = '1'\n")
            f.write("  []\n")
            input = header
            blk_id += 1
    f.write("[]")

with open("power_postprocessor.i", "w") as f:
    for i in range(1,9):
        for j in range(1,9):
            if j < i:
                continue
            i_s, j_s = str(i), str(j)
            header = "channel" + i_s + j_s
            f.write("  [./" + header + "]\n")
            f.write("    type = ElmIntegTotFissHeatPostprocessor\n")
            f.write("    block = 'fuel" + i_s + j_s + "'\n")
            f.write("  []\n")
