import scipy.io as sio
import numpy
import cPickle
file=open('pavia.pkl','rb')
#file=open('ksc1.pkl','rb')
pavia=cPickle.load(file)
file.close()
#ksc=cPickle.load(file1)
#file1.close()

t_x,t_y=pavia[0]
v_x,v_y=pavia[1]
te_x,te_y=pavia[2]

#train_x,train_y=ksc[0]
#valid_x,valid_y=ksc[1]
#test_x,test_y=ksc[2]

print(t_x[0])

#print(train_x[0])


#print(valid_x[0])
#print(test_x[0])
print(t_y)
print(v_x[0])
print(v_y)
print(te_x[0])
print(te_y)
#print(train_y)
print(len(t_y))
print(len(v_y))
print(len(te_y))


#print(valid_x[200])
#print(valid_x[1009])

#print(valid_y[200])
#print(valid_y[1009])
#print(valid_y)
#print(test_y)
#print(test_y[1000])
