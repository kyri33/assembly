NAME = addBig

ASM = nasm
ASMFLGS = -f elf32
CC = ld
CCFLGS = -m elf_i386 -o

SRCO = my_lib.o AddBig.o

all: $(NAME)

$(NAME): my_lib.o AddBig.o
	$(CC) $(CCFLGS) $(NAME) $(SRCO)

my_lib.o:my_lib.asm
	$(ASM) $(ASMFLGS) my_lib.asm

AddBig.o:AddBig.asm 
	$(ASM) $(ASMFLGS) AddBig.asm

re: fclean all

fclean: clean
	rm -Rf $(NAME)

clean:
	rm -Rf $(SRCO)