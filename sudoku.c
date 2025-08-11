#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <memory.h>

int row_ok(int matrix[9][9], int n, int r);
int column_ok(int matrix[9][9], int n, int c);
int box_ok(int matrix[9][9], int n, int r, int c);
void copy_matrix(int from[9][9], int to[9][9]);
void print_matrix(int m[9][9]);
int win_check(int matrix[9][9]);

int main(void)
{
    srand(time(0));

    int matrix[9][9] = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 1
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 2
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 3
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 4
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 4
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 5
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 7
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 8
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 9
        // a, b, c, d, e, f, g, h, i
    };
    int matrix_copy[9][9] = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
    };
    int erasable_map[9][9] = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
    };
    int column;
    int c = 0;
    int cc = 0;
    int row = 0;
    int num = 1;

    while (num < 10)
    {
        while (row < 9)
        {
            if (c > 50)
            {
                memcpy(matrix, matrix_copy, sizeof(matrix));
                c = 0;
                row = 0;
                cc++;
                if (cc > 10)
                {
                    memset(matrix, 0, sizeof(matrix));
                    memset(matrix_copy, 0, sizeof(matrix_copy));
                    cc = 0;
                    num = 1;
                }
                continue;
            }

            column = rand() % 9;
            if (matrix[row][column])
                continue;

            if (row_ok(matrix, num, row) && column_ok(matrix, num, column) && box_ok(matrix, num, row, column))
            {
                matrix[row][column] = num;
                row++;
            }
            c++;
        }
        row = 0;
        num++;
        memcpy(matrix_copy, matrix, sizeof(matrix_copy));
    }

    // print_matrix(matrix);

    // 1 = ~20 empty cells
    // 2 = ~30 empty cells
    // 3 = ~40 empty cells
    int difficulty;

    system("clear");
    printf("Enter difficulty: \n1 = easy, \n2 = medium (default), \n3 = hard \n");
    scanf("%d", &difficulty);
    system("clear");

    if (difficulty < 1 || difficulty > 3)
    {
        difficulty = 2;
    }

    for (int i = 0; i < 10 + 10 * difficulty + difficulty * 4; i++)
    {
        int r = rand() % 9;
        int c = rand() % 9;
        matrix[r][c] = 0;
        erasable_map[r][c] = 1;
    }

    while (1)
    {
        char coordinates[4];

        print_matrix(matrix);
        printf("Enter coordinates in format -> OPERATION(a = add, e == erase) + NUMBER(0-9) + COLUMN(a-i) + ROW(0-9), e.g. a4f5; 'q' to quit:\n");
        scanf("%s", coordinates);

        int num = coordinates[1] - 48;
        int column = coordinates[2] - 97;
        int row = coordinates[3] - 48 - 1;

        system("clear"); // clear terminal

        if (coordinates[0] == 'q')
        {
            printf("Quiting the game...\n");
            break;
        }
        else if (num < 1 || num > 9 || column < 0 || column > 9 || row < 0 || row > 9)
        {
            printf("Invalid coordinates!");
            continue;
        }

        if (coordinates[0] == 'e' && erasable_map[row][column] && matrix[row][column] == num)
        {
            matrix[row][column] = 0;
            printf("Removed %d from [%c;%d]", num, column + 97, row + 1);
        }
        else if (coordinates[0] == 'a' && matrix[row][column] == 0 && row_ok(matrix, num, row) && column_ok(matrix, num, column) && box_ok(matrix, num, row, column))
        {
            matrix[row][column] = num;
            printf("Added %d to [%c;%d]", num, column + 97, row + 1);
        }
        else
        {
            printf("Wrong");
        }
        if (win_check(matrix))
        {
            system("clear");
            printf("You won!\n");
            break;
        }
    }

    return 0;
}

int row_ok(int matrix[9][9], int n, int r)
{
    for (int i = 0; i < 9; i++)
    {
        if (matrix[r][i] == n)
            return 0;
    }
    return 1;
}

int column_ok(int matrix[9][9], int n, int c)
{
    for (int i = 0; i < 9; i++)
    {
        if (matrix[i][c] == n)
            return 0;
    }
    return 1;
}

int box_ok(int matrix[9][9], int n, int r, int c)
{
    int i = r / 3 * 3;
    int j = c / 3 * 3;
    for (int k = 0; k < 3; k++)
    {
        for (int l = 0; l < 3; l++)
        {
            if (matrix[i + k][j + l] == n)
                return 0;
        }
    }
    return 1;
}

void copy_matrix(int from[9][9], int to[9][9])
{
    for (int i = 0; i < 9; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            from[i][j] = to[i][j];
        }
    }
}

void print_matrix(int m[9][9])
{
    printf("\n\n");
    for (int i = 0; i < 9; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            printf("%d ", m[i][j]);
            if (j == 2 || j == 5)
                printf("| ");
        }
        printf("\n");
        if (i == 2 || i == 5)
            printf("---------------------\n");
    }
    printf("\n\n");
}

int win_check(int matrix[9][9])
{
    for (int i = 0; i < 9; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            if (matrix[i][j] == 0)
            {
                return 0;
            }
        }
    }
    return 1;
}
