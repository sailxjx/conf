# 通过名称获取 pipeline step

`pip.named_steps['regression']`

# No space on device

`%env JOBLIB_TEMP_FOLDER=/tmp`

https://stackoverflow.com/questions/40115043/no-space-left-on-device-error-while-fitting-sklearn-model

# 使用 pipeline 时避免使用 LabelEncoder 和 LabelBinarizer

使用 OrdinalEncoder 和 OneHotEncoder

# pipeline 与 union

```python
pipe = make_union(
    FunctionTransformer(lambda users: users[['age']], validate=False),
    make_pipeline(
      FunctionTransformer(lambda users: users[['occupation']], validate=False),
      OneHotEncoder()
      ),
    make_pipeline(
      FunctionTransformer(lambda users: users[['gender']], validate=False),
      OrdinalEncoder()
      )
    )
```
