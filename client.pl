#! C:\Strawberry\perl\bin\perl.exe

# This is client program that connects to the local server.
use strict;
use v5.16;
use IO::Socket qw(:crlf :DEFAULT);

my $host=shift||'127.0.0.1';
my $port=shift||8866;

$/=CRLF;

my $socket = IO::Socket::INET->new(PeerAddr  => $host,
                                   PeerPort  => $port,
                                   Proto     => "tcp",
                                   Type      => SOCK_STREAM)
    or die "Couldn't connect to $host\t:\t$!\n";
my $message = <$socket>;
print "Get message from $host:$port\t:\t$message\n";
close($socket);