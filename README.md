# 04-raisin-cake

## Task

Write a program that accepts "cake with raisins" as input

```
cake =
........
..o.....
...o....
........
// o this is a raisin
```

We need to evenly cut the cake into n small rectangular pieces so that each small cake contains 1 raisin. n is not an
argument, this is the number of raisins inside the cake

```cake =
........
..o.....
...o....
........
```

The result is such an array

```
[
  ........
  ..o.....
 ,
  ...o....
  ........
]
```

The number of raisins is always greater than 1 and less than 10.
If there are several solutions, choose the one with the largest width of the first element of the array.
Gradually cut into n parts, which means the same area. But their form can be different.
Each piece of cake should be rectangular.