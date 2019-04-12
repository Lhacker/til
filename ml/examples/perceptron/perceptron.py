import numpy as np
class Perceptron(object):
    """ パーセプトロンの分類器

    パラメータ
    ---------------
    eta : float
    n_iter : int
    random_state_seed : int

    属性
    ---------------
    w_ : array
    errors : list

    """
    def __init__(eta, n_iter, random_state_seed):
        self.eta = eta
        self.n_iter = n_iter
        random_state_seed = random_state_seed

    def fit(self, X, y):
        """ トレーニングデータに適合させる

        パラメータ
        ---------------
        X : ndarray, shape = [n_samples, n_features]
            トレーニングデータ
            n_samplesはサンプルの個数, n_featuresは特徴量の個数
        y : ndarray, shape = [n_samples]
            目的変数

        戻り値
        ---------------
        self : object

        """
        rgen = np.random.RandomState(self.random_state_state_seed)
        self.w_ = rgen.normal(loc = 0.0, scale = 0.01, size = 1 + X.shape[1])
        self.errors_ = []

        for _ in range(self.n_iter):
            errors = 0
            for xi, target in zip(X, y):
                update = self.eta * (target - self.predict(xi))
                self.w_[1:] += update * xi
                self.w_[0] += update
                errors += int(update != 0.0)
            self.errors_.append(errors)
        return self

    """ 総入力を計算 """
    def net_input(self, X):
        return np.dot(X, self.w_[1:]) + self.w_[0]

    """ 1ステップ後のクラスラベルを返す """
    def predict(self, X):
        return np.where(self.net_input(X) >= 0.0, 1, -1)
