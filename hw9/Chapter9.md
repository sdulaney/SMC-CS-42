CHAPTER 9: INSTRUCTION SET ARCHITECTURE

- 9-1 Computer Architecture Concepts
  - The binary language in which instructions are defined and stored in memory is referred to as *machine language*
  - A symbolic language the replaces binary opcodes and addresses with symbolic names and that provides other features helpful to the programmer is referred to as *assembly language*
  - The *instruction set architecture (ISA)* lists all hardware-implemented instructions, specifies the symbolic names and binary code format of the instructions, and provides a precise definition of each instruction
  - The structure of a particular hardware implementation of the ISA is referred to as the *microarchitecture* or *computer organization*
  - The term *computer architecture* is used to emcompass the whole of the computer, including instruction set architecture, organization, and hardware
  - The following are typical *fields* found in instruction formats:
    - An *opcode field*, which specifies the operation to be performed
    - An *address field*, which provides either a memory address or an address that selects a processor register
    - A *mode field*, which specifies the way the address field is to be interpreted
  - Basic Computer Operation Cycle
    - The computer's control unit is designed to execute each instruction of a program in the following sequence of steps:
      - (1) Fetch the instruction from memory into the instruction register in the control unit
      - (2) Decode the instruction
      - (3) Locate the operands used by the instruction
      - (4) Fetch the operands from memory (if necessary)
      - (5) Execute the operation in processor registers
      - (6) Store the results in the proper place
      - (7) Go back to Step 1 to fetch the next instruction
  - Register Set
    - The *register set* consists of all registers in the CPU that are accessible to the programmer
    - We add two registers to the set we have used thus far: the *processor status register (PSR)* and the *stack pointer (SP)*
    - The processor status register contains flip-flops that are selectively set by status values C, N, V, and Z from the ALU and shifter; the stored status bits are also referred to as the *condition codes* or the *flags*

- 9-2 Operand Addressing

  - *implied address*: specified either by the opcode of the instruction or by an address assigned to one of the other operands
  - *explicit address*: operand has an address in the instruction
  - The number of operands explicitly addressed for a data-manipulation operation such as ADD is an important factor in defining the instruction set architecture for a computer
  - An additional factor is the number of such operands that cna be explicitly addressed in memory by the instruction
  - Three-Address Instructions
    - Ex: `ADD R1, A, B`
    - An advantage is that it results in short programs for evaluating expressions
  - Two-Address Instructions
    - Ex: `ADD R1, B`
    - The first operand address listed in the symbolic instruction also serves as the implied address to which the result of the operation is transferred
  - One-Address Instructions
    - Ex: `ADD B`
    - Uses an implied address— such as a register called an accumulator, ACC— for obtaining one of the operands and as the location of the result
  - Zero-Address Instructions
    - Ex: `ADD`
    - All three addresses in the instruction must be implied; a conventional way of achieving this goal is to use a stack
  - Addressing Architectures
    - *memory-to-memory architecture:* all operands come directly from memory, and all results are sent directly to memory
      - even though the instruction count is low, the execution time is potentially high because it requires so many accesses to memory
      - typically not used in new designs
    - *register-to-register or load/store architecture:* allows only one memory address and restricts its use to load and store types of instructions
      - typical in modern processors
    - *register-memory architecture:* remains common among the current instruction set architectures, primarily to provide compatibility with older software using a specific architecture
    - *single-accumulator architecture:* no register file, its single address is for accessing memory
      - because of large number of memory accesses, this architecture is inefficient and consequently, is restricted to use in CPUs for simple, low-cost applications that do not require high performance
    - *stack architecture:* zero-address instruction case
      - as register-register and load/store archiectures have made strong performance advances, the high frequency of memory accesses in stack architectures has made them unattractive
      - stack architectures are compatible with a very efficient approach to expression processing which uses postfix notation rather than the traditional infix notation to which we are accustomed
        - Postfix notation is also called reverse Polish notation (RPN)
        - Conversion of infix notation to RPN can be achieved with graph traversal
        - It is very easy to develop a program for an RPN expression
          - Whenever a variable is encountered it is pushed onto the stack
          - Whenever an operation is encountered, it is executed on the top one or two items of the stack and pushed back onto the stack

- 9-3 Addressing Modes

  - The addressing mode specifies a rule for interpreting or modifying the address field of the instruction before the operand is actually referenced
  - The address of the operand prooduced by the application of such a rule is called the *effective address*
  - Computers use address-mode techniques to accommodate one or both of the following provisions:
    - (1) To give programming flexibility to the user via pointers to memory, counters for loop control, indexing of data, and relocation of programs
    - (2) To reduce the number of bits in the address fields of the instruction
  - Implied Mode
    - The operand is specified implicitly in the definition of the opcode
  - Immediate Mode
    - The operand is specified in the instruction itself
  - Register and Register-Indirect Modes
    - Register Mode: the address field specifies a processor register
    - Register-Indirect Mode: the instruction specifies a register in the processor whose content gives the address of the operand in memory
  - Direct Addressing Mode
    - The address field of the instruction gives the address of the operand in memory
  - Indirect Addressing Mode
    - The address field of the instruction gives the address at which the effective address is stored in memory
  - Relative Addressing Mode
    - Effective address = Address part of the instruction + Contents of PC
  - Indexed Addressing Mode
    - The content of an index register is added to the address part of the instruction to obtain the effective address
    - A specialized variation of the index mode is the base-register mode
      - An independent register is assumed to hold an index number that is relative to the address field of the instruction
      - A base register is assumed to hold a base address, and the address field of the instruction gives a displacement relative to the base address
  - Summary of Addressing Modes
    - Symbolic Convention for Addressing Modes:
      - Direct - `LDA ADRS`
      - Immediate - `LDA #NBR`
      - Indirect - `LDA [ADRS]`
      - Relative - `LDA $ADRS`
      - Index - `LDA ADRS (R1)`
      - Register - `LDA R1`
      - Register-indirect - `LDA (R1)`

- 9-4 Instruction Set Architectures

  - There are two major types of instruction set architectures:
    - *Complex instruction set computers (CISCs):* provide hardware support for high-level language operations and have compact programs
      - Register files may be smaller than in a RISC
      - Microprogrammed control is likely to be used, and in newer designs is likely to be controlling a pipelined datapath
      - CISC instructions are converted to a sequence of RISC-like operations that are processed by the RISC-like pipeline
      - A CISC architecture has the following properties:
        - (1) Memory access is directly available to most types of instructions
        - (2) Addressing modes are substantial in number
        - (3) Instruction formats are of different lengths
        - (4) Instructions perform both elementary and complex operations
    - *Reduced instruction set computers (RISCs):* emphasize simple instructions and flexibility that, when combined, provide higher throughput and faster execution
      - Needs a relatively large register file
      - The control unit of a RISC is comparatively simple and is typically hardwired
      - The underlying organization is a pipelined design
      - A RISC architecture has the following properties:
        - (1) Memory accesses are restricted to load and store instructions, and data manipulation instructions are register-to-register
        - (2) Addressing modes are limited in number
        - (3) Instruction formats are all of the same length
        - (4) Instructions perform elementary operations
  - Actual instruction set architectures range between those which are purely RISC and those which are purely CISC
  - Most elementary computer instructions can be classified into three major categories:
    - (1) data-transfer instructions: cause transfer of data from one location to another without changing the binary information content
    - (2) data-manipulation instructions: perform arithmetic, logic, and shift operations
    - (3) program-control instructions: provide decision-making capabilities and change the path taken by the program when executed in the computer

- 9-5 Data-Transfer Instructions

  - Typical Data Transfer Instructions:

    - Load - `LD` - designates a transfer from memory to a processor register
    - Store - `ST` - designates a transfer from a processor register into a memory word
    - Move - `MOVE` - designates a transfer between registers, between registers and memory, and between two memory words
    - Exchange - `XCH` - exchanges information between two registers, between a register and memory word, or between two memory words
    - Push - `PUSH` - places a new item onto the top of the stack
    - Pop - `POP` - removes one item from the stack so that the stack pops up
    - Input - `IN`
    - Output - `OUT`

  - Stack Instructions

    - A stack in a computer typically handles only state information related to procedure calls and returns and interrupts

    - The register that holds the address for the stack is called a stack pointer (SP) because its value always points to TOS, the item at the Top Of Stack

    - Push operation sequence:

      ```
      SP <-- SP - 1
      M[SP] <-- R1
      ```

    - Pop operation sequence:

      ```
      R1 <-- M[SP]
      SP <-- SP + 1
      ```

  - Independent versus Memory-Mapped I/O

    - The computer has a number of input and output ports, with one or more ports dedicated to communication with a specific input or output device
    - A *port* is typically a register with input and/or output lines attached to the device
    - Port addresses are assigned in two ways:
      - Independent I/O system aka isolated I/O configuration: 
        - the address ranges assigned to memory and I/O ports are independent from each other
        - the computer has distinct input and output instructions
      - Memory-mapped I/O:
        - assigns a subrange of memory address for addressing I/O ports
        - no distinct input or output instructions; the load and store instructions used for memory transfer are also used for I/O transfer

- 9-6 Data-Manipulation Instructions

  - Data-manipulation instructions are usually divided into three basic types:
    - Arithmetic instructions
    - Logical and bit-manipulation instructions
    - Shift instructions
  - A microoperation is an elementary operation executed by the hardware of the computer under the control of the control unit
  - In contrast, an instruction may involve several elementary operations that fecth the instruction, bring the operands from appropriate processor registers, and store the result in the specified location
  - Arithmetic Instructions
    - Typical Arithmetic Instructions:
      - Increment
      - Decrement
      - Add
      - Subtract
      - Multiply
      - Divide
      - Add with carry
      - Subtract with borrow
      - Subtract reverse
      - Negate
  - Logical and Bit-Manipulation Instructions
    - Three bit-manipulation operations are possible: a selected bit can be cleared to 0, set to 1, or complemented
    - The AND instruction is used to clear a bit or a selected group of bits of an operand to 0 (*mask* or *bit clear* instruction)
    - The OR instructions is used to set a bit or a selected group of bits of an operand to 1 (*bit set* instruction)
    - The XOR instruction is used to selectively complement bits of an operand (*bit complement* instruction)
    - Typical Logical and Bit-Manipulation Instructions:
      - Clear
      - Set
      - Complement
      - AND
      - OR
      - Exclusive-OR
      - Clear carry
      - Set carry
      - Complement carry
  - Shift Instructions
    - Logical shifts insert 0 into the incoming bit position during the shift
    - Arithmetic shifts confirm to the rules for shifting 2s complement signed numbers
    - Typical Shift Instructions:
      - Logical shift right
      - Logical shift left
      - Arithmetic shift right
      - Arithmetic shift left
      - Rotate right
      - Rotate left
      - Rotate right with carry
      - Rotate left with carry

- 9-7 Floating-Point Computations

  - The floating-point number has two parts, one containing the sign of the number and a *fraction* (sometimes called a *mantissa*) and the other designating the position of the radix point in the number and called the *exponent*
  - A floating-point number is said to be *normalized* if the most significant digit of the fraction is nonzero
  - Arithmetic Operations
    - Arithmetic operations with floating-point numbers are more complicated than with integer numbers, and their execution takes longer and requires more complex hardware
    - Adding and subtracting two numbers require that the radix points be aligned, since the exponent parts must be equal before adding or subtracting the fractions
      - The usual alignment procedure is to shift the fraction with the smaller exponent to the right by a number of places equal to the difference between the exponents
    - In most computers, a normalization procedure is performed after each operation to ensure that all results are in normalized form
    - Floating-point multiplication and division to not require an alignment of the fractions
      - Multiplication can be performed by multiplying the two fractions and adding the exponents
      - Division is accomplished by dividing the fractions and subtracting the exponents
  - Biased Exponent
    - The sign and fraction part of a floating-point number is usually a signed-magnitude representation
    - The exponent representation employed in most computers is known as a *biased exponent*
    - The bias is an excess number added to the exponent so that, internally, all exponents become positive
    - The exponent can have a positive-biased or negative-biased representation
  - Standard Operand Format
    - Arithmetic instructions that perform operaitons with floating-point data often use the suffix F (i.e. `ADDF`)
    - There are two standard formats for representing a floating-point operand: the single-precision data type, consisting of 32 bits, and the double-precision data type, consisting of 64 bits
    - When both types of data are available, the single-precision instruction mnemonic uses an FS suffix, and the double precision uses FL (for "floating-point long")
    - The format of the IEEE standard single-precision floating-point operand consists of 32 bits:
      - The sign bit *s* designates the sign for the fraction
      - The biased exponent *e* contains 8 bits and uses an excess 127 number
      - The fraction *f* consists of 23 bits
      - The binary point is assumed to be immediately to the left of the most significant bit of the *f* field
      - In addition, an implied 1 bit is inserted to the left of the binary point, which in effect expands the number to 24 bits
      - The component of the binary floating-point number that consists of the leading bit to the left of the implied binary point, together with the fraction in the field, is called the *significand*
      - The value of the number is: (-1)^*s* * 2^(*e* - 127) * (1.*f*)
    - The maximum (11111111) and minimum (00000000) values for the *e* field are reserved to indicate exceptional conditions:
      - (1) When *e* = 255 and *f* = 0, the number represents plus or minus infinity and the sign is determined from the sign bit *s*
      - (2) When *e* = 255 and *f* != 0, the representation is considered to be *not a number*, or NaN, regardless of the sign value. NaNs are used to signify invalid operations.
      - (3) When *e* = 0 and *f* = 0, the number denotes plus or minus zero
      - (4) When *e* = 0 and *f* != 0, the number is said to be denormalized. This is the name given to numbers with a magnitude less than the minimum value that is represented in the normalized format

- 9-8 Program Control Instructions

  - Typical Program Control Instructions:
    - Branch - `BR`
    - Jump - `JMP`
    - Call procedure - `CALL`
    - Return from procedure - `RET`
    - Compare (by subtraction) - `CMP`
    - Test (by ANDing) - `TEST`
  - The branch (BR) and jump (JMP) instructions are often used interchangeably to mean the same thing, causing a transfer of the effective address into the PC
  - The compare (CMP) instruction performs a subtraction of two operands, say, A - B; the result of the operation is not transferred into a destination register, but the status bits are affected
  - Similarly, the test (TEST) instruction performs the logical AND or two operands without retaining the result and dauses a conditional branch, changes the contents of a register, or sets or resets stored status bits
  - Conditional Branch Instructions
    - A conditional branch instruction is a branch instruction that may or may not cause a transfer of control, depending on the value of stored bits in the processor status register, PSR
    - Conditional Branch Instructions Relating to Status Bits in the PSR:
      - Branch if zero - `BZ`
      - Branch if not zero - `BNZ`
      - Branch if carry - `BC`
      - Branch if no carry - `BNC`
      - Branch if minus - `BN`
      - Branch if plus - `BNN`
      - Branch if overflow - `BV`
      - Branch if no overflow - `BNV`
    - Conditional Branch Instructions for Unsigned Numbers:
      - Branch if above - `BA`
      - Branch if above or equal - `BAE`
      - Branch if below - `BB`
      - Branch if below or equal - `BBE`
      - Branch if equal - `BE`
      - Branch if not equal - `BNE`
    - Conditional Branch Instructions for Signed Numbers:
      - Branch if greater - `BG`
      - Branch if greater or equal - `BGE`
      - Branch if less - `BL`
      - Branch if less or equal - `BLE`
      - Branch if equal - `BE`
      - Branch if not equal - `BNE`
  - Procedure Call and Return Instructions
    - A *procedure* is a self-contained sequence of instructions that performs a given computational task
    - A procedure is also referred to as a *subroutine*
    - Each time the procedure is called, a branch is made to the beginning of the procedure to start executing its set of instructions; after the procedure has been executed, a branch is made again to return to the main program
    - The instruction that transfers control to a procedure is known by different names, including call procedure, call subroutine, jump to subroutine, branch to subroutine, and branch, and link
    - The routine containing the procedure call is the *calling procedure* or *caller*
    - The procedure being called is often referred to as the *callee*
    - The call procedure instruciton performs two operations:
      - First, it stores the value of the PC (the address following that of the call procedure instruction) in a temporary location; this address is called the *return address* and the corresponding instruction is the *continuation point* in the calling procedure
      - Second, the address in the call procedure instruction, the address of the first instruction in the procedure, is loaded into the PC
    - Different computers use different temporary memory locations for storing the return address; some computers store it in a fixed location in memory, some store it in a processor register, and some store it in a memory stack
    - The *calling convention* is the method used by a programming language or compiler to manage any parameter values transferred to the procedure and result values returned to the calling procedure, as well as temporary values stored in registers required by either the procedure or the calling procedure

- 9-9 Program Interrupt

  - In principle, the interrupt procedure is similar to a call procedure, except in three respects:
    - (1) The interrupt is usually initiated at an unpredictable point in the program by an external or internal signal, rather than the execution of an instruction
    - (2) The address of the service program that processes the interrupt request is determined by a hardware procedure, rather than the address field of an instruction
    - (3) In response to an interrupt, it is necessary to store information that defines all or part of the contents of the register set, rather than storing only the program counter
  - Most computers will not respond to an interrupt until the instruction that is in the process of being executed is completed; then, just before going to fetch the next instruction, the control checks for any interrupt signals
  - Types of Interrupts
    - The three major types of interrupts that cause a break in the normal execution of a program are as follows:
      - (1) *External interrupts*: come from input or output devices, from timing devices, from a circuit monitoring the power supply, or from any other external source
      - (2) *Internal interrupts*: arise from the invalid or erroneous use of an instruction or data
        - Internal interrupts are also called *traps*
        - e.g. arithmetic overflow, an attempt to divide by zero, an invalid opcode, a memory stack overflow, and a protection violation
        - A *protection violation* is an attempt to address an area of memory that is not supposed to be accessed by the currently executing program
      - (3) *Software interrupts*: initiated by executing an instruction
        - The software interrupt is a special call instruction that behaves like an interrupt rather than a procedure call
        - It can be used by the programmer to initiate an interrupt procedure at any desired point in the program
        - Typical use of the software interrupt is associated with a system call instruction
    - An alternative term for an interrupt is an *exception*
  - Processing External Interrupts
    - If there are more interrupt sources than there are interrupt inputs in the computer, two or more sources are ORed to form a common line
    - Simplified external interrupt configuration:
      - Four external interrupt sources are ORed to form a single interrupt input signal
      - Within the CPU is an enable-interrupt flip-flop (EI) that can be set or reset with two program instructions: enable interrupt (ENI) and disable interrupt (DSI)
      - When EI is 1 and the CPU is at the end of executing an instruction, the computer acknowledges the interrupt by enabling the interrupt acknowledge output INTACK
      - The interrupt source responds by providing an interrupt vector address IVAD
      - The IVAD is taken as the address of the first instruction of the program that services the interrupt