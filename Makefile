# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pmartine <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/04/05 19:43:41 by pmartine          #+#    #+#              #
#    Updated: 2016/04/05 19:44:21 by pmartine         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf

SRC = src/coord.c src/hook.c src/mlx_pixel_wput.c src/vect_crux.c src/vect_octant_5_8.c src/draw.c src/main.c src/vect_ab.c src/vect_octant_1_4.c

FLAGS = -Wall -Werror -Wextra

$(NAME):
	make -C libft/ re
	make -C minilibx_macos/ re
	@gcc $(CFLAGS) -o $(NAME) $(SRC) -I libft/includes/libft.h \
		-lmlx -framework OpenGl -framework Appkit libft/libft.a
	@echo "Program created"
all: $(NAME)

clean:
	rm -f *.o

fclean: clean
	rm -f $(NAME)
	make -C minilibx_macos/ clean
	make -C libft/ fclean
	@echo "all files removed"

re: fclean all

git: fclean
	git add *
	git commit -m "maj"
	git push
	@echo "GIT PUSH done"

yo: re
	./fdf 42.fdf

.PHONY : all clean fclean re