import scipy.io as sio 
#import matplotlib.pyplot as plt
import numpy as np
import cPickle

matfn='paviaTrain.mat'
matfn1='paviaValid.mat'
matfn2='paviaTest.mat'
data=sio.loadmat(matfn)
data1=sio.loadmat(matfn1)
data2=sio.loadmat(matfn2)

paviaTrain=data['paviaTrain']
paviaTrain_gt=data['paviaTrain_gt'].flatten()
paviaTrain_gt=[x-1 for x in paviaTrain_gt]
paviaTrain=[paviaTrain,paviaTrain_gt]


paviaValid=data1['paviaValid']
paviaValid_gt=data1['paviaValid_gt'].flatten()
paviaValid_gt=[x-1 for x in paviaValid_gt]
paviaValid=[paviaValid,paviaValid_gt]
    
paviaTest=data2['paviaTest']
paviaTest_gt=data2['paviaTest_gt'].flatten()
paviaTest_gt=[x-1 for x in paviaTest_gt]


paviaTest=[paviaTest,paviaTest_gt]

pavia=[paviaTrain,paviaValid,paviaTest]

file=open('pavia2.pkl','wb')
cPickle.dump(pavia,file,-1)
file.close()
