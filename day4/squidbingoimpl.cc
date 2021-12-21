#include "squidbingo.h"
#include <iostream>

BingoBlock :: BingoBlock(std::string bingoBlock)
{
    std::cout << bingoBlock;
}

void BingoBlock::markCell(int number)
{
    for (int i = 0; i < dim; i++)
    {
        for (int j = 0; j < dim; j++)
        {
            BingoCell * cell = this -> bingoCellGrid[i][j];
            if (cell -> number = number)
                cell -> marked = true;
        }
    }
}

BingoCell * BingoBlock::getBingoCell(int row, int col)
{
    return this -> bingoCellGrid[row][col];
}

BingoCell * createBingoCell(int number)
{
    BingoCell * cell;
    cell -> number;
    return cell;
}

