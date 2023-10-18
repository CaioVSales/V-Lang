import net

fn main() {
    // Create a TCP listener
    listener := net.listen_tcp('localhost:12345')
    defer {
        listener.close()
    }

    println('Listening on port 12345')

    for {
        // Accept incoming connections
        conn, err := listener.accept()
        if err != null {
            panic(err)
        }

        // Handle the connection in a separate goroutine
        go handle_connection(conn)
    }
}

fn handle_connection(conn net.TcPConn) {
        defer {
					conn.close()
				}
        // Read data from the client
        buffer := make([]byte{}, 1024)
        n, err := conn.read(buffer)
        if err != null {
            panic(err)
        }

        // Print the received data
        println('Received data:', buffer.slice(n))

        // Send a response to the client
        response := 'Hello, client!'
        _, err = conn.write(response.bytes())
        if err != null {
            panic(err)
        }
    }

