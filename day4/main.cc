#include "squidbingo.h"
#include <iostream>

namespace examples
{
    std::string exampleBlock1 = "22 13 17 11  0\n8  2 23  4 24\n21  9 14 16  7\n6 10  3 18  5\n1 12 20 15 19";
    std::string exampleBlock2 = " 3 15  0  2 22\n9 18 13 17  5\n19  8  7 25 23\n20 11 10 24  4\n14 21 16 12  6";
    std::string exampleBlock3 = "14 21 17 24  4\n10 16 15  9 19\n18  8 23 26 20\n22 11 13  6  5\n2  0 12  3  7";

    std::vector<int> draws = {7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1};
}

int main()
{
    std::cout << "hi" << std::endl;
    std::cout << examples::exampleBlock1 << std::endl;
    return 0;
}


