class Stack:
    def __init__(self):
        self.items = []
    def push(self, item):
        self.items.append(item)
    def pop(self):
        if not self.is_empty():
            return self.items.pop()
        return None
    def peek(self):
        if not self.is_empty():
            return self.items[-1]
        return None
    def is_empty(self):
        return len(self.items) == 0
    def size(self):
        return len(self.items)

if __name__ == "__main__":
    stack = Stack()
    print("Is stack empty?", stack.is_empty())
    stack.push(10)
    stack.push(20)
    stack.push(30)
    print("Stack after pushes:", stack.items)
    print("Top item (peek):", stack.peek())
    print("Stack size:", stack.size())
    popped = stack.pop()
    print(f"Popped item: {popped}")
    print("Stack after pop:", stack.items)
    print("Is stack empty?", stack.is_empty())
    stack.pop()
    stack.pop()
    print("Stack after popping all items:", stack.items)
    print("Is stack empty?", stack.is_empty()) 