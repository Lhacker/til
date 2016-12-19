package main

import "fmt"

type MyReader struct{}

func (r MyReader) Read(b []byte) (n int, err error) {
	i := 0
	for i < len(b) {
		b[i] = 'A'
		i += 1
	}
	return i, nil
}

func main() {
	r := MyReader{}
	b := make([]byte, 8)
	for {
		r.Read(b)
		fmt.Println(b)
	}
}

