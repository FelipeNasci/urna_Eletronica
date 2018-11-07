transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/cliente/Desktop/urna_Eletronica-master/urna_Eletronica-master/Urna_Eletronica {C:/Users/cliente/Desktop/urna_Eletronica-master/urna_Eletronica-master/Urna_Eletronica/urna.v}
vlog -vlog01compat -work work +incdir+C:/Users/cliente/Desktop/urna_Eletronica-master/urna_Eletronica-master/Urna_Eletronica {C:/Users/cliente/Desktop/urna_Eletronica-master/urna_Eletronica-master/Urna_Eletronica/digitos.v}

