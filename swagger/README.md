## Stub ServerとSwagger UIの使い方
### 起動方法
1. Docker内のswaggerネットワークを作成する
```
docker network create swagger_link
```
2. コンテナをバックグラウンドで起動・開始する
```
docker-compose up -d
```
3. コンテナを確認してこうなってたらOK
```
docker-compose ps

    Name                   Command               State               Ports
---------------------------------------------------------------------------------------
swagger-api     /usr/local/bin/apisprout / ...   Up      0.0.0.0:8083->8000/tcp
swagger-nginx   nginx -g daemon off;             Up      80/tcp, 0.0.0.0:8084->8084/tcp
swagger-ui      sh /usr/share/nginx/run.sh       Up      80/tcp, 0.0.0.0:8082->8080/tcp
```

### 使い方
#### Stub Server
[http://localhost:8084](http://localhost:8084)のURIでモックAPIが使える\

例. GETメソッドでidが1のfoodを取得したい時\
[http://localhost:8084/sneaker/1](http://localhost:8084/sneaker/1)
```
{
  "id": 1,
  "nameMain": "Travis Scott",
  "nameSub": "Jordan6 Retro",
  "image": "https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg",
  "partNo": "130-X1345",
  "colors": [
    {
      "name": "Bruwn"
    },
    {
      "name": "Black"
    },
    {
      "name": "White"
    }
  ],
  "releaseDate": "2018/09/13",
  "regularPrice": 19000
}
```

#### Swagger UI
[http://localhost:8082](http://localhost:8082)のURIでAPIドキュメントが見える
