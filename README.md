# 06-ipv4-validator

## Task

Implement a method that will return true if the given string argument is an IPv4 address - four numbers (0-255)
separated by periods.
It should only accept addresses in canonical representation, i.e. without leading zeros, blanks, etc.

## Solution

```
0.255.0.255 => true
192.168.64.5 => true
255.255.255.255 => true
256.999.999.999 => false
123.123.123 => false
```