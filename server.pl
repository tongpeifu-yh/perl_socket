#! C:\Strawberry\perl\bin\perl.exe

# This is client program that connects to the local server.
use strict;
use v5.16;
use IO::Socket qw(:crlf :DEFAULT);

my $server_port = 8866;
my $client;

my $server = IO::Socket::INET->new(LocalPort => $server_port,
                                   Type      => SOCK_STREAM,
                                   Reuse     => 1,
                                   Listen    => 10) or die "Couldn't be a tcp server on port $server_port: $!\n";
 my $i=1;
while ( $client = $server->accept()) {

        print $client,", it is ok\n";
        $client->send("Hello, this is the ${i}th connect to the server.\n\n");
        $client->close();
        $i++;
}

close($server);
