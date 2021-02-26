# Principal Component Analysis (PCA) for Electron Transport Data
This is an example of application of Principal component analysis to Electron transport data. It was developed by me under supervision of Prof. Luis Rego at my home university the Universidade Federal de Santa Catarina (UFSC), during my undergraduate research in data treatment methods for Molecular Dynamics. This is only a small piece of our work, and if you are interested in what we are currently researching please visit our lab page [Dynemol](http://luisrego.sites.ufsc.br/)


## The Data source and PCA usage
Our data was manly produced here at our laboratory by simulations of Double-Linker Sensitizers interaction with a surface. We we're interested in how these charged structures were transfering electrons (charge) when they connected to a surface (see more on the following paper - I will post the link as soon as published). We ran a PCA on the data to identify wich variables were the most important (statistically). 

To be fair, this is not what PCA is doing. It does not find the most relevant variable, but more exactly it finds the most relevant **combination** of variables, in you data set. 