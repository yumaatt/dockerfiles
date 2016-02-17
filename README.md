# dockerfiles

# how to use

setup
```
# admin container
cd /path/to/dockerfiles/admin
cp registry/config{_sample,}.yml
vim registry/config.yml
git clone https://github.com/docker/distribution.git registry/distribution
docker-compose build
docker-compose up -d registry
docker-compose up -d registry_frontend

# test container
cd /path/to/dockerfiles/test
docker-compose build
docker-compose up -d ubuntu14
docker-compose up -d centos6
./setup.sh
````

registor
```
docker tag test_ubuntu14 localhost:5000/test_ubuntu14:1.0
docker rmi test_ubuntu14
docker commit test_ubuntu14_1 localhost:5000/test_ubuntu14:1.0
docker push localhost:5000/test_ubuntu14:1.0

docker tag test_centos6 localhost:5000/test_centos6:1.0
docker rmi test_centos6
docker commit test_centos6_1 localhost:5000/test_centos6:1.0
docker push localhost:5000/test_centos6:1.0
```

update
```
docker commit test_ubuntu14_10_1 localhost:5000/test_ubuntu14:1.1
docker push localhost:5000/test_ubuntu14:1.1
docker commit test_centos6_10_1 localhost:5000/test_centos6:1.1
docker push localhost:5000/test_centos6:1.1
```

info<br>
test_ubuntu14:1.0 base setting installed<br>
test_centos6:1.0 base setting installed

docker registry frontend<br>
192.168.1.10:8080
