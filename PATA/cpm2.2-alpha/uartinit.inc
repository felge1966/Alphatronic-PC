		; the uart initialization code below is taken from
		; terminal program published in TA Almanach '85/86

		in	a, (uart_data_port)
		ld	a, 00h
		out	(uart_ctrl_port),a
		nop
		nop
		nop
		out (uart_ctrl_port),a
		nop
		nop
		nop
		nop
		ld	a,040h
		out (uart_ctrl_port),a
		nop
		nop
		nop
		nop
		nop
		ld	a,01001110b			; divide by 16, 8-bit chars, no parity, 1 stop bit
		out (uart_ctrl_port),a
		nop
		nop
		nop
		nop
		nop
		ld	a,00110111b			;enable rx, tx, error reset, rts low, dtr low
		out (uart_ctrl_port),a