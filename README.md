# node版本

v12.18.3

# 开发环境

1. npm instal
2. truffle compile
3. truffle develop
4. migrate

# 私链环境

1. npm install
2. truffle compile
3. truffle console
4. migrate

# 调用示例

```
    masterChef.deposit(0, "1", {from:accounts[1]}).then(function(tx) {
        return masterChef.deposit(0, "1", {from:accounts[1]});
    }).then(function (tx) {
        return masterChef.withdraw(0, "1", {from:accounts[1]});
    }).then(function (tx) {
        return solrToken.balanceOf(accounts[1]);
    }).then(function (bn) {
        console.log(accounts[1] + " balance of solr: " + bn.toString());
    });
```
