import net

fn main() {
    // Create a TCP listener
    listener := net.tcp_listener('localhost:12345')

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

    // Close the listener when the program exits
    defer listener.close()
}

fn handle_connection(conn net.TCPConn) {
    defer conn.close()

    // Read data from the client
    buffer := make([]byte, 1024)
    n, err := conn.read(buffer)
    if err != null {
        panic(err)
    }

    // Print the received data
    println('Received data:', buffer[:n])

    // Send a response to the client
    response := 'Hello, client!'
    _, err = conn.write(response.bytes())
    if err != null {
        panic(err)
    }
}
