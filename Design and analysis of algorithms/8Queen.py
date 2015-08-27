
board = []
size = 8
number = 0.

def place(row, col):
    for (i, j) in board:
        if row == i: return True
        if col == j: return True
        if abs(row - i) == abs(col - j): return True
    return False
    
def placequeen(row):
    if row > size:
	global number
	number += 1
	print "Solution " + str(number) + ":" + str(board)
    else:
        for col in range(1, size + 1):
            if not place(row, col):
                board.append((row, col))
                placequeen(row + 1)
                board.remove((row, col))

if __name__ == "__main__":
	placequeen(1)

