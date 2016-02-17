TEST_HOST1=192.168.2.10
TEST_HOST2=192.168.2.11

# pipework
sudo pipework br1 test_ubuntu14_1 "${TEST_HOST1}/24"
sudo pipework br1 test_centos6_1 "${TEST_HOST2}/24"
sudo ip addr add 192.168.2.1/24 dev br1

# stone
sudo stone -p "${TEST_HOST1}:80" 10080 &
sudo stone -p "${TEST_HOST1}:443" 10443 &
sudo stone -p "${TEST_HOST2}:80" 11080 &
sudo stone -p "${TEST_HOST2}:443" 11443 &
