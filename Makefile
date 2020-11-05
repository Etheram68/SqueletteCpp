# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: frfrey <frfrey@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/05 10:52:50 by frfrey            #+#    #+#              #
#    Updated: 2020/11/05 12:35:54 by frfrey           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

HEADER					= include/

SRC_PATH				= srcs/

SRC_NAME				= main.cpp

SRCS					= $(addprefix $(SRC_PATH), $(SRC_NAME))

OBJ_NAME				= $(SRC_NAME:.cpp=.o)

OBJ_PATH				= obj/

OBJ						= $(addprefix $(OBJ_PATH), $(OBJ_NAME))

NAME					= Learn

RM						= rm -rf

CC						= clang++-9

FLAG					= -Wall -Wextra -Werror -std=c++17

ifdef DEBUG
FLAG					+= -g
endif

#FLAGS					= -g3 -fsanitize=address -Wconversion

# **************************************************************************** #
#								REGLES									       #
# **************************************************************************** #

all: $(OBJ_PATH) $(NAME) $(HEADER)

$(NAME): $(OBJ)
	@$(CC) $(FLAG) $(OBJ) -o $(NAME)
	@printf "\33[2K\r \033[0m\033[0;33mLearn: \t\033[0;38;5;121mUpdated\n\033[0m"

$(OBJ_PATH):
	@mkdir -p obj/ 2> /dev/null

$(OBJ_PATH)%.o: $(SRC_PATH)%.cpp
	@printf "\033[2K\r\033[0;32m[Compiling] : \t\033[0;32m\033[0m$<"
	@$(CC) $(FLAG) -I $(HEADER) -c $< -o $@

clean:
	@printf "\033[2K\r\033[31mDeleting Learn srcs/	\033[37m"
	@sleep 0.1
	@printf "\033[2K\r\033[31mDeleting Learn srcs/.	\033[37m"
	@sleep 0.1
	@printf "\033[2K\r\033[31mDeleting Learn srcs/..	\033[37m"
	@sleep 0.1
	@printf "\033[2K\r\033[31mDeleting Learn srcs/...	\033[37m"
	@sleep 0.1
	@printf "\033[2K\r\033[31mDeleting Learn srcs/	\033[37m"
	@sleep 0.1
	@printf "\033[2K\r\033[31mDeleting Learn srcs/.	\033[37m"
	@sleep 0.1
	@printf "\033[2K\r\033[31mDeleting Learn srcs/..	\033[37m"
	@sleep 0.1
	@printf "\033[2K\r\033[31mDeleting Learn srcs/...	\033[37m"
	@sleep 0.1
	@${RM} ${OBJ_PATH}
	@printf "\33[2K\r \033[0;32m[OK] \033[0m \033[36m Deleted successfully!\n\033[0m"

fclean: clean
	@${RM} ${NAME}

re: fclean all

.PHONY: clean fclean
