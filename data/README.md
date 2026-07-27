# data/

The project uses the official [MNIST dataset from TensorFlow Datasets](https://www.tensorflow.org/datasets/catalog/mnist).

There is no need to download anything manually.

The `master.py` script from the evaluation suite handles connecting to the network, downloading the dataset to the *master* node, and distributing it to the *workers* at runtime.
