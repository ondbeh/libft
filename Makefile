# Name of the library
NAME = libft.a

# Directories
SRC_DIR = src
OBJ_DIR = obj
INC_DIR = inc

# Compiler and flags
CC = cc
CFLAGS = -Wall -Wextra -Werror -I $(INC_DIR)
RM = rm -f

# Source files and corresponding object files
SRCS = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_strlen.c ft_memset.c \
		ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c \
		ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c \
		ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c \
		ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
		ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c \
		ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c get_next_line.c ft_atoi_base.c \
		ft_count_words.c ft_lstcontains.c ft_lstremove.c ft_strcmp.c

SRCS := $(addprefix $(SRC_DIR)/, $(SRCS))
OBJS = $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)


# Rules

# Default rule: build the library
all: $(NAME)

# Rule to create the library
$(NAME):$(OBJS)
	@echo "Building $(NAME)"
	@ar -rcs $(NAME) $(OBJS)

# Rule to compile .c files to .o files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@echo "Compiling $<"
	@$(CC) $(CFLAGS) -c $< -o $@

# Create obj/ directory if it doesn't exist
$(OBJ_DIR):
	@echo "Creating $(OBJ_DIR)/ directory for $(NAME)"
	@mkdir -p $(OBJ_DIR)

# Rule to clean up object files
clean:
	@echo "Cleaning up object files for $(NAME)"
	@$(RM) -r $(OBJ_DIR)

# Rule to clean up object files and the library
fclean: clean
	@echo "Cleaning up $(NAME)"
	@$(RM) $(NAME)

# Rule to rebuild everything from scratch
re: fclean all

# Phony targets to avoid conflicts with files of the same name
.PHONY: all clean fclean re bonus
