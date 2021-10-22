[GlobalParams]
  num_groups = 12
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'group1 group2 group3 group4 group5 group6 group7 group8 group9 group10 group11 group12'
  pre_concs = 'pre1 pre2 pre3 pre4 pre5 pre6 pre7 pre8'
  temperature = 900
  sss2_input = true
  account_delayed = true
[../]

[Mesh]
  [./file_mesh]
    type = FileMeshGenerator
    file = power_mesh.e
  []
[]

[Problem]
  type = FEProblem
[]

[Nt]
  var_name_base = group
  vacuum_boundaries = 'bottom right'
  create_temperature_var = false
  eigen = true
  transient = false
  pre_blocks = 'fuel fuel11 fuel12 fuel13 fuel14 fuel15 fuel16 fuel17 fuel18 fuel22 fuel23 fuel24 fuel25 fuel26 fuel27 fuel28 fuel33 fuel34 fuel35 fuel36 fuel37 fuel38 fuel44 fuel45 fuel46 fuel47 fuel48 fuel55 fuel56 fuel57 fuel58 fuel66 fuel67 fuel68 fuel77 fuel78 fuel88'
[]

[Precursors]
  [./pres]
    var_name_base = pre
    block = 'fuel fuel11 fuel12 fuel13 fuel14 fuel15 fuel16 fuel17 fuel18 fuel22 fuel23 fuel24 fuel25 fuel26 fuel27 fuel28 fuel33 fuel34 fuel35 fuel36 fuel37 fuel38 fuel44 fuel45 fuel46 fuel47 fuel48 fuel55 fuel56 fuel57 fuel58 fuel66 fuel67 fuel68 fuel77 fuel78 fuel88'
    outlet_boundaries = ''
    constant_velocity_values = true
    u_def = 0
    v_def = 0
    w_def = 0
    nt_exp_form = false
    family = MONOMIAL
    order = CONSTANT
    loop_precursors = false
    transient = false
    eigen = true
  [../]
[]

[Materials]
  [./fuel]
    type = MoltresJsonMaterial
    base_file = '../xsdata/msr_XS_cas12.json'
    block = 'fuel fuel11 fuel12 fuel13 fuel14 fuel15 fuel16 fuel17 fuel18 fuel22 fuel23 fuel24 fuel25 fuel26 fuel27 fuel28 fuel33 fuel34 fuel35 fuel36 fuel37 fuel38 fuel44 fuel45 fuel46 fuel47 fuel48 fuel55 fuel56 fuel57 fuel58 fuel66 fuel67 fuel68 fuel77 fuel78 fuel88'
    material_key = 'fuel'
    interp_type = 'spline'
    prop_names = ''
    prop_values = ''
  [../]
  [./mod]
    type = MoltresJsonMaterial
    base_file = '../xsdata/msr_XS_cas12.json'
    block = mod
    material_key = 'moder'
    interp_type = 'spline'
    prop_names = ''
    prop_values = ''
  [../]
  [./outer]
    type = MoltresJsonMaterial
    base_file = '../xsdata/msr_XS_cas12.json'
    block = outer
    material_key = 'reflector'
    interp_type = 'spline'
    prop_names = ''
    prop_values = ''
  [../]
[]

[Executioner]
  type = InversePowerMethod
  max_power_iterations = 50

  # fission power normalization settings
  normalization = 'powernorm'
  normal_factor = 64e3           # Linear power of quarter core = 256 / 4 = 64 kW/cm
  # Tiberga et al. assumes the depth of their 2D domain is 1m.
  # Tiberga et al. domain = 2m x 2m x 1m
  # We divide the total power=1e9W by 100 because our length units are in cm.
  # Our domain = 2m x 2m x 0.01m

  xdiff = 'group1diff'
  bx_norm = 'bnorm'
  k0 = 1.16
  l_max_its = 100
  eig_check_tol = 1e-7

  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
#  petsc_options_iname = '-pc_type -pc_factor_shift_type -pc_factor_mat_solver_package'
#  petsc_options_value = 'lu       NONZERO               superlu_dist'

## Use the settings below instead if running on a desktop/small cluster
  petsc_options_iname = '-pc_type -sub_pc_type -ksp_gmres_restart -sub_pc_factor_shift_type'
  petsc_options_value = 'gasm      lu           200               NONZERO'

  line_search = none
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Postprocessors]
  [./bnorm]
    type = ElmIntegTotFissNtsPostprocessor
    execute_on = linear
  [../]
  [./tot_fissions]
    type = ElmIntegTotFissPostprocessor
    execute_on = linear
  [../]
  [./powernorm]
    type = ElmIntegTotFissHeatPostprocessor
    execute_on = linear
  [../]
  [./group1norm]
    type = ElementIntegralVariablePostprocessor
    variable = group1
    execute_on = linear
  [../]
  [./group1max]
    type = NodalMaxValue
    variable = group1
    execute_on = timestep_end
  [../]
  [./group1diff]
    type = ElementL2Diff
    variable = group1
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  [../]
  [./group2norm]
    type = ElementIntegralVariablePostprocessor
    variable = group2
    execute_on = linear
  [../]
  [./group2max]
    type = NodalMaxValue
    variable = group2
    execute_on = timestep_end
  [../]
  [./group2diff]
    type = ElementL2Diff
    variable = group2
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  [../]

  [./channel11]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel11'
  []
  [./channel12]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel12'
  []
  [./channel13]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel13'
  []
  [./channel14]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel14'
  []
  [./channel15]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel15'
  []
  [./channel16]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel16'
  []
  [./channel17]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel17'
  []
  [./channel18]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel18'
  []
  [./channel22]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel22'
  []
  [./channel23]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel23'
  []
  [./channel24]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel24'
  []
  [./channel25]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel25'
  []
  [./channel26]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel26'
  []
  [./channel27]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel27'
  []
  [./channel28]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel28'
  []
  [./channel33]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel33'
  []
  [./channel34]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel34'
  []
  [./channel35]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel35'
  []
  [./channel36]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel36'
  []
  [./channel37]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel37'
  []
  [./channel38]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel38'
  []
  [./channel44]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel44'
  []
  [./channel45]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel45'
  []
  [./channel46]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel46'
  []
  [./channel47]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel47'
  []
  [./channel48]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel48'
  []
  [./channel55]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel55'
  []
  [./channel56]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel56'
  []
  [./channel57]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel57'
  []
  [./channel58]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel58'
  []
  [./channel66]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel66'
  []
  [./channel67]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel67'
  []
  [./channel68]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel68'
  []
  [./channel77]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel77'
  []
  [./channel78]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel78'
  []
  [./channel88]
    type = ElmIntegTotFissHeatPostprocessor
    block = 'fuel88'
  []
[]

[VectorPostprocessors]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
  [../]
  [./csv]
    type = CSV
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]
