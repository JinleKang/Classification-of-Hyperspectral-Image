import scipy.io as sio 
#import matplotlib.pyplot as plt
import numpy as np
import cPickle

matfn='indianTrain.mat'
matfn1='indianValid.mat'
matfn2='indianTest.mat'
data=sio.loadmat(matfn)
data1=sio.loadmat(matfn1)
data2=sio.loadmat(matfn2)

indianTrain=data['indianTrain']
indianTrain_gt=data['indianTrain_gt'].flatten()
indianTrain_gt=[x-1 for x in indianTrain_gt]
indianTrain=[indianTrain,indianTrain_gt]


indianValid=data1['indianValid']
indianValid_gt=data1['indianValid_gt'].flatten()
indianValid_gt=[x-1 for x in indianValid_gt]
indianValid=[indianValid,indianValid_gt]
    
indianTest=data2['indianTest']
indianTest_gt=data2['indianTest_gt'].flatten()
indianTest_gt=[x-1 for x in indianTest_gt]


indianTest=[indianTest,indianTest_gt]

indian=[indianTrain,indianValid,indianTest]

file=open('indian.pkl','wb')
cPickle.dump(indian,file,-1)
file.close()
