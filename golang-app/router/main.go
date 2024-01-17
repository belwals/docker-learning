package main

import (
	"errors"
	"fmt"
	"io"
	"net/http"
	"os"
)

//Welcome page route
func welcomePage(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("logging the incoming request")
	io.WriteString(w, "This is my sample website!\n")
}

func main() {
	// web application's starting point
	port := os.Getenv("PORT")
	if port == "" {
		port = "4000"
	}
	mux := http.NewServeMux()
	mux.HandleFunc("/", welcomePage)

	urlPort := fmt.Sprintf("localhost:%s", port)

	err := http.ListenAndServe(urlPort, mux)
	if errors.Is(err, http.ErrServerClosed) {
		fmt.Printf("server closed\n")
	} else if err != nil {
		fmt.Printf("error starting server: %s\n", err)
		os.Exit(1)
	}
}
