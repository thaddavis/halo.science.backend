# Database Tips

`https://hub.docker.com/_/postgres`

docker run -d --net=bridge --name some-postgres -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_DB=my_database -d -p 5432:5432 postgres

## Setup

- rake db:create
- rake db:migrate
- rake db:seed

psql -h wishbliss.cluster-camfztlkkv2f.us-east-1.rds.amazonaws.com -p 5432 wishbliss -U postgres