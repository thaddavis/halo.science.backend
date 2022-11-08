#

docker build -t thaddavis/ruby-docker .

docker run -d -p 3000:3000 thaddavis/ruby-docker

`https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development`

## For Development

docker build -t thaddavis/ruby-docker -v ./:/usr/src/app -f Dockerfile.dev -n the_backend
docker run -rm -p 8000:3000 -v ./:/usr/src/app the_backend

## More tips

### v Gold v

### Rails container

docker build -t thaddavis/ruby-docker:dev -f ./Dockerfile.dev .

docker run -it --net=bridge --name the_backend --rm -p 8000:3000 -v $(pwd):/usr/src/app thaddavis/ruby-docker:dev

docker run -it --net=bridge --name the_backend -w /usr/src/app --rm -p 8000:3000 -v $(pwd):/usr/src/app thaddavis/ruby-docker:dev rm -f tmp/pids/server.pid && bin/rails s -p 3000 -b '0.0.0.0'

### Postgres container

docker run -d --name some-postgres -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_DB=my_database -d -p 5432:5432 postgres

### ^

docker rm $(docker ps --filter status=created -q)

docker rmi $(docker images -q thaddavis/nodejs)

docker image rm 3d6ee240b62f

## Database

psql -h wishbliss.cluster-camfztlkkv2f.us-east-1.rds.amazonaws.com -p 5432 my_database -U postgres