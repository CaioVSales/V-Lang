fn decode(data string) []u8 {
		mut res := []u8{}
		mut i := 0
		for i < data.len {
				mut a := 0
				mut b := 0
				mut c := 0
				mut d := 0
				if data[i] == `=` {
						break
				}
				a = decode_table[data[i]]
				i++
				if data[i] == `=` {
						break
				}
				b = decode_table[data[i]]
				i++
				if data[i] == `=` {
						break
				}
				c = decode_table[data[i]]
				i++
				if data[i] == `=` {
						break
				}
				d = decode_table[data[i]]
				i++
				res << (a << 2 | b >> 4)
				res << (b << 4 | c >> 2)
				res << (c << 6 | d)
		}
		return res
}
