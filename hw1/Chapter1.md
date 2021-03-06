CHAPTER 1: DIGITAL SYSTEMS AND INFORMATION

- 1-1 Information Representation
  - Digital systems store, move, and process information represented using signals having only two discrete values, and are therefore said to be binary
  - The Digital Computer
    - A digital computer consists of memory, a CPU, and input/output (I/O)
  - Beyond the Computer
    - Embedded systems are special purpose computers whose software programs are often permanently stored (hard-wired)
    - Their input devices transform inputs from the outside world into electrical signals and the output devices transform electrical signals into outputs to the outside world, often using Analog-to-Digtal (A/D) conversion and vice versa
  - More on the Generic Computer
    - The processor contains the CPU, the FPU, the MMU, and the internal cache
    - Memory consists of the MMU, internal cache, external cache, and RAM
    - I/O consists of the keyboard, graphics adapter, LCD screen, drive controller, and hard drive
- 1-2 Abstraction Layers in Computer Systems Design
  - Typical Layers of Abstraction in Modern Computer Systems
    - Algorithms —> Programming Languages —> Operating Systems —> Instruction Set Architecture —> Microarchitecture —> Register Transfers —> Logic Gates —> Transistor Circuits
  - An Overview of the Digital Design Process
    - 1. Specification —> 2. Formulation —> 3. Optimization —> 4. Technology Mapping —> 5. Verification
- 1-3 Number Systems
  - A number in base r contains r digits 0, 1, 2, …, r-1
  - Binary Numbers (base 2)
    - All computers and digital systems use the binary representation
    - Refer to 2^10 as K (kilo), 2^20 as M (mega), 2^30 as G (giga), and 2^40 as T (tera)
  - Octal and Hexadecimal Numbers (base 8 and base 16)
    - The octal and hexadecimal systems are useful representing binary quantities indirectly; each octal digit corresponds to 3 binary digits and each hexadecimal digit corresponds to four binary digits
    - Compact representation is more convenient for people than using bit strings in binary
  - Number Ranges
    - The range of numbers that can be represented is based on the number of bits available in the hardware structures
- 1-4 Arithmetic Operations
  - Arithmetic operations with numbers in base r follow the same rules as for decimal numbers, but one must be careful to use only r allowable digits and perform all computations with base r digits
  - Conversion from Decimal to Other Bases
    - This procedure consists of dividing the number and all successive quotients by r and accumulating the remainders
- 1-5 Decimal Codes
  - Binary-coded decimal (BCD) is a code for representing decimal digits in binary; it assigns a 4-bit code for each decimal digit
- 1-6 Alphanumeric Codes
  - ASCII Character Code
    - ASCII is the standard binary code for alphanumeric characters; it uses 7 bits to code 128 characters
    - Unicode was developed for providing a common representation for most of the world's languages; it provides a unique number called a code point for each character e.g. "U+0030"
    - UTF-8 is one standard encoding for the code points; it's a variable-length encoding that uses from 1 to 4 bytes for each code point
  - Parity Bit
    - An additional bit is sometimes added to a binary code word to detect errors in data communication and processing; the extra bit is used to produce an even number of 1s in the code for even parity or vice versa
- 1-7 Gray Codes
  - A code having the property that only one bit at a time changes between codes during counting is a Gray code; useful for applications where a physical variable with continuous range of value is converted to a digital representation 

