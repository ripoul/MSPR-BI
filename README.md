```
sudo docker system prune -a
sudo rm -rf pgdata/
sudo rm -rf pgdata/ && sudo docker system prune -a && sudo docker-compose rm --all && sudo  docker-compose pull && sudo  docker-compose build --no-cache && sudo docker-compose up --force-recreate
```