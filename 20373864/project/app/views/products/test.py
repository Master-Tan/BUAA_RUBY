from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel

import sys

import json

json_data = sys.argv[1]
dishes = json.loads(json_data)
user_preference = sys.argv[2]

# # 定义菜品数据
# dishes = [
#     {'id': 1, 'name': '麻婆豆腐', 'taste': '麻辣', 'type': '川菜'},
#     {'id': 2, 'name': '红烧肉', 'taste': '咸鲜', 'type': '粤菜'},
#     {'id': 3, 'name': '鱼香肉丝', 'taste': '咸甜', 'type': '川菜'},
#     {'id': 4, 'name': '宫保鸡丁', 'taste': '麻辣', 'type': '粤菜'},
#     {'id': 5, 'name': '水煮鱼', 'taste': '麻辣', 'type': '川菜'},
# ]

# 将菜品的属性拼接成一个字符串
dish_descriptions = [' '.join([dish['taste'], dish['type']]) for dish in dishes]

# 使用TfidfVectorizer进行文本特征提取
tfidf = TfidfVectorizer()
dish_features = tfidf.fit_transform(dish_descriptions)

# 定义用户喜好，并进行特征提取
# user_preference = '麻辣 粤菜'
user_features = tfidf.transform([user_preference])

# 使用cosine_similarity计算用户喜好与菜品的相似度
similarities = linear_kernel(user_features, dish_features).flatten()

# 获取相似度最高的菜品
recommended_product_indexs = similarities.argsort()[::-1]


recommended_product_names = []
for recommended_product_index in recommended_product_indexs:
    recommended_product = dishes[recommended_product_index]
    recommended_product_names.append(recommended_product['id'])

# 返回推荐菜品id列表
print(json.dumps(recommended_product_names))
