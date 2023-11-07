[![Actions Status](https://github.com/frithnanth/Raku-Net-Whois/actions/workflows/test.yml/badge.svg)](https://github.com/frithnanth/Raku-Net-Whois/actions)

NAME
====

Net::Whois - Raku interface to the Whois service

SYNOPSIS
========

```raku
use Net::Whois;

my Net::Whois $w .= new;
my %h = $w.query: $who, $using;
for %h.kv -> $k, $v { say "$k => $v[*]" }
```

DESCRIPTION
===========

Net::Whois is an interface to the Whois service

This is a very simple module that does what I just happened to need.

### new()

The constructor takes no arguments.

### multi method query(Str:D $who where { $_ ~~ IP | Domain or die 'Not a valid IP or domain name' }, Str:D $server, Bool :$raw! --> List)

### multi method query(Str:D $who where { $_ ~~ IP | Domain or die 'Not a valid IP or domain name' }, Str:D $server, Bool :$multiple --> Hash)

### multi method query(Str:D $who where { $_ ~~ IP | Domain or die 'Not a valid IP or domain name' }, *@servers, Bool :$multiple, Bool :$raw --> Hash)

The first form of the method looks for the **$who** domain, using the chosen **$server** and returns a **List** of values. If the **:$raw** flag is used then the result is returned verbatim.

The second form returns a **Hash** of the whois fields. The whois output may consist of several sections; if the **:$multiple** flag is used the values of the same-named field are concatenated into the same value string.

The third form takes a list of servers to query. It returns a **Hash** whose keys are the name of the server and the values are the hashes returned by the second form of the method, or the lists returned by the first form of the method if the **:$raw** flag has been used.

Installation
============

To install it using zef (a module management tool):

    $ zef install Net::Whois

AUTHOR
======

Fernando Santagata <nando.santagata@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2023 Fernando Santagata

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

