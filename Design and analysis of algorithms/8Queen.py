#Name – Tejaswini Changal
#Class – BE A
#Roll no. - 118
#---------------------------------------------------------------
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

"""""""""""""""""""""""""OUTPUT"""""""""""""""""""""""""""""""""""
guest-l8MgEE@oslab07:~$ cd Desktop
guest-l8MgEE@oslab07:~/Desktop$ python nQueen.py
Solution 1:[(1, 1), (2, 5), (3, 8), (4, 6), (5, 3), (6, 7), (7, 2), (8, 4)]
Solution 2:[(1, 1), (2, 6), (3, 8), (4, 3), (5, 7), (6, 4), (7, 2), (8, 5)]
Solution 3:[(1, 1), (2, 7), (3, 4), (4, 6), (5, 8), (6, 2), (7, 5), (8, 3)]
Solution 4:[(1, 1), (2, 7), (3, 5), (4, 8), (5, 2), (6, 4), (7, 6), (8, 3)]
Solution 5:[(1, 2), (2, 4), (3, 6), (4, 8), (5, 3), (6, 1), (7, 7), (8, 5)]
Solution 6:[(1, 2), (2, 5), (3, 7), (4, 1), (5, 3), (6, 8), (7, 6), (8, 4)]
Solution 7:[(1, 2), (2, 5), (3, 7), (4, 4), (5, 1), (6, 8), (7, 6), (8, 3)]
Solution 8:[(1, 2), (2, 6), (3, 1), (4, 7), (5, 4), (6, 8), (7, 3), (8, 5)]
Solution 9:[(1, 2), (2, 6), (3, 8), (4, 3), (5, 1), (6, 4), (7, 7), (8, 5)]
Solution 10:[(1, 2), (2, 7), (3, 3), (4, 6), (5, 8), (6, 5), (7, 1), (8, 4)]
Solution 11:[(1, 2), (2, 7), (3, 5), (4, 8), (5, 1), (6, 4), (7, 6), (8, 3)]
Solution 12:[(1, 2), (2, 8), (3, 6), (4, 1), (5, 3), (6, 5), (7, 7), (8, 4)]
Solution 13:[(1, 3), (2, 1), (3, 7), (4, 5), (5, 8), (6, 2), (7, 4), (8, 6)]
Solution 14:[(1, 3), (2, 5), (3, 2), (4, 8), (5, 1), (6, 7), (7, 4), (8, 6)]
Solution 15:[(1, 3), (2, 5), (3, 2), (4, 8), (5, 6), (6, 4), (7, 7), (8, 1)]
Solution 16:[(1, 3), (2, 5), (3, 7), (4, 1), (5, 4), (6, 2), (7, 8), (8, 6)]
Solution 17:[(1, 3), (2, 5), (3, 8), (4, 4), (5, 1), (6, 7), (7, 2), (8, 6)]
Solution 18:[(1, 3), (2, 6), (3, 2), (4, 5), (5, 8), (6, 1), (7, 7), (8, 4)]
Solution 19:[(1, 3), (2, 6), (3, 2), (4, 7), (5, 1), (6, 4), (7, 8), (8, 5)]
Solution 20:[(1, 3), (2, 6), (3, 2), (4, 7), (5, 5), (6, 1), (7, 8), (8, 4)]
Solution 21:[(1, 3), (2, 6), (3, 4), (4, 1), (5, 8), (6, 5), (7, 7), (8, 2)]
Solution 22:[(1, 3), (2, 6), (3, 4), (4, 2), (5, 8), (6, 5), (7, 7), (8, 1)]
Solution 23:[(1, 3), (2, 6), (3, 8), (4, 1), (5, 4), (6, 7), (7, 5), (8, 2)]
Solution 24:[(1, 3), (2, 6), (3, 8), (4, 1), (5, 5), (6, 7), (7, 2), (8, 4)]
Solution 25:[(1, 3), (2, 6), (3, 8), (4, 2), (5, 4), (6, 1), (7, 7), (8, 5)]
Solution 26:[(1, 3), (2, 7), (3, 2), (4, 8), (5, 5), (6, 1), (7, 4), (8, 6)]
Solution 27:[(1, 3), (2, 7), (3, 2), (4, 8), (5, 6), (6, 4), (7, 1), (8, 5)]
Solution 28:[(1, 3), (2, 8), (3, 4), (4, 7), (5, 1), (6, 6), (7, 2), (8, 5)]
Solution 29:[(1, 4), (2, 1), (3, 5), (4, 8), (5, 2), (6, 7), (7, 3), (8, 6)]
Solution 30:[(1, 4), (2, 1), (3, 5), (4, 8), (5, 6), (6, 3), (7, 7), (8, 2)]
Solution 31:[(1, 4), (2, 2), (3, 5), (4, 8), (5, 6), (6, 1), (7, 3), (8, 7)]
Solution 32:[(1, 4), (2, 2), (3, 7), (4, 3), (5, 6), (6, 8), (7, 1), (8, 5)]
Solution 33:[(1, 4), (2, 2), (3, 7), (4, 3), (5, 6), (6, 8), (7, 5), (8, 1)]
Solution 34:[(1, 4), (2, 2), (3, 7), (4, 5), (5, 1), (6, 8), (7, 6), (8, 3)]
Solution 35:[(1, 4), (2, 2), (3, 8), (4, 5), (5, 7), (6, 1), (7, 3), (8, 6)]
Solution 36:[(1, 4), (2, 2), (3, 8), (4, 6), (5, 1), (6, 3), (7, 5), (8, 7)]
Solution 37:[(1, 4), (2, 6), (3, 1), (4, 5), (5, 2), (6, 8), (7, 3), (8, 7)]
Solution 38:[(1, 4), (2, 6), (3, 8), (4, 2), (5, 7), (6, 1), (7, 3), (8, 5)]
Solution 39:[(1, 4), (2, 6), (3, 8), (4, 3), (5, 1), (6, 7), (7, 5), (8, 2)]
Solution 40:[(1, 4), (2, 7), (3, 1), (4, 8), (5, 5), (6, 2), (7, 6), (8, 3)]
Solution 41:[(1, 4), (2, 7), (3, 3), (4, 8), (5, 2), (6, 5), (7, 1), (8, 6)]
Solution 42:[(1, 4), (2, 7), (3, 5), (4, 2), (5, 6), (6, 1), (7, 3), (8, 8)]
Solution 43:[(1, 4), (2, 7), (3, 5), (4, 3), (5, 1), (6, 6), (7, 8), (8, 2)]
Solution 44:[(1, 4), (2, 8), (3, 1), (4, 3), (5, 6), (6, 2), (7, 7), (8, 5)]
Solution 45:[(1, 4), (2, 8), (3, 1), (4, 5), (5, 7), (6, 2), (7, 6), (8, 3)]
Solution 46:[(1, 4), (2, 8), (3, 5), (4, 3), (5, 1), (6, 7), (7, 2), (8, 6)]
Solution 47:[(1, 5), (2, 1), (3, 4), (4, 6), (5, 8), (6, 2), (7, 7), (8, 3)]
Solution 48:[(1, 5), (2, 1), (3, 8), (4, 4), (5, 2), (6, 7), (7, 3), (8, 6)]
Solution 49:[(1, 5), (2, 1), (3, 8), (4, 6), (5, 3), (6, 7), (7, 2), (8, 4)]
Solution 50:[(1, 5), (2, 2), (3, 4), (4, 6), (5, 8), (6, 3), (7, 1), (8, 7)]
Solution 51:[(1, 5), (2, 2), (3, 4), (4, 7), (5, 3), (6, 8), (7, 6), (8, 1)]
Solution 52:[(1, 5), (2, 2), (3, 6), (4, 1), (5, 7), (6, 4), (7, 8), (8, 3)]
Solution 53:[(1, 5), (2, 2), (3, 8), (4, 1), (5, 4), (6, 7), (7, 3), (8, 6)]
Solution 54:[(1, 5), (2, 3), (3, 1), (4, 6), (5, 8), (6, 2), (7, 4), (8, 7)]
Solution 55:[(1, 5), (2, 3), (3, 1), (4, 7), (5, 2), (6, 8), (7, 6), (8, 4)]
Solution 56:[(1, 5), (2, 3), (3, 8), (4, 4), (5, 7), (6, 1), (7, 6), (8, 2)]
Solution 57:[(1, 5), (2, 7), (3, 1), (4, 3), (5, 8), (6, 6), (7, 4), (8, 2)]
Solution 58:[(1, 5), (2, 7), (3, 1), (4, 4), (5, 2), (6, 8), (7, 6), (8, 3)]
Solution 59:[(1, 5), (2, 7), (3, 2), (4, 4), (5, 8), (6, 1), (7, 3), (8, 6)]
Solution 60:[(1, 5), (2, 7), (3, 2), (4, 6), (5, 3), (6, 1), (7, 4), (8, 8)]
Solution 61:[(1, 5), (2, 7), (3, 2), (4, 6), (5, 3), (6, 1), (7, 8), (8, 4)]
Solution 62:[(1, 5), (2, 7), (3, 4), (4, 1), (5, 3), (6, 8), (7, 6), (8, 2)]
Solution 63:[(1, 5), (2, 8), (3, 4), (4, 1), (5, 3), (6, 6), (7, 2), (8, 7)]
Solution 64:[(1, 5), (2, 8), (3, 4), (4, 1), (5, 7), (6, 2), (7, 6), (8, 3)]
Solution 65:[(1, 6), (2, 1), (3, 5), (4, 2), (5, 8), (6, 3), (7, 7), (8, 4)]
Solution 66:[(1, 6), (2, 2), (3, 7), (4, 1), (5, 3), (6, 5), (7, 8), (8, 4)]
Solution 67:[(1, 6), (2, 2), (3, 7), (4, 1), (5, 4), (6, 8), (7, 5), (8, 3)]
Solution 68:[(1, 6), (2, 3), (3, 1), (4, 7), (5, 5), (6, 8), (7, 2), (8, 4)]
Solution 69:[(1, 6), (2, 3), (3, 1), (4, 8), (5, 4), (6, 2), (7, 7), (8, 5)]
Solution 70:[(1, 6), (2, 3), (3, 1), (4, 8), (5, 5), (6, 2), (7, 4), (8, 7)]
Solution 71:[(1, 6), (2, 3), (3, 5), (4, 7), (5, 1), (6, 4), (7, 2), (8, 8)]
Solution 72:[(1, 6), (2, 3), (3, 5), (4, 8), (5, 1), (6, 4), (7, 2), (8, 7)]
Solution 73:[(1, 6), (2, 3), (3, 7), (4, 2), (5, 4), (6, 8), (7, 1), (8, 5)]
Solution 74:[(1, 6), (2, 3), (3, 7), (4, 2), (5, 8), (6, 5), (7, 1), (8, 4)]
Solution 75:[(1, 6), (2, 3), (3, 7), (4, 4), (5, 1), (6, 8), (7, 2), (8, 5)]
Solution 76:[(1, 6), (2, 4), (3, 1), (4, 5), (5, 8), (6, 2), (7, 7), (8, 3)]
Solution 77:[(1, 6), (2, 4), (3, 2), (4, 8), (5, 5), (6, 7), (7, 1), (8, 3)]
Solution 78:[(1, 6), (2, 4), (3, 7), (4, 1), (5, 3), (6, 5), (7, 2), (8, 8)]
Solution 79:[(1, 6), (2, 4), (3, 7), (4, 1), (5, 8), (6, 2), (7, 5), (8, 3)]
Solution 80:[(1, 6), (2, 8), (3, 2), (4, 4), (5, 1), (6, 7), (7, 5), (8, 3)]
Solution 81:[(1, 7), (2, 1), (3, 3), (4, 8), (5, 6), (6, 4), (7, 2), (8, 5)]
Solution 82:[(1, 7), (2, 2), (3, 4), (4, 1), (5, 8), (6, 5), (7, 3), (8, 6)]
Solution 83:[(1, 7), (2, 2), (3, 6), (4, 3), (5, 1), (6, 4), (7, 8), (8, 5)]
Solution 84:[(1, 7), (2, 3), (3, 1), (4, 6), (5, 8), (6, 5), (7, 2), (8, 4)]
Solution 85:[(1, 7), (2, 3), (3, 8), (4, 2), (5, 5), (6, 1), (7, 6), (8, 4)]
Solution 86:[(1, 7), (2, 4), (3, 2), (4, 5), (5, 8), (6, 1), (7, 3), (8, 6)]
Solution 87:[(1, 7), (2, 4), (3, 2), (4, 8), (5, 6), (6, 1), (7, 3), (8, 5)]
Solution 88:[(1, 7), (2, 5), (3, 3), (4, 1), (5, 6), (6, 8), (7, 2), (8, 4)]
Solution 89:[(1, 8), (2, 2), (3, 4), (4, 1), (5, 7), (6, 5), (7, 3), (8, 6)]
Solution 90:[(1, 8), (2, 2), (3, 5), (4, 3), (5, 1), (6, 7), (7, 4), (8, 6)]
Solution 91:[(1, 8), (2, 3), (3, 1), (4, 6), (5, 2), (6, 5), (7, 7), (8, 4)]
Solution 92:[(1, 8), (2, 4), (3, 1), (4, 3), (5, 6), (6, 2), (7, 7), (8, 5)]
guest-l8MgEE@oslab07:~/Desktop$ 



