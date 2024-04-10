NAME		=	checker
CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror
SRC			=	src/free_errors/free_list.c\
				src/free_errors/free_tab.c\
				src/free_errors/ft_error.c\
				src/free_errors/handle_error.c\
				src/init/init_with_split.c\
				src/init/init_without_split.c\
				src/list_functions/create_list.c\
				src/list_functions/ps_lstadd_back.c\
				src/list_functions/ps_lstlast.c\
				src/list_functions/ps_lstnew.c\
				src/parsing/check_for_occurence.c\
				src/parsing/is_int.c\
				src/parsing/tab_is_digit.c\
				src/ps_functions/pa.c\
				src/ps_functions/pb.c\
				src/ps_functions/ra.c\
				src/ps_functions/rb.c\
				src/ps_functions/rr.c\
				src/ps_functions/rra.c\
				src/ps_functions/rrb.c\
				src/ps_functions/rrr.c\
				src/ps_functions/sa.c\
				src/ps_functions/sb.c\
				src/utils/count_stack.c\
				src/utils/ft_strcmp.c\
				src/utils/is_sorted.c\
				src/checker.c

OBJ			=	${SRC:.c=.o}
MAKE_LIBFT	=	@make -C libft
LIBFT		=	libft/libft.a

all: $(NAME)

$(NAME): $(SRC) $(OBJ)
	$(MAKE_LIBFT)
	$(MAKE_LIBFT) bonus
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT) -o $(NAME)

clean:
	rm -rf $(OBJ)
	$(MAKE_LIBFT) clean

fclean:	clean
	rm -rf $(NAME)
	$(MAKE_LIBFT) fclean

re : fclean all

.PHONY: all, clean, fclean, re, bonus
