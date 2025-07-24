# filename = input("Enter filename to analyze: ")
filename = "multilines.txt"
try:
    with open(filename, 'r') as f:
        lines = f.readlines()
        num_lines = len(lines)
        num_words = sum(len(line.split()) for line in lines)
        num_chars = sum(len(line) for line in lines)
    print(f"Lines: {num_lines}")
    print(f"Words: {num_words}")
    print(f"Characters: {num_chars}")
except FileNotFoundError:
    print("File not found.")