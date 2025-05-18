# ベースイメージ
FROM gradle:8.5-jdk21 AS builder

WORKDIR /app

# プロジェクト全体をコピー
COPY . .

# ビルド（jar作成）
RUN gradle build --no-daemon

# ==================
# 実行用イメージ
# ==================
FROM openjdk:21-jdk-slim

WORKDIR /app

# builderステージからjarをコピー
COPY --from=builder /app/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
