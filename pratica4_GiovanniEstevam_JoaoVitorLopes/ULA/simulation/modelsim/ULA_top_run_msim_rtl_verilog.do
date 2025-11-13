transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/and1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/and32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/or1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/or32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/somador1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/somador32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/mux2por1.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/mux8por1_1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/mux8por1_32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/ULA32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/extensor_sinal.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/hex_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/ULA_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/valor_absoluto.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/display_sinal.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/ULA/somador6bits.v}

