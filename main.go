package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/Allenxuxu/ginvue/static"
	"github.com/gin-gonic/gin"
	"github.com/pkg/browser"
)

func main() {
	r := gin.Default()

	r.StaticFS("/ui", http.FS(static.Static))
	r.GET("/", func(c *gin.Context) {
		c.Redirect(http.StatusMovedPermanently, "/ui")
	})

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	go func() {
		time.Sleep(time.Second)
		err := browser.OpenURL("http://127.0.0.1:8080/ui")
		if err != nil {
			fmt.Println(err)
		}
		fmt.Println("Open: http://127.0.0.1:8080/ui")
	}()

	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
