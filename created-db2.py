import sqlite3

# Connexion à la base de données
connection = sqlite3.connect('bibliotheque.db')

# Lire et exécuter le script SQL pour créer les tables
with open('schema2.sql') as f:
    connection.executescript(f.read())

cur = connection.cursor()


# Valider les modifications et fermer la connexion
connection.commit()
connection.close()
