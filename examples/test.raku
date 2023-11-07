#!/usr/bin/env raku

use lib 'lib';
use Net::Whois;

sub MAIN(
  Str:D $who,                     #= who you're looking for
  Str:D $using = 'whois.ripe.net' #= using which service
)
{
  my Net::Whois $w .= new;
  my %h = $w.query: $who, $using;
  for %h.kv -> $k, $v { say "$k => $v[*]" }
}
