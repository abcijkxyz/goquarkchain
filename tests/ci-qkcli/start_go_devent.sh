
cd ../../consensus/qkchash/native && make && cd -
go build && chmod +x cluster

cp tests/ci-qkcli/cluster_config.json ./ && cd -
mv ../../core/vm/contracts.go_back ../../core/vm/contracts.go

chmod +x ./run_cluster.sh  && ./run_cluster.sh ./cluster_config.json
sleep 5
curl -X POST -H 'content-type: application/json' --data '{"jsonrpc":"2.0","method":"setMining","params":[true],"id":0}' http://127.0.0.1:38491
