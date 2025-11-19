transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/unidadeControleULA.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/unidadeControlePrincipal.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/ULA32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/somador32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/somador1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/processador.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/or32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/or1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/mux8por1_32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/mux8por1_1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/mux2por1_5bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/mux2por1_32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/mux2por1.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/memoriaInstrucao.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/memoriaDados.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/hex_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/extensor_sinal.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/divisor_frequencia.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/decodificador_operacao_hex.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/countPC.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/bancoRegistradores.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/and32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/and1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/pratica8_top.v}

vlog -vlog01compat -work work +incdir+C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados {C:/Users/gioes/Documents/GitHub-Projects/lab_aoc/pratica8_GiovanniEstevam_JoaoVitorLopes/caminhoDados/processador_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  processador_tb

add wave *
view structure
view signals
run -all
