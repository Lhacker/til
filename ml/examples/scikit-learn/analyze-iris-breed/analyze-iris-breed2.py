import pandas as pd
from sklearn import svm, metrics, model_selection

csv = pd.read_csv('iris.csv')

csv_data = csv[['SepalLength', 'SepalWidth', 'PetalLength', 'PetalWidth']]
csv_label = csv['Name']

train_data, test_data, train_label, test_label = \
        model_selection.train_test_split(csv_data, csv_label)

clf = svm.SVC(gamma='auto')
clf.fit(train_data, train_label)
pre = clf.predict(test_data)

ac_score = metrics.accuracy_score(pre, test_label)
print('accuracy = ', ac_score)
