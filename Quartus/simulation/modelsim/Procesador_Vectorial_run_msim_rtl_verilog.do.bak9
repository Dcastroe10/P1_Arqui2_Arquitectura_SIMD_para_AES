transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {d:/quartus/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {d:/quartus/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {d:/quartus/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {d:/quartus/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {d:/quartus/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {d:/quartus/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {d:/quartus/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {d:/quartus/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {d:/quartus/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {d:/quartus/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {d:/quartus/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {d:/quartus/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/WBPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/top.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/MEMPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/MEM_WBReg.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/IFPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/IF_IDReg.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/IDPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/ID_EXReg.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/EXPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/EX_MEMReg.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/Controller.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Shifter.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Register_File.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Register.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/PCRegister.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Nbit_Equal_Comp.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Mux.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Memory.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/ImmGen.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Hot_Bit.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/HazardUnit.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Fordwarding_Unit.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Equal_Comp.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Decoder.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Alu.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Adder1bit.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Adder.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/tbs {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/tbs/tb_top.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/InstMemory.sv}

vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/Controller.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/Datapath.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/EX_MEMReg.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/EXPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/ID_EXReg.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/IDPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/IF_IDReg.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/IFPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/MEM_WBReg.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/MEMPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/top.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/top/WBPipe.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/InstMemory.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Vectorial_Register_File.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Vectorial_Register.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Adder.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Alu.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Hot_Bit.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Nbit_Equal_Comp.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Register_File.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Adder1bit.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Decoder.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Equal_Comp.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Fordwarding_Unit.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/HazardUnit.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/ImmGen.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Memory.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Mux.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/PCRegister.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Register.sv}
vlog -sv -work work +incdir+C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components {C:/Users/joedu/OneDrive/Escritorio/procesador_vectorial/P1_Arqui2_Arquitectura_SIMD_para_AES/Quartus/components/Shifter.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_top

add wave *
view structure
view signals
run -all
