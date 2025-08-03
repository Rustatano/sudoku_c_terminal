#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <memory.h>

int row_ok(int matrix[9][9], int n, int r);
int column_ok(int matrix[9][9], int n, int c);
int box_ok(int matrix[9][9], int n, int r, int c);
void copy_matrix(int from[9][9], int to[9][9]);
void print_matrix(int m[9][9]);

int main(void)
{
    srand(time(0));

    int matrix[9][9] = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 0
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 1
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 2
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 3
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 4
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 5
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 6
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 7
        {0, 0, 0, 0, 0, 0, 0, 0, 0}, // 8
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
                printf("Error: too many attempts\n");
                memcpy(matrix, matrix_copy, sizeof(matrix));
                c = 0;
                row = 0;
                cc++;
                if (cc > 10)
                {
                    printf("Error: TOO many attempts\n");
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

    // printing matrix
    print_matrix(matrix);

    // TODO:
    // hide few cells
    // user input
    // correct action checker
    // win checker

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
}
