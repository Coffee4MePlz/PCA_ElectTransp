# Principal Component Analysis (PCA) for Electron Transport Data
This is an example of application of Principal component analysis to Electron transport data. It was developed by me under supervision of Prof. Luis Rego at my home university the Universidade Federal de Santa Catarina (UFSC), during my undergraduate research in data treatment methods for Molecular Dynamics. This is only a small piece of our work, and if you are interested in what we are currently researching please visit our lab page: [Dynemol](http://luisrego.sites.ufsc.br/)


## The Data source and PCA usage
Our data was manly produced here at our laboratory by simulations of Double-Linker Sensitizers interaction with a surface. We we're interested in how these charged structures were transfering electrons (charge) when they connected to a surface (see more on the following paper - I will post the link as soon as published). We ran a PCA on the data to identify wich variables were the most important (statistically). 

To be fair, this is not what PCA is doing. It does **not** find the most relevant variable, but more exactly it finds the most relevant **combination** of variables, in you data set. W

In this case, we were particularly intersted in which variables were determining the speed in wich the eletrons were flowing to the interface between the molecule and the surface. We only measured variables that were dependent of the geometry of the molecule: angles, distances, and torsions. 

The data is in the file *"IET.LUMO.dhd.LL.HH.BL.dist.dat"*

## The Method

PCA is mainly a dimension reduction method for raw data. It is mostly used when we wish to know which is the most important direction in a vector field, i.e. which single direction in your data matrix (interpreted as a vector field) is the one that preserves most of the information given. In linear algebra terms: PCA gives you the eigenvectors associated with the greatests eigenvalues. Since PCA is used in a wide variety of data, the data matrix may not be squared, but even then the PCA is garanteed to exists, since every matrix (either squared or not) can be decomposed in a singular value decomposition:

<a href="https://www.codecogs.com/eqnedit.php?latex=X&space;=&space;U&space;\Sigma&space;W^T" target="_blank"><img src="https://latex.codecogs.com/gif.latex?X&space;=&space;U&space;\Sigma&space;W^T" title="X = U \Sigma W^T" /></a>

Were X is the data matrix, U and W are rectangular matrices, and Sigma is a diagonal matrix with the eigenvalues.

The correlation matrix can be computed by <a href="https://www.codecogs.com/eqnedit.php?latex=X^T&space;X" target="_blank"><img src="https://latex.codecogs.com/gif.latex?X^T&space;X" title="X^T X" /></a> . In this set of data it is a 7x7 matrix, but we'll only show the firs 3x3:

|     |       IET  |      LUMO  |       dhd|  
| ----:|:---------:|:----------:|:--------:|
|IET  | 1.00000000 |-0.45620206 |0.14029317| 
|LUMO |-0.45620206 | 1.00000000 |-0.43759060 |
|dhd  | 0.14029317 |-0.43759060 | 1.00000000| 



And the Principal Components (vectors) can be calculated by direct matrix multiplication <a href="https://www.codecogs.com/eqnedit.php?latex=T&space;=&space;X&space;W" target="_blank"><img src="https://latex.codecogs.com/gif.latex?T&space;=&space;X&space;W" title="T = X W" /></a> . Once computed we get the components by score:
|                        | PC1  |  PC2 |   PC3  |  PC4  |   PC5  |   PC6 |    PC7 |
| ----------------------:|:----:|:-----| :-----:|:-----:|:-------:|:-----:|:------:|
| Standard deviation     | 1.6842 |1.1103 |1.0153 |0.9509 |0.69169 |0.64736 |0.31355|
| Proportion of Variance | 0.4052 |0.1761 |0.1472 |0.1292 |0.06835 |0.05987 |0.01405|
| Cumulative Proportion  | 0.4052 |0.5813 |0.7286 |0.8577 |0.92609 |0.98595 |1.00000|


## Results 

The following is a Biplot, it is a plot of the two main PCA vectors, and all other entries in accordance to them. The data here is separated in two groups, a fast one and slow one, with the boundary being the median of the time for IET to reach 0.3 (Interfacial electron transfer), physically the IET means that most of the charge (about 70%) has been transferred to the surface already. Therefore we divided the data as: fast < 32.5 = median of IET < slow 

![Biplot of components 1 and 2](https://github.com/Coffee4MePlz/PCA_ElectTransp/blob/master/P1P2%20_plot.png "Biplot of components 1 and 2")


By a direct look at the Biplot, one can see that mostly IET and dhd favour the 1st PC, and LL and LUMO are contrary to it. Similarly IET and BL favour PC2, while HH and dist are contrary. Also, our data is relatively well separated by our time criterion, since there is a small overlap of the ellipses (remember they are centered in their "center of mass"). We can then conclude that IET, HH, LUMO, and LL are the main players in separating the data via the time criterion. If we were to develop a machine learning algorithm for optimization here, we would like for it to follow these parameters first, so it can get to the best results faster. 
