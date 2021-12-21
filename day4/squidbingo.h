#ifndef SQUIDBINGO_H
#define SQUIDBINGO_H

#include <vector>
#include <string>
struct BingoCell
{
    int number;
    bool marked;
};

class BingoBlock
{
    private:
        std::vector<std::vector<BingoCell *>> bingoCellGrid;
        int dim;
        bool created;

    public:
        BingoBlock(std::string bingoBlock);
        void markCell(int number);
        BingoCell* getBingoCell(int row,int col);
        
};

BingoCell * createBingoCell(int number);

#endif
