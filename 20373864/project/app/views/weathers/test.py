import requests

from bs4 import BeautifulSoup

url = 'http://www.weather.com.cn/weather1d/101010100.shtml'
r = requests.get(url)
r.encoding = r.apparent_encoding
html = r.text

soup = BeautifulSoup(html, 'html.parser')

# 获取北京当时的天气信息
weather_info = soup.find('input', id='hidden_title')

print(weather_info['value'])
