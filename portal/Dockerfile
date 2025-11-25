# ===============================
# 1) STAGE: BUILD (compila e empacota)
# ===============================
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copia apenas o pom.xml para baixar dependências (cache mais rápido)
COPY pom.xml ./

# Baixa dependências sem compilar código (cache mais rápido)
RUN mvn -B dependency:go-offline

# Copia o código-fonte
COPY src ./src

# Compila e empacota o JAR
RUN mvn -B clean package -DskipTests

# ===============================
# 2) STAGE: RUNTIME (imagem final)
# ===============================
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copia o JAR da fase de build
COPY --from=build /app/target/*.jar app.jar

# Copia os arquivos .env para o container
COPY .env.* ./

# Expondo a porta padrão do Spring Boot
EXPOSE 8080

# Comando final para rodar a aplicação
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
