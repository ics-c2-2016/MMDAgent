#coding:utf-8

import sys
import urllib
import urllib.request
import requests
import json
import time
import re

def yapi_topics():
    url = 'http://api.openweathermap.org/data/2.5/forecast?'
    appid = 'c0f990b32dc1eb193f0e9e271d44a7a1'
    params = urllib.parse.urlencode(
            {'APPID': appid,
             'lat':35.661222,
             'lon':139.365835,
             'units':'metric',})

    #print (url + params)
    #print(type(requests.get(url + params)))
    response = requests.get(url + params).json()
    #print(response);sys.exit()
    '''
    if response.status_code == 200:
        j = response.json()
        print(j.keys())
    '''

    return response

def do_json(s):
    #print(s)
    #data = json.loads(s)
    data = s

    #print(json.dumps(data, sort_keys=True, indent=4)); sys.exit()
    
    #jsonの階層の"Result"以下を辞書にする。keyは番号：その次の配列がvalueになっている
    item_list = data["list"]
    #print(json.dumps(item_list,sort_keys=True, indent=4))

    #空のディクショナリを作る
    weather = {}
    tempstr = {}
    i = 1
    for  k in item_list:
        date_c = k["dt"]
        date = time.ctime(date_c)
        temp = k["main"]["temp"]
        tempstr[i] = str(k["main"]["temp"])
        group = k["weather"][0]["main"]
        wind = k["wind"]["speed"]
        weather[i] = [date, group, temp, wind]
        i = i + 1
    
    print ('-' * 40)
    weather_keys = list(weather.keys())
    weather_keys.sort()
    #for i in weather_keys:
        #print (i, weather[i][0], weather [i][1], weather [i][2], weather[i][3])

    with open("MMDAgent.fst-wether.fst","r",encoding='utf_8_sig') as f:
        lines = f.readlines()
    with open("MMDAgent.fst-wether.fst","w",encoding='utf_8_sig') as fs:
        for line in lines:
            #fa = re.sub("3.2","3.5",line)
            fa = re.sub(r'-?[0-9]{1,2}\.[0-9]*',tempstr[1],line)
            if(weather[1][2] <= 10):
                fb = re.sub(r'["寒","暑","良"]',"寒",fa)
            elif(weather[1][2] >=25):
                fb = re.sub(r'["寒","暑","良"]',"暑",fa)
            else:
                fb = re.sub(r'["寒","暑","良"]',"良",fa)
            #print (fb)
            #fs.write(fa)
            #print (line[:-1])
            fs.write(fb)
    
    
    
                 

if __name__ == '__main__':
    json_str = yapi_topics()
    do_json(json_str)
