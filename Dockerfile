# ベースイメージ（Java 17）
FROM openjdk:21-jdk-slim

# 作業ディレクトリを作成
WORKDIR /app

# jarファイルをコンテナにコピー（名前は適宜変更）
COPY build/libs/*.jar app.jar

# アプリケーションを実行
ENTRYPOINT ["java", "-jar", "app.jar"]