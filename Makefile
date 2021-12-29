# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emomkus <emomkus@student.42wolfsburg.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/29 00:00:30 by emomkus           #+#    #+#              #
#    Updated: 2021/12/29 15:17:17 by emomkus          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#---- Update bellow -----------------------------------------------#

MAIN_FILE = push_swap.c
SORT_FILE = src/game/sort_read.c
MEDIUM_FILES = confirm_add.c input_var.c ft_lst_swap.c ft_lst_push.c \
			ft_lst_rotate.c ft_lst_rotate_rv.c
MEDIUM_FILES_DIR = src/medium/
MONITOR_FILES = src/visual/print_feature_bonus.c
OBJ = push_swap.o confirm_add.o	input_var.o
LIBFT_FILES = libft.h libft.a 
LIBFT_DIR = src/libft/
FLAG = -Wall -Wextra -Werror
HEADER = src/push_swap.h

#---- Update above ------------------------------------------------#

MEDIUM = $(addprefix $(MEDIUM_FILES_DIR),$(MEDIUM_FILES))#	medium files #
FILES = $(MAIN_FILE) $(MEDIUM) $(MONITOR_FILES)#				ALL FILES #
FILES2 = $(SORT_FILE) $(MEDIUM) $(MONITOR_FILES)#				ALL FILES #
LIBFT = $(addprefix $(LIBFT_DIR),$(LIBFT_FILES)) #			LIBFT library #
OUT_NAME = push_swap # 								program name output #
OUT_NAME_2 = stack_sort_game

all: $(OUT_NAME)

$(OUT_NAME):
	test -f $(LIBFT_DIR)libft.a || make rebonus -C $(LIBFT_DIR)
	gcc $(FLAG) $(FILES2) $(HEADER) $(LIBFT) -o $(OUT_NAME_2)

re:
	rm $(OUT_NAME_2)
	test -f $(LIBFT_DIR)libft.a || make rebonus -C $(LIBFT_DIR)
	gcc $(FLAG) $(FILES2) $(HEADER) $(LIBFT) -o $(OUT_NAME_2)
	
libup:
	make rebonus -C $(LIBFT_DIR)
	test -f $(OUT_NAME_2) || rm $(OUT_NAME_2)
	gcc $(FLAG) $(FILES2) $(HEADER) $(LIBFT) -o $(OUT_NAME_2)

sort:
	test -f $(OUT_NAME_2) || rm $(OUT_NAME_2)
	test -f $(LIBFT_DIR)libft.a || make rebonus -C $(LIBFT_DIR)
	gcc $(FLAG) $(FILES2) $(HEADER) $(LIBFT) -o $(OUT_NAME_2)

	
.PHONY:			all re libup