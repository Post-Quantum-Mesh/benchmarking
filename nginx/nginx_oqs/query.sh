# Run from CWD using "./query.sh"

#sudo docker run --network test_net -it openquantumsafe/curl curl -k https://tls-test-img:4433 -e SIG_ALG=dilithium3
sudo docker run --network host -it openquantumsafe/curl curl -k https://localhost:4433 -e SIG_ALG=dilithium3