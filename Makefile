CC := gcc
CFLAGS := -std=gnu11 -Wall -Wextra -Wpedantic -g -fsanitize=address,undefined
TARGET := sniffer
BUILD := build

SRCS := $(wildcard src/*.c)
OBJS := $(SRCS:src/%.c=$(BUILD)/%.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD)/%.o: src/%.c | $(BUILD)
	$(CC) $(CFLAGS) -MMD -c $< -o $@

$(BUILD):
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD) $(TARGET)

.PHONY: all clean

-include $(OBJS:.o=.d)
