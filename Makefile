# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nel-yama <nel-yama@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/22 21:03:05 by nel-yama          #+#    #+#              #
#    Updated: 2025/04/22 22:21:49 by nel-yama         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Compiler and flags
CC = cc
CFLAGS = -Wall -Wextra -Werror -g -I. -I./libft

# Source files for ft_printf
PRINTF_SRC = ft_printf.c

# Source files from libft
LIBFT_SRC = libft/ft_atoi.c libft/ft_bzero.c libft/ft_calloc.c \
	libft/ft_isalnum.c libft/ft_isalpha.c libft/ft_isascii.c \
	libft/ft_isdigit.c libft/ft_isprint.c libft/ft_itoa.c \
	libft/ft_memchr.c \
	libft/ft_memcmp.c libft/ft_memcpy.c libft/ft_memmove.c \
	libft/ft_memset.c libft/ft_putchar_fd.c libft/ft_putendl_fd.c \
	libft/ft_putnbr_fd.c libft/ft_putstr_fd.c libft/ft_split.c \
	libft/ft_strchr.c libft/ft_strdup.c libft/ft_striteri.c \
	libft/ft_strjoin.c libft/ft_strlcat.c libft/ft_strlcpy.c \
	libft/ft_str_has_whitespace.c libft/ft_is_str_unique.c \
	libft/ft_isspace.c libft/ft_strlen.c libft/ft_strmapi.c \
	libft/ft_strncmp.c libft/ft_strnstr.c libft/ft_strrchr.c \
	libft/ft_strtrim.c libft/ft_substr.c libft/ft_tolower.c \
	libft/ft_toupper.c libft/ft_put_hex_llnbr.c \
	libft/ft_put_unsigned_nbr.c libft/ft_putnbr_base.c \
	libft/ft_put_unsigned_nbr_base.c

# All source files
SRC = $(PRINTF_SRC) $(LIBFT_SRC)

# Object files
OBJ = $(SRC:.c=.o)

# libft Printf library name
NAME = libftprintf.a
HEADER = ft_printf.h

# Rules
.PHONY: all clean fclean re

# Default rule: make all will call make libft.a
all: $(NAME)

# Create the library
$(NAME): $(OBJ)
	@echo "Creating library $@"
	@ar rcs $@ $^

# Compile source files
%.o: %.c
	@echo "Compiling $<"
	@$(CC) $(CFLAGS) -c $< -o $@

# Remove object files
clean:
	@echo "Cleaning object files..."
	@rm -f $(OBJ)

# Remove object files and the library
fclean: clean
	@echo "Cleaning the library..."
	@rm -f $(NAME)

# Rebuild the library
re: fclean all
