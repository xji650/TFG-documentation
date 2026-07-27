# data/

El proyecto utiliza el dataset oficial [MNIST de TensorFlow Datasets](https://www.tensorflow.org/datasets/catalog/mnist).

No es necesario descargar nada manualmente. 

El script `master.py` de la suite de evaluación se encarga de conectarse a la red, descargar el dataset en el nodo *master* y distribuirlo a los *workers* en tiempo de ejecución.
