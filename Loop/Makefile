NAME = loop

SRC = loop.asm

FLAGS = nasm -f elf

SRCO = loop.o

FLAGSO = ld -m elf_i386 -s -o

all: $(NAME)

$(NAME):
	$(FLAGS) $(SRC)
	$(FLAGSO) $(NAME) $(SRCO)
clean:
	rm -f $(SRCO)

fclean: clean
	rm -f $(NAME)

re: fclean all
