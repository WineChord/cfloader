# cfloader
Load problem from the given link from [codeforces](https://codeforces.com/problemset) and set up the initial code.

## Usage:

Example:

```shell
$ chmod +x load.sh
$ ./load.sh https://codeforces.com/problemset/problem/1520/C # pass link to a certain problem
folder/filename:  cr719d3/C.cpp
$ cat cr719d3/C.cpp | less # checkout the output
```

Output file content:

```cpp
#include<bits/stdc++.h>
using namespace std;
using ll=long long;
/*
https://codeforces.com/problemset/problem/1520/C

Codeforces Round #719 (Div. 3) C. Not Adjacent Matrix 

We will consider the numbers a and b as adjacent if they differ by exactly 
one, that is, |a-b|=1.

We will consider cells of a square matrix n \times n as adjacent if they 
have a common side, that is, for cell (r, c) cells (r, c-1), (r, c+1), 
(r-1, c) and (r+1, c) are adjacent to it.

For a given number n, construct a square matrix n \times n such that: 

 Each integer from 1 to n^2 occurs in this matrix exactly once; 

 If (r_1, c_1) and (r_2, c_2) are adjacent cells, then the numbers written 
in them must not be adjacent. 
*/
void run(){
    // Welcome, your majesty.
}
int main(){
#ifdef WINE
    freopen("data.in","r",stdin);
#endif
    int T;scanf("%d",&T);
    while(T--){
        run();
    }
}
```
