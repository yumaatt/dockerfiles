TEST_HOST1=192.168.2.10
TEST_HOST2=192.168.2.11
PHOPLY_DEV1=192.168.2.12

## pipework
sudo pipework br1 test_ubuntu14_1 "${TEST_HOST1}/24"
sudo pipework br1 test_centos6_1 "${TEST_HOST2}/24"
sudo pipework br1 phoply_dev1_1 "${PHOPLY_DEV1}/24"
sudo ip addr add 192.168.2.1/24 dev br1

## stone
# testhost1
sudo stone -p "${TEST_HOST1}:80" 10080 &
sudo stone -p "${TEST_HOST1}:443" 10443 &
# testhost1 hugo
sudo stone -p "${TEST_HOST1}:10313" 10313 &
# testhost2
sudo stone -p "${TEST_HOST2}:80" 11080 &
sudo stone -p "${TEST_HOST2}:443" 11443 &
# phoply dev1
sudo stone -p "${PHOPLY_DEV1}:80" 12080 &
sudo stone -p "${PHOPLY_DEV1}:443" 12443 &
