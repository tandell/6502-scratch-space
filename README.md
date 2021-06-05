# Ben Eater's 6502 Build Along

To Compile and Burn:
../vasm/vasm6502_oldstyle -Fbin -dotdir blink.s
hexdump -C a.out 
minipro -p AT28C256 -w a.out


## Dependencies and References

* (VASM)[http://sun.hasenbraten.de/vasm/]
* (Ben Eater's 6502 Kit Computer)[https://eater.net/6502]