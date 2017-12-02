print("------python code start------")

import pandas as pd
import numpy as np
import cx_Oracle
import requests
from bs4 import BeautifulSoup
import urllib.request as req
from pandas import DataFrame as df
import time
from datetime import datetime
import csv
import os

print("------import complete------")

# 蹂��닔 �꽑�뼵

dic = {}

monthPrice = "" # 臾쇨�吏��닔
todayOil = "" # �쑀媛�

season = 0 #怨� �젅 (遊�~寃⑥슱 : 1~4濡� 吏��젙)
sky = 0 # �궇�뵪 (留묒쓬, 援щ쫫議곌툑, 援щ쫫留롮쓬, �쓲由�, 鍮�, �늿/鍮�, �늿)
wind = 0 # �뭾�냽
rain = "" # 媛뺤닔�웾
snow = "" # �쟻�꽕�웾
humid = "" # �뒿�룄
temp = "" # �삩�룄

#�븘�씠�뵒 �겕濡ㅻ쭅
def getID():
    url='http://192.168.0.27:8090/project/profile.jsp'
    session=requests.session()
    response=session.get(url)
    response.raise_for_status()
    soup=BeautifulSoup(response.text,'html.parser')
    text=soup.select_one('#email').text
    print(text)
    return text

try:
    userID=getID()
except:
    userID="test@test"


#db�젒洹쇳빐�꽌 理쒓렐爰쇳뙆�씪�씠由꾧��졇�삤湲�
con = cx_Oracle.connect('system/1234@localhost:1521/XE')
cur = con.cursor()

print("db ok????")

sql = "select files from SALES_FILES where email ='%s' order by up_Date desc" %userID
cur.execute(sql)

result=cur.fetchone()
result=result[0]

print("db result: ", result)

cur.close()
con.close()

#寃쎈줈蹂�寃�
#chdir()
print(os.getcwd())
data = pd.read_csv('fakedata.csv')

print("------crawling start------")

#�쁽�옱蹂��닔�겕濡ㅻ쭅
def getWeekday():
    now = time.localtime()
    weekday = now.tm_wday  # �슂�씪 (�썡�슂�씪:0)
    dic['weekday'] = [weekday]
    print("�삤�뒛�쓽 �슂�씪: ", weekday)


def oilCrawling():
    oilURL = 'http://www.opinet.co.kr/user/dopttot/doptTotSelect.do'
    session = requests.session()
    response = session.get(oilURL)
    response.raise_for_status()
    soup = BeautifulSoup(response.text, 'html.parser')
    text = soup.select('.gap')
    todayOil = text[2].text
    dic['oil'] = [todayOil.replace(",", "")]
    print("�삤�뒛�쓽 �쑀媛�: ", todayOil)


def priceCrawling():
    priceURL = 'http://kostat.go.kr/incomeNcpi/cpi/cpi_td/2/1/index.action?bmode=cpidtval'
    session = requests.session()
    response = session.get(priceURL)
    response.raise_for_status()
    soup = BeautifulSoup(response.text, 'html.parser')
    text = soup.select('.ListTable > tbody > tr > td')
    monthPrice = text[11].text
    dic['monthPrice'] = [monthPrice]
    print("�씠�떖�쓽 臾쇨�吏��닔: ", monthPrice)  # 吏��닔


def weatherCrawling(x, y):
    weatherURL = 'http://www.kma.go.kr/wid/queryDFS.jsp?gridx=%s&gridy=%s' % (x, y)
    savename = 'forecast.xml'
    req.urlretrieve(weatherURL, savename)
    xml = open(savename, 'r', encoding='utf-8').read()
    soup = BeautifulSoup(xml, 'html.parser')

    weather = soup.find('data')
    temp = weather.find('temp').string  # �삩�룄
    dic['temp'] = [temp]

    wind = round(float(weather.find('ws').string), 2)  # �뭾�냽
    dic['wind'] = [wind]

    rain = weather.find('r12').string  # 媛뺤닔�웾
    dic['rain'] = [rain]

    snow = weather.find('s12').string  # �쟻�꽕�웾
    dic['snow'] = [snow]

    humid = weather.find('reh').string  # �뒿�룄
    dic['humid'] = [humid]

    # 怨꾩젅 (遊�~寃⑥슱 : 1~4濡� 吏��젙)
    seasonTemp = soup.find('tm').string
    seasonTemp = seasonTemp[4:6]

    if seasonTemp == '03' or seasonTemp == '04' or seasonTemp == '05':
        season = 1
    elif seasonTemp == '06' or seasonTemp == '07' or seasonTemp == '08':
        season = 2
    elif seasonTemp == '09' or seasonTemp == '10' or seasonTemp == '11':
        season = 3
    elif seasonTemp == '12' or seasonTemp == '01' or seasonTemp == '02':
        season = 4

    dic['season'] = [season]

    # �궇�뵪 (留묒쓬, 援щ쫫議곌툑, 援щ쫫留롮쓬, �쓲由�, 鍮�, �늿/鍮�, �늿)
    skyTemp = weather.find('wfkor').string

    if skyTemp == '留묒쓬':
        sky = 1
    elif skyTemp == '援щ쫫 議곌툑':
        sky = 2
    elif skyTemp == '援щ쫫 留롮쓬':
        sky = 3
    elif skyTemp == '�쓲由�':
        sky = 4
    elif skyTemp == '鍮�':
        sky = 5
    elif skyTemp == '�늿/鍮�':
        sky = 6
    elif skyTemp == '�늿':
        sky = 7

    dic['sky'] = [sky]

    print("怨꾩젅: ", season)
    print("�삩�룄: ", temp)
    print("�뭾�냽: ", wind)
    print("媛뺤닔�웾: ", rain)
    print("�쟻�꽕�웾: ", snow)
    print("�뒿�룄: ", humid)
    print("�궇�뵪: ", sky)

getWeekday()
oilCrawling()
priceCrawling()
weatherCrawling(22, 10)
dic['day']=[datetime.today().day]

print("------crawling end------")

#遺꾩꽍
def analyze(num):
    if num == 0:
        feature_names = ["day", "humid", "rain", "season", "sky", "snow", "temp", "weekday"]
    elif num == 1:
        feature_names = ["day", "humid", "rain", "season", "sky", "snow", "temp", "weekday", "wind"]
    elif num == 2:
        feature_names = ["day", "humid", "oil", "rain", "season", "sky", "snow", "temp", "weekday"]
    elif num == 3:
        feature_names = ["day", "humid", "monthPrice", "rain", "season", "sky", "snow", "temp", "weekday"]
    elif num == 4:
        feature_names = ["day", "humid", "oil", "rain", "season", "sky", "snow", "temp", "weekday", "wind"]
    elif num == 5:
        feature_names = ["day", "humid", "monthPrice", "rain", "season", "sky", "snow", "temp", "weekday", "wind"]
    elif num == 6:
        feature_names = ["day", "humid", "monthPrice", "oil", "rain", "season", "sky", "snow", "temp", "weekday"]
    elif num == 7:
        feature_names = ["day", "humid", "monthPrice", "oil", "rain", "season", "sky", "snow", "temp", "weekday",
                         "wind"]

    test = df(dic)
    X_train = data[feature_names]
    X_test = test[feature_names]
    Y_train = data.iloc[:, 13:]
    from sklearn.ensemble import RandomForestRegressor
    model = RandomForestRegressor(n_estimators=1000, random_state=1, max_depth=15, n_jobs=-1)
    from sklearn.metrics import make_scorer
    def rmsle(predict, actual):
        predict = np.array(predict)
        actual = np.array(actual)

        log_predict = np.log(predict + 1)
        log_actual = np.log(actual + 1)

        difference = log_predict - log_actual
        square_difference = difference ** 2
        mean_square_difference = square_difference.mean()

        score = np.sqrt(mean_square_difference)

        return score

    rmsle_score = make_scorer(rmsle)
    from sklearn.cross_validation import cross_val_score
    score = cross_val_score(model, X_train, Y_train, scoring=rmsle_score).mean()
    model.fit(X_train, Y_train)
    predictions = model.predict(X_test)
    predictions = np.around(predictions)
    predictions = predictions.astype(int)
    col = str(Y_train.columns)[7:-24]
    col = col.replace("'", "")
    col = col.replace("\n", "")
    col = col.replace(" ", "")
    count = str(predictions)[2:-2]
    count = count.replace("  ", ",")
    count = count.replace(" ", "")
    result = col + "/" + count

    print(result)

    a = pd.DataFrame(predictions, index=None)
    f = open('output.csv', 'w', encoding='utf-8', newline='')
    wr = csv.writer(f)
    wr.writerow(Y_train.columns)
    wr.writerow(a.iloc[0])
    f.close()

    return result

print("-----analyze start-----")

result0=analyze(0)
result1=analyze(1)
result2=analyze(2)
result3=analyze(3)
result4=analyze(4)
result5=analyze(5)
result6=analyze(6)
result7=analyze(7)

print("-----analyze end-----")

print("-----db start-----")

#DB�뾽濡쒕뱶
dt=datetime.today()
today=dt.strftime("%Y-%m-%d")
con = cx_Oracle.connect('system/1234@localhost:1521/XE')
cur = con.cursor()

sql = "insert into Sales_Pre values('test@test','%s','%s','%s','%s','%s','%s','%s','%s','%s','null')" %(today, result0, result1, result2, result3, result4, result5, result6, result7)
cur.execute(sql)

con.commit()
cur.close()
con.close()

print("--------python code end----------")