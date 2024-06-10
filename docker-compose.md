# for run postgresql & pgadmin
version: "3.9"

services:

  postgres:
    image: postgres:latest
    restart: always
    container_name: postgres_db
    shm_size: 128mb
    ports:
      - 5432:5432
    networks:
      - postgreasql
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: 64150
      POSTGRES_DB: database
    volumes:
      - ./postgres-data:/var/lib/postgresql/data

  pgadmin:
    image: dpage/pgadmin4:latest
    container_name: pgadmin
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@example.com
      PGADMIN_DEFAULT_PASSWORD: admin
    ports:
      - "8089:80"
    depends_on:
      - postgres
    volumes:
      - ./pgadmin-data:/var/lib/pgadmin
    networks:
      - postgreasql

networks:
  postgreasql:
    driver: bridge
