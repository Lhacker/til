from sklearn import svm

xor_data = [
    # P, Q, result
    [0, 0, 0],
    [1, 0, 1],
    [0, 1, 1],
    [1, 1, 0]
]

data = []
label = []
for row in xor_data:
    p = row[0]
    q = row[1]
    r = row[2]
    data.append([p, q])
    label.append(r)

# learn from data
clf = svm.SVC(gamma = 'auto')
clf.fit(data, label)

# predict from data
predict_result = clf.predict(data)
print('predict result : ', predict_result)

# check results
ok = 0
total = 0
for idx, answer in enumerate(label):
    p = predict_result[idx]
    if p == answer:
        ok += 1
    total += 1
print('正解率:', ok, '/', total, '=', ok / total)
