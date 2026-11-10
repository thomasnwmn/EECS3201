# EECS3201
This project contains lab work that I performed during EECS 3201 - Digital Logic Design.  The projects are outlined below with attached lab pdfs.

## [Lab 5](https://github.com/user-attachments/files/34509238/Lab5.pdf)
In this lab, I used simulation tools(ModelSim) and test bench files to simulate how a circuit would behave in both combinational and sequential logic.
#### Part 1
This portion involved a full adder circuit with three inputs and simulating all eight cases (0-7 in binary).
Each input lasts for ~20 nanoseconds on the test bench and the appropriate waveform is displayed on ModelSim.
All of the inputs hit zero only once, during the first case.
#### Part 2
This portion involved a 50MHz clock input, a 1-bit binary input, and a 4-bit binary output.
It implements a 4-bit up-down counter circuit, triggering on each positive edge of the clock, and counting up if the 1-bit binary input is 0, and counting down if its 1.
I simulate 100 ns of the input at zero, starting at 0000, then swap to 200 ns of input at 1, and finish with 100 ns of input at 0.
All of the inputs hit zero three times, at time 0, 200 and 400.

## [Lab 4](https://github.com/user-attachments/files/34509233/Lab4.pdf)
In this lab, I had to use memory circuit elements, such as the RS Flip Flop to design a NBA shot clock.
On the seven segment display, it would start with either 24 or 30 seconds, and count down to zero.
There is a reset button to set it back to the initial value, and also a pause button to stop and hold the count.

## [Lab 3](https://github.com/user-attachments/files/34509229/Lab3.pdf)
In this lab, I was tasked with creating a module that implements a full adder, and then combine four of those modules to implement a four-bit ripple-carry adder.
Not only did it need to be able to add 2 four-bit integers together, but also minus them by flipping a switch.
The two integers were displayed on 2 different seven-segment displays, and then the result was displayed on the rightmost display.
If the result was negative, the second to the rightmost display also displayed a negative sign, and if it was a two digit hexadecimal number, then it also could display a 1 there.

## [Lab 2](https://github.com/user-attachments/files/34509251/Lab2.pdf)
In this lab, we kicked things up a notch.
This was the first lab where we actually needed to use the DE10 Lite board, where I initialize the seven-segment display and write a hexadecimal digit to the screen using four of the onboard switches.
From right to left, the four switches would represent a four bit binary number, going from 1-F.

## [Lab 1](https://github.com/user-attachments/files/34509222/Lab1.pdf)
In this lab, the professor tasked me with writing an extremely basic circuit in Verilog, since it was my first program.
It was a basic NAND gate in a module, just to teach some basic syntax like modules, and assigning an output.
