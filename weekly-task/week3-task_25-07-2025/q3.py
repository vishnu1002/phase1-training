class CustomList:
    def __init__(self, items):
        self.items = items
    def __len__(self):
        return len(self.items)
    def __getitem__(self, index):
        return self.items[index]
    def __setitem__(self, index, value):
        self.items[index] = value
    def __delitem__(self, index):
        del self.items[index]


