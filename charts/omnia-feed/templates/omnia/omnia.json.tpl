{
  "mode": "feed",
  "ethereum": {
    "from": "0x5C01f0F08E54B85f4CaB8C6a03c9425196fe66DD",
    "keystore": "/home/terra/.omnia/keys",
    "password": "/home/terra/.omnia/pass",
    "network": "",
    "type": "ethereum"
  },
  "options": {
    "interval": 60,
    "msgLimit": 35,
    "srcTimeout": 10,
    "setzerTimeout": 10,
    "setzerCacheExpiry": 120,
    "setzerMinMedian": 3,
    "setzerEthRpcUrl": "http://rpc-splitter.local:9989",
    "verbose": true,
    "logFormat": "json",
    "ethGas": 200000
  },
  "sources": [
    "gofer",
    "setzer"
  ],
  "transports": [
    "spire",
    "ssb-rpc"
  ],
  "pairs": {
    "BTC/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "ETH/BTC": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "ETH/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "GNO/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "LINK/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "MANA/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "MATIC/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "MKR/ETH": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "MKR/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "RETH/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "WSTETH/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    },
    "YFI/USD": {
      "msgExpiration": 1800,
      "msgSpread": 0.5
    }
  },
  "feeds": [
    "0x0c4FC7D66b7b6c684488c1F218caA18D4082da18",
    "0x5C01f0F08E54B85f4CaB8C6a03c9425196fe66DD",
    "0x75FBD0aaCe74Fb05ef0F6C0AC63d26071Eb750c9",
    "0xC50DF8b5dcb701aBc0D6d1C7C99E6602171Abbc4",
    "0xc4b015761A92F0dE17A2D065298fB048d612c6d6"
  ],
  "services": {
    "scuttlebotIdMap": {
      "0x0c4FC7D66b7b6c684488c1F218caA18D4082da18": "@4ltZDRGFi4eHGGlXmLC8olcEs8XNZCXfvx+3V3S2HgY=.ed25519",
      "0x5C01f0F08E54B85f4CaB8C6a03c9425196fe66DD": "@uqOcvBdpBXWNCm5WhjALbtyR8szWpihH/CVyNdycncQ=.ed25519",
      "0x75FBD0aaCe74Fb05ef0F6C0AC63d26071Eb750c9": "@wrrCKd56pV5CNSVh+fkVh6iaRUG6VA5I5VDEo8XOn5E=.ed25519",
      "0xC50DF8b5dcb701aBc0D6d1C7C99E6602171Abbc4": "@gt/2QK1AdSCLX3zRJQV6wRRsoxgohChCpjmNOOLUAA4=.ed25519",
      "0xc4b015761A92F0dE17A2D065298fB048d612c6d6": "@n0PIEl67ZzGvz5NBEwibsZSQCxfqDnXyUnSaGN1S88A=.ed25519"
    }
  }
}
