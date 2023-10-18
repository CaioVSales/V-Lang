import net

fn main(){
	mut stream := net.tcp_socket()
	defer {
		stream.close()
	}

	err := stream.connect("www.google.com", 80)
	if err != null {
		panic(err)
	}
}
