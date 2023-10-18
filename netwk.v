fn main() {
		mut n, err := string 
    mut socket := net.udp_socket()
    defer {
        socket.close()
    }

    mut address := net.parse_addr("127.0.0.1:1234")
    err = socket.send("Hello, world!", address)
    if err != null {
        panic(err)
    }

    buffer := make([]byte{}, 1024)
    n, address, err = socket.receive(buffer)
    if err != null {
        panic(err)
    }
    // Do something with the received data
}

