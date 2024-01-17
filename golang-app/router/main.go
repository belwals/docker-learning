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
		port = "8080"
	}
	fmt.Println("---------Starting up the web application---------")
	mux := http.NewServeMux()
	mux.HandleFunc("/", welcomePage)

	urlPort := fmt.Sprintf(":%s", port)

	err := http.ListenAndServe(urlPort, mux)
	if errors.Is(err, http.ErrServerClosed) {
		fmt.Printf("server closed\n")
	} else if err != nil {
		fmt.Printf("error starting server: %s\n", err)
		os.Exit(1)
	}
}
