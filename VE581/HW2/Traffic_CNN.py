import pickle
from matplotlib import pyplot as plt
import numpy as np
from random import randint

training_file = 'data/train.p'
validation_file = 'data/valid.p'
testing_file = 'data/test.p'

with open(training_file, 'rb') as f:
    train = pickle.load(f)
with open(validation_file, 'rb') as f:
    valid = pickle.load(f)
with open(testing_file, 'rb') as f:
    test = pickle.load(f)

x_train, y_train = train['features'], train['labels']
x_validation, y_validation = valid['features'], valid['labels']
x_test, y_test = test['features'], test['labels']

print(x_train.shape, y_train.shape)
print(x_validation.shape, y_validation.shape)
print(x_test.shape, y_test.shape)

ListOfClass = set(y_train)
NumOfClass = len(ListOfClass)
print(NumOfClass)

for label in ListOfClass:
    cur_label_found = False
    while cur_label_found is False:
        idx = randint(0, len(y_train))
        if y_train[idx] == label:
            cur_label_found = True
            plt.imshow(x_train[idx])
            plt.savefig('{:d}.png'.format(label))

