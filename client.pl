#! C:\Strawberry\perl\bin\perl.exe

# This is client program that connects to the local server.
# use strict;
# use v5.16;
# use IO::Socket qw(:crlf :DEFAULT);

# my $host=shift||'127.0.0.1';
# my $port=shift||8866;

# $/=CRLF;

# my $socket = IO::Socket::INET->new(PeerAddr  => $host,
#                                    PeerPort  => $port,
#                                    Proto     => "tcp",
#                                    Type      => SOCK_STREAM)
#     or die "Couldn't connect to $host\t:\t$!\n";
# my $message = <$socket>;
# print "Get message from $host:$port\t:\t$message\n";
# close($socket);

# 客户端代码 client.pl

use strict;
use warnings;
use IO::Socket::INET;

# 连接服务器
my $socket = new IO::Socket::INET (
    PeerHost => '127.0.0.1',
    PeerPort => '7788',
    Proto => 'tcp'
);
die "无法连接服务器: $!\n" unless $socket;

# 向服务器发送消息
my $message = "Hello, Server!\n";
# print $socket $message;
$socket->send($message);
# 从服务器接收响应
my $response = <$socket>;
chomp($response);
print "收到服务器响应: $response\n";

# 关闭客户端socket连接
close($socket);
