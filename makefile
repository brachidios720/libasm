NAME = libasm.a
SRC = ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_strdup.s \
		ft_read.s \
		ft_write.s \

OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

%.o: %.s
	nasm -f elf64 -DPIC $< -o $@

clean:
	rm -f $(OBJ) test

fclean: clean
	rm -f $(NAME) 

re: fclean all
