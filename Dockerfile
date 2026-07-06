FROM maven:3.9.9-eclipse-temurin-21

WORKDIR /app

COPY pom.xml . 
RUN mvn dependency:go-offline -B

# Copiar el código fuente
COPY src ./src 
# Compilar la aplicación
RUN mvn clean package -DskipTests 
# Exponer el puerto
EXPOSE 8080 

# Ejecutar la aplicación
CMD ["java", "-jar", "target/Practica6-0.0.1-SNAPSHOT.jar"]


