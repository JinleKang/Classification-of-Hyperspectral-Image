import scipy.io as sio 
#import matplotlib.pyplot as plt
import numpy as np
import cPickle

matfn='kscTrain.mat'
matfn1='kscValid.mat'
matfn2='kscTest.mat'
data=sio.loadmat(matfn)
data1=sio.loadmat(matfn1)
data2=sio.loadmat(matfn2)

kscTrain=data['kscTrain']
kscTrain_gt=data['kscTrain_gt'].flatten()
kscTrain_gt=[x-1 for x in kscTrain_gt]
kscTrain=[kscTrain,kscTrain_gt]


kscValid=data1['kscValid']
kscValid_gt=data1['kscValid_gt'].flatten()
kscValid_gt=[x-1 for x in kscValid_gt]
kscValid=[kscValid,kscValid_gt]
    
kscTest=data2['kscTest']
kscTest_gt=data2['kscTest_gt'].flatten()
kscTest_gt=[x-1 for x in kscTest_gt]


kscTest=[kscTest,kscTest_gt]

ksc=[kscTrain,kscValid,kscTest]

file=open('ksc2.pkl','wb')
cPickle.dump(ksc,file,-1)
file.close()
