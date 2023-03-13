{
  "ethereum": {
    "from": "0x5C01f0F08E54B85f4CaB8C6a03c9425196fe66DD",
    "keystore": "/home/terra/.omnia/keys",
    "password": "/home/terra/.omnia/pass"
  },
  "transport": {
    "transport":"webapi",
    "webapi": {
      "listenAddr": "0.0.0.0:8800",
      "socks5ProxyAddr": "torproxy.local:9050"
    },
    "libp2p": {
      "bootstrapAddrs": [
        "/ip4/35.155.209.175/tcp/8100/p2p/12D3KooWSEu9AoHYVWebopgy43E4rNMgeyy1NKXtcT84RRrtoJXD"
      ],
      "listenAddrs": [
        "/ip4/0.0.0.0/tcp/8100"
      ]
    }
  },
  "feeds": [
    "0xc4b015761A92F0dE17A2D065298fB048d612c6d6",
    "0x0c4FC7D66b7b6c684488c1F218caA18D4082da18",
    "0x5C01f0F08E54B85f4CaB8C6a03c9425196fe66DD",
    "0x75FBD0aaCe74Fb05ef0F6C0AC63d26071Eb750c9",
    "0xC50DF8b5dcb701aBc0D6d1C7C99E6602171Abbc4"
  ],
  "spire": {
    "rpc": {
      "address": "127.0.0.1:9100"
    },
    "rpcAgentAddr": "spire.local:9100",
    "rpcListenAddr": "0.0.0.0:9100",
    "pairs": [
      "BTCUSD",
      "ETHUSD",
      "ETHBTC",
      "GNOUSD",
      "LINKUSD",
      "MANAUSD",
      "MATICUSD",
      "WSTETHUSD",
      "YFIUSD",
      "RETHUSD",
      "MKRUSD",
      "MKRETH"
    ]
  },
  "logger": {}
}
