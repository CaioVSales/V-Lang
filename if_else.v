number_a := 5
number_b := 10

if number_a < number_b {
	println('${number_a} < ${number_b}')
} else if number_a > number_b {
	println('${number_a} > ${number_b}')

} else {
	println('${number_a} = ${number_b}')
}


number_c := if number_a < number_b {5} else {0}
println(number_c) 