#! C:\Strawberry\perl\bin\perl.exe

# This is server program that connects to the local server.
# use strict;
# use v5.16;
# use IO::Socket qw(:crlf :DEFAULT);

# my $server_port = 8866;
# my $client;

# my $server = IO::Socket::INET->new(LocalPort => $server_port,
#                                    Type      => SOCK_STREAM,
#                                    Reuse     => 1,
#                                    Listen    => 10) or die "Couldn't be a tcp server on port $server_port: $!\n";
#  my $i=1;
# while ( $client = $server->accept()) {

#         print $client,", it is ok\n";
#         $client->send("Hello, this is the ${i}th connect to the server.\n\n");
#         $client->close();
#         $i++;
# }

# close($server);

# 服务器端代码 server.pl

use strict;
use warnings;
use IO::Socket::INET;

# 创建socket对象
my $socket = new IO::Socket::INET (
    LocalHost => '10.208.134.26',
    LocalPort => '7788',
    Proto => 'tcp',
    Listen => 5,
    Reuse => 1
);

die "无法创建socket: $!\n" unless $socket;
$socket->autoflush(1);

print "服务器启动，等待客户端连接...\n";

while (1) {
    # 等待客户端连接
    my $client_socket = $socket->accept();

    # 获取客户端地址和端口信息
    my $client_address = $client_socket->peerhost();
    my $client_port = $client_socket->peerport();

    print "连接来自: $client_address:$client_port\n";

    # 从客户端接收数据
    # my $data = <$client_socket>;
    # chomp($data);
    # print "收到客户端消息: $data\n";

    # 发送响应给客户端
    # my $response = "服务器已经收到消息: $data\n";
    # chomp($response);
    # my $response="HTTP/1.1 200 OK\r\n";
    # $response="Server:First server\r\n\r\n";
    # $response .= "Content-type: text/plain; charset=utf-8\r\n\r\n";
    my $response ="hello world\r\n";
    print $client_socket <<END;
HTTP/1.1 200 OK
Date: Thu, 12 Oct 2023 13:15:21 GMT
Server: fvbsuvfnsuif
Keep-Alive: timeout=5, max=100
Content-Type: text/plain;charset=utf-8

fheusrfh8uerwf
END
    print $client_socket $response;

    # 关闭客户端socket连接
    close($client_socket);
}

# 关闭服务器socket连接
$socket->close();
