.PHONY: jupyter train clean

jupyter:
    docker-compose up jupyter

train:
    docker-compose up train

clean:
    docker-compose down
    docker system prune -f