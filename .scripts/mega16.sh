avrdude -p m16 -c stk500 -P /dev/ttyACM0 -e -U flash:w:main.hex
