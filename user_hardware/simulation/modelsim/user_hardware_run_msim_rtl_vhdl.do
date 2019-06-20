transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/User/Documents/nios_repo/user_hardware/vhdl/control_register/control_register.vhd}
vcom -93 -work work {C:/Users/User/Documents/nios_repo/user_hardware/vhdl/counter_01/counter_01.vhd}
vcom -93 -work work {C:/Users/User/Documents/nios_repo/user_hardware/vhdl/counter_8bits/counter8b.vhd}
vcom -93 -work work {C:/Users/User/Documents/nios_repo/user_hardware/vhdl/user_hardware/user_hardware.vhd}

