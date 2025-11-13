transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/MEMORIA {C:/Users/gioes/Documents/pratica4_giovanni_joaolopes/pratica4_giovanni_joaolopes/MEMORIA/memoriaDados.v}

