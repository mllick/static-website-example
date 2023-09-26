# Utilisez une image Nginx comme base
FROM nginx:alpine

# Mise à jour et installation de curl
RUN apk update && apk upgrade && apk add curl && apk add git

# Suppression du contenu existant du répertoire HTML par défaut d'Nginx
RUN rm -Rf /usr/share/nginx/html/*

# Copiez le fichier de configuration personnalisé (nginx.conf)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiez les fichiers HTML et les ressources statiques de votre site web dans le répertoire de travail d'Nginx
COPY . /usr/share/nginx/html

# On n'a pas besoin d'exposer le port ici, car il est déjà exposé dans l'image d'origine nginx:alpine.

# Commande pour démarrer Nginx (elle est démarrée automatiquement par défaut)
CMD ["nginx", "-g", "daemon off;"]
