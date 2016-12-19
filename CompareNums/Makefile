NAME = comparenums

SRC = comparenums.asm

FLAGS = nasm -f elf64

SRCO = comparenums.o

FLAGSO = ld -o

all: $(NAME)

$(NAME):
	$(FLAGS) $(SRC)
	$(FLAGSO) $(NAME) $(SRCO)

clean:
	rm -f $(SRCO)

fclean: clean
	rm -f $(NAME)

re: fclean all
