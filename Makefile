# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mjose-ye <mjose-ye@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/15 12:57:51 by mjose-ye          #+#    #+#              #
#    Updated: 2022/03/03 11:15:37 by mjose-ye         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

HEADER = minishell.h

INCLUDE = -I ./includes

FOLDER = ./src/

FOLDER_OBJS = ./objs/

LIBFT = ./42_Libft/libft.a


SRC =	$(FOLDER)minishell.c

OBJS =	$(patsubst $(FOLDER)%.c, $(FOLDER_OBJS)%.o, $(SRC))

CC = gcc -g

CFLAGS = -Wextra -Werror -Wall

all:$(NAME)

$(FOLDER_OBJS)%.o: $(FOLDER)%.c
	@mkdir -p $(FOLDER_OBJS)
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

$(NAME): $(LIBFT) $(OBJS)
	$(CC) $(CFLAGS) $(LIBFT) $(INCLUDE) ./objs/*.o -o  $(NAME)

$(LIBFT):
	make -C ./42_Libft

clean:
	rm -f $(OBJS)
	make clean -C ./42_Libft

fclean: clean
	rm -f $(NAME)
	make fclean -C ./42_Libft

re: fclean all