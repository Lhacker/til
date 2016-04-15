package main

import "fmt"

func main() {
	v := 42
	fmt.Printf("v is type %T\n", v)
	w := 42.8
	fmt.Printf("w is type %T\n", w)
	x := 0.867 + 0.5i
	fmt.Printf("x is type %T\n", x)
}
