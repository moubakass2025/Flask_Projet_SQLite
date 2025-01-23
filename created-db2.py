import sqlite3

# Connexion à la base de données
connection = sqlite3.connect('bibliotheque.db')

# Lire et exécuter le script SQL pour créer les tables
with open('schema2.sql') as f:
    connection.executescript(f.read())

cur = connection.cursor()

# Insérer une dizaine de livres dans la table Livres
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('Les Misérables', 'Victor Hugo', 'Roman', 1862, '9781234567890'))
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('1984', 'George Orwell', 'Dystopie', 1949, '9781234567891'))
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('Le Petit Prince', 'Antoine de Saint-Exupéry', 'Conte', 1943, '9781234567892'))
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('La Peste', 'Albert Camus', 'Philosophie', 1947, '9781234567893'))
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('L\'Étranger', 'Albert Camus', 'Philosophie', 1942, '9781234567894'))
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('Don Quichotte', 'Miguel de Cervantes', 'Aventure', 1605, '9781234567895'))
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('Germinal', 'Émile Zola', 'Roman', 1885, '9781234567896'))
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('Madame Bovary', 'Gustave Flaubert', 'Roman', 1857, '9781234567897'))
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('Crime et Châtiment', 'Fiodor Dostoïevski', 'Roman', 1866, '9781234567898'))
cur.execute("INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES (?, ?, ?, ?, ?)",
            ('La Métamorphose', 'Franz Kafka', 'Fiction', 1915, '9781234567899'))

# Valider les modifications et fermer la connexion
connection.commit()
connection.close()
