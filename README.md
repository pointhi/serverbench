# serverbench

some benchmark results, to check out how different (cloud) servers behave


### Install dependencies

```
sudo apt-get install sysbench lshw mariadb-server
```


### Running Scripts

```
./scripts/sysinfo.sh | tee sysinfo.log
./scripts/cpubench.sh | tee cpubench.log
./scripts/rambench.sh | tee rambench.log
./scripts/diskbench.sh | tee diskbench.log
./scripts/mysqlbench.sh | tee mysqlbench.log
./scripts/networkbench.sh | tee networkbench.log
```


## Acknowledges

Scripts based on the cloudbench repository: https://github.com/martinrusev/cloudbench
