package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

type DBConfig struct {
	Host     string
	Port     string
	UserName string
	Password string
	DBName   string
	SSLMode  string
}

// Constuctor to the postgres database.
func NewPostgresDB(conf *DBConfig) (*sql.DB, error) {
	fmt.Println(conf)
	connStr := fmt.Sprintf(" port=%s user=%s password=%s dbname=%s sslmode=%s",
		conf.Port, conf.UserName, conf.Password, conf.DBName, conf.SSLMode)

	fmt.Println(connStr)
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Println(err)
		return nil, err
	}

	err = db.Ping()
	if err != nil {
		return nil, err
	}

	return db, nil
}

func main() {
	db, err := NewPostgresDB(&DBConfig{
		Host:     "localhost",
		Port:     "5432",
		UserName: "root",
		Password: "1234",
		DBName:   "postgres",
		SSLMode:  "disable",
	})
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(*db)
}
