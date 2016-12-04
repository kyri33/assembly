NAME = HelloWorld

SRC = HelloWorld.asm

FLAGS = nasm -f elf

SRCO = HelloWorld.o

FLAGSO = ld -o

all: $(NAME)

$(NAME) :
	$(FLAGS) $(SRC)
	$(FLAGSO) $(NAME) $(SRCO)

clean:
	rm -f $(SRCO)

fclean: clean
	rm -f $(NAME)

re: fclean all
