UBUNTU14=192.168.2.10
CENTOS6=192.168.2.11
PHOPLY_DEV1=192.168.2.12
UBUNTU16=192.168.2.13
CENTOS7=192.168.2.14
ISUCON5=192.168.2.15
ISUCON5_BENCH=192.168.2.16

## pipework
sudo pipework br1 test_ubuntu14_1 "${UBUNTU14}/24"
sudo pipework br1 test_centos6_1 "${CENTOS6}/24"
sudo pipework br1 phoply_dev1_1 "${PHOPLY_DEV1}/24"
sudo pipework br1 test_ubuntu16_1 "${UBUNTU16}/24"
sudo pipework br1 test_centos7_1 "${CENTOS7}/24"
sudo pipework br1 test_isucon5_1 "${ISUCON5}/24"
sudo pipework br1 test_isucon5-bench_1 "${ISUCON5_BENCH}/24"
sudo ip addr add 192.168.2.1/24 dev br1

sudo pkill stone

## stone
# ubuntu14
sudo stone -p "${UBUNTU14}:80" 10080 &
sudo stone -p "${UBUNTU14}:443" 10443 &
# centos6
sudo stone -p "${CENTOS6}:80" 11080 &
sudo stone -p "${CENTOS6}:443" 11443 &
# phoply dev1
sudo stone -p "${PHOPLY_DEV1}:80" 12080 &
sudo stone -p "${PHOPLY_DEV1}:443" 12443 &
# ubuntu16
sudo stone -p "${UBUNTU16}:80" 13080 &
sudo stone -p "${UBUNTU16}:443" 13443 &
sudo stone -p "${UBUNTU16}:8090" 13809 &
# ubuntu16 rails
sudo stone -p "${UBUNTU16}:3000" 13300 &
# centos7
sudo stone -p "${CENTOS7}:80" 14080 &
sudo stone -p "${CENTOS7}:443" 14443 &
# isucon5
#sudo stone -p "${ISUCON5}:80" 15080 &
sudo stone -p "${ISUCON5}:80" 80 &
