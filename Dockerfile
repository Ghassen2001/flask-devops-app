# Étape 1 : Utiliser une image Python légère
FROM python:3.10-slim

# Étape 2 : Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier le fichier Python dans le conteneur
COPY . .

# Étape 4 : Installer Flask
RUN pip install --no-cache-dir flask

# Étape 5 : Exposer le port utilisé par Flask
EXPOSE 5000

# Étape 6 : Commande pour démarrer l'application
CMD ["python", "app.py"]
