###
Ce dépôt fournit une configuration docker-compose permettant de déployer une instance de GithubToTrello rapidement.

### 🛠 Pré-requis
- un nom de domaine
- ⚠️ un serveur **dont les ports 80 et 443 sont disponibles**
- les dépendances suivantes :
  - docker
  - docker-compose
  - make
  - openssl

### 🔌 Installation
- clonez ce dépôt sur le serveur qui doit héberger GithubToTrello
- déclarez dans vos DNS le domaine qui pointera sur GithubToTrello (exemple : `gtt.mondomaine.com`)
- dans le dépôt, créez le fichier `config/.env` sur la base du fichier `config/.env.sample` (voir documentation)
- générez le certificat https en lançant, depuis la racine du dépôt, la commande `make certificate`

### 🚀 Utilisation
Vous pouvez, depuis la racine du dépôt, utiliser la commande `make gtt` comme un alias de docker-compose.

Voici quelques exemples d'utilisation :
- démarrer le service : `make gtt up -d`
- stopper le service : `make gtt down`

### 📒 Documentation
<table>
    <tr>
        <th>GTT_HOST</th>
        <td>Nom de domaine du service. Exemple : gtt.mondomaine.com</td>
    </tr>
    <tr>
        <th>GTT_ADMIN_EMAIL</th>
        <td>Adresse email de l'administrateur(rice) du projet. Utilisée pour l'acquisition du certificat https</td>
    </tr>
    <tr>
        <th>GTT_GITHUB_SECRET</th>
        <td>Secret du webhook, tel que défini sur Github</td>
    </tr>
</table>