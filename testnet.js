const HDWalletProvider = require("truffle-hardwallet-provider");
const mnemonic = "metamask seed text"

networks: {
    develop: {
        port: 8545
    },
    development:{
        host:"127.0.0.1",
            port:8545,
            network_id:"*"
    },
    rinkedby: {
        provider: function(){
            return new HDWalletProvider(mnemonic,
                                       "account", 0);
        },
        network_id: 4,
        gas: 4500000,
        gasPrice: 100000000
    }
}