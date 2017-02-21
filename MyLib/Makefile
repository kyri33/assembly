NAME = test

ASM = nasm
ASMFLGS = -f elf64
LD = ld
LDFLGS = -o

SRCO = $(NAME).o my_lib.o

all: $(NAME)

$(NAME): $(NAME).o my_lib.o
	$(LD) $(LDFLGS) $(NAME) $(SRCO)

$(NAME).o: $(NAME).asm
	$(ASM) $(ASMFLGS) $(NAME).asm

my_lib.o: my_lib.asm
	$(ASM) $(ASMFLGS) my_lib.asm

clean:
	rm -Rf $(SRCO)

fclean: clean
	rm -Rf $(NAME)

re: fclean all