CHAPTER 12: MEMORY SYSTEMS

- 12-1 Memory Hierarchy
  - The lowest level of the hierarchy is a small, fast memory called a *cache*
    - For the hierarchy to function well, a very large proportion of the CPU instruction and operand fetches are expected to be from the cache
  - At the next level upward is the *main memory*
    - The main memory serves directly most of the CPU instructions and operand fetches not satisfied by the cache
    - In addition, the cache fetches all of its data, some portion of which is passed on to the CPU, from the main memory
  - At the top level is the *hard drive*
    - Only accessed in very infrequent cases where a CPU instruction or a operand fetch is not found in main memory
  - With this memory hierarchy, since the CPU fetches most of the instructions and operands from the ache, it "sees" a fast memory, most of the time
- 12-2 Locality of Reference
  - The success of the memory hierarchy is based on assumptions that are critical to achieving the appearance of a large, fast memory, called *locality of reference*
  - The term locality refers to the relative times at which instructions and operands are accessed (*temporal locality*) and the relative locations at which they reside in main memory (*spatial locality*)
  - Locality for Instruction Fetches
    - A program frequently contains many loops; this is an example of *temporal locality* in the sense that an address which is accessed for an instruction fetch is likely to be accessed many times in the near future
    - It is likely that the addresses of the instructions will be in sequential order; thus, if an address is accessed for an instruction, nearby addresses are going to be addressed during the execution of the loop; this is an example of *spatial locality*
  - Locality for Accessing Operands
    - In a computation on an array of numbers, there are multiple visits to the locations of many of the operands, giving *temporal locality*
    - As the computation proceeds, when a particular address is accessed for a number, sequential addresses near it are likely to be accessed for other numbers in the array, giving *spatial locality*
  - From the prior discussion, we can conjecture that there is significant locality of reference in computer programs
  - Words are read from and written to the hard drive in blocks referred to as *pages*
  - If the movement of pages between main memory and hard drive is transparent to the programmer, then it will appear as if main memory is large enough to hold the entire program and all of the data; hence this automated arrangement is known as *virtual memory*
  - In summary, locality of reference is absolutely key to the success of the concepts of cache memory and virtual memory
  - Occasionally one does encounter a program that requires frequent access to a large body of data that cannot be accomodated in main memory; in such a case, the computer spends almost all of its time moving information between main memory and the hard drive and does little other computation; emanation of continous sounds from the hard drive as the heads move from track to track is a telltale sign of this phenomenon, referred to as *thrashing*
- 12-3 Cache Memory
  - The cache address, or *index*, is bits 2 through 4 of the main memory address in the example cache
  - The upper 5 bits of the main memory address, called the *tag*, are stored in the cache along with the data
  - The case in which a memory word is fetched from cache is called a *cache hit*
  - If the memory word is not available in the cache, the case is called a *cache miss*
  - Cache Mappings
    - The mapping in which only one specific location in the cache can contain the word from a a particular main memory location, is called *direct mapping*
    - In contrast, *fully associative mapping* is when we let locations in main memory map into an arbitrary location in the cache; any location in memory can be mapped to any of the addresses in the cache
    - A compromise between the first two is *set-associative mapping*; in this case there are sets of locations and associativity is used on the sets; such a mapping with set size s is an s-way set-associative mapping
    - Replacement Strategies: the cache designed must select a replacement approach that determines the location in the cache to be used for the incoming tag and data
      - Random replacement
      - First-in, first-out (FIFO)
      - Least recently used (LRU)
  - Line Size
    - Rather than a single word being fetched from main memory when a cache miss occurs, a block of l words called a line is fetched
  - Cache Loading
    - Before any words and tags have been loaded into the cache, all locations contain invalid information
    - To deal with this problem, in addition to a tag, a bit is added to each cache entry; this *valid bit* indicates that the associated cache line is valid (1) or invalid (0)
  - Write Methods
    - Cache write methods fall into two categories: write-through and write-back
    - In *write-through*, the result is always written to main memory
      - This uses the main memory write time and can slow down processing
    - In the *write-back* method, also called copy-back, the CPU performs a write only to the cache in the case of a cache hit; if there is a miss, the CPU performs a write to main memory
      - To avoid a write-back on every read miss, an additional bit is added to each cache entry; this bit, called the *dirty bit*, is a 1 if the line in the cache has been written and a 0 if it has not been written
  - Integration of Concepts
    - We now put together the basic concepts we have examined to determine the block diagram for a 256 KB, two-way set-associative cache with write-through
      - First a read hit is discussed
      - Second a read miss is discussed
      - Last a write operation is discussed
  - Instruction and Data Caches
    - In most of the designs in previous chapters, we assumed that it was possible to fetch an instruction and to read an operand or write a result in the same clock cycle; in response to this need we discussed having both an *instruction cache* and a *data cache*
    - In other cases, a single cache for both instructions and data may be used; the *unified cache* allows cache entries to be shared by instructions and data freely
  - Multiple-Level Caches
    - It is possible to extend the depth of the memory hierarchy by adding additional levels of cache
    - Two levels of cache, often referred to as L1 and L2, with L1 closest to the CPU, are often used
- 12-4 Virtual Memory
  - We now explore the relationship between main memory and hard drive
  - The job of the software and hardware that implement virtual memory is to map each *virtual address* for each program into a *physical address* in the main memory
  - The virtual address space is divided into blocks of addresses, typically of a fixed size; these blocks, called *pages*, are larger than, but analogous to, lines in a cache
  - The physical address space in memory is divided into blocks called *page frames* that are the same size as the pages
  - The portion of the virtual address used to address words or bytes within a page is the *page offset*, which is the only part of the address that the virtual and physical addresses share
  - The portion of the virtual address used to select pages from the virtual address space is the *virtual page number*
  - The portion of the physical address used to select pages in main memory is the *page frame number*
  - Page Tables
    - In general, there may be a very large number of virtual pages, each of which must be mapped to either main memory or hard drive; the mapping are stored in a data structure called a *page table*
    - A special table for each program called a *directory page* provides the mappings used to locate the 4 KB program page tables
    - A page table entry has a Validity bit, Dirty, bit, Used bit, and may have additional bit positions reserved for flags used by the OS  (read/write protection status of a page or whether a page can be accessed in user mode or supervisor mode)
    - The *directory page pointer* is a register that points to the location of the directory page in main memory
  - Translation Lookaside Buffer
    - To make virtual memory feasible, we need to drastically reduce accesses to main memory
    - To reduce the number of accesses, we will employ yet another cache for the purpose of translating the virtual address directly into a physical address; this new cache is called a *translation lookaside buffer (TLB)*
    - The TLB holds the locations of recently addressed pages to speed access to cache or main memory
    - If the physical page does not exist in main memory, then a *page fault* occurs
    - The effectiveness of virtual memory depends on temporal and spatial locality
    - Note that the basic hardware for implementing virtual memory, the TLB, and other optional features for memory access are included in the MMU in the generic computer
    - Among other features is hardware support for an additional layer of virtual addressing called segmentation and for protection mechanisms to permit appropriate isolation and sharing of programs and data
  - Virtual Memory and Cache
    - In the case that cache and virtual memory are both present, the virtual address is converted to the physical address and then the physical address is applied to the cache
    - Assuming that the TLB takes one clock cycle and the cache takes one clock cycle, in the best of cases fetching an instruction or operand requires two CPU clock cycles
    - It is possible to modify the CPU pipeline and consider the TLB and cache to be a two-stage pipeline segment, so that an instruction fetch appears to require only one clock cycle