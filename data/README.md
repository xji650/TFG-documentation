# data/

El projecte utilitza dataset oficial MNIST del [TensorFlow Dataset](https://www.tensorflow.org/datasets/catalog/mnist).

No cal descarregar res manualment.

El script `master.py` del paquet d'avaluació gestiona la connexió a la xarxa, la descàrrega del conjunt de dades al node *master* i la seva distribució als *workers* en temps d'execució.