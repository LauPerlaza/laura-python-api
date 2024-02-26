# Usa una imagen de Python desde Docker Hub
FROM python:3.12.1-slim-bullseye

# Establece el directorio de trabajo en /app
WORKDIR /app-api

# Copia el archivo requirements.txt al contenedor
COPY requirements.txt .

# Instala las dependencias
RUN pip install -r requirements.txt

# Copia el resto de la aplicación al contenedor
COPY . .

# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 9809

# Comando para ejecutar tu aplicación
CMD ["python", "api.py"]
