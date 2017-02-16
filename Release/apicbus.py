#coding:utf-8

import sys
import urllib
import urllib.request
import requests
import json
import datetime
import locale
import time
import re

#jsonの取り込み
def c_bus_json():
    #ファイルの読み込み時エンコーディング注意(fstはBOM付きutf)以下同様
    f = open('cbus.json','r', encoding='utf_8_sig')
    print(f)
    response = json.load(f)
    #print(json.dumps(response, sort_keys=False, indent = 4))
    f.close()

    return response

#jsonの解析
def do_json(s):
    #print(s)
    #data = json.loads(s)
    data = s

    #print(json.dumps(data, sort_keys=True, indent=4)); sys.exit()
    
    #jsonのkeyを取り込む
    item_list = data.keys()
    #print(json.dumps(item_list,sort_keys=True, indent=4))
    
    #空のディクショナリを作る
    timetable = {}
    k = "hino_osawa"
    for i in range(0,len(data[k])):
        day = data[k][i]["day"]
        check = data[k][i]["f_check"]
        time_h = data[k][i]["hino"]
        time_h = datetime.datetime.strptime(time_h,'%H:%M')
        time_o = data[k][i]["osawa"]
        time_o = datetime.datetime.strptime(time_o,'%H:%M')
        timetable[i] = [day, time_h, time_o, check]
        #print(timetable[i])
    
    #print ('-' * 40)
    
    #fst読み取り
    with open("MMDAgent.fst-cbus.fst","r",encoding='utf_8_sig') as f:
        lines = f.readlines()

    #time比較(編集個所の行を更新)
    d = datetime.datetime.today()
    t = datetime.time(d.hour,d.minute)
    t = t.strftime('%H:%M')
    d_calc = datetime.datetime.strptime(t,'%H:%M')
    locale.setlocale(locale.LC_ALL,'ja')
    wait=0
    i = 0
    if d.isoweekday()==3:#水曜日臨時ダイヤ
        while wait <= 0:
            wait = timetable[i][1] - d_calc
            wait = wait.total_seconds()
            dep = timetable[i][1]
            arr = timetable[i][2]
            if(timetable[i][3] == "all_final"):#終バスチェック
                break
            i = i + 1
        if(wait>0):
            lines[2] = "1 2 VALUE_EVENT_EVAL|cbus|EQ|1|TRUE     SYNTH_START|mei|mei_voice_normal|次のバスは、"+str(dep.hour)+"時"+str(dep.minute)+"分発です。\n"
            lines[4] = "2 3 SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|南大沢には"+str(arr.hour)+"時"+str(arr.minute)+"分に到着予定です。\n"
        else:
            lines[2] = "1 2 VALUE_EVENT_EVAL|cbus|EQ|1|TRUE     SYNTH_START|mei|mei_voice_normal|ごめんなさい。今日のバスは終了しました。\n"
            lines[4] = "2 3 SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|バス、電車をご利用ください。\n"
    elif (d.isoweekday() == 6 or d.isoweekday() == 7):#土日用
        lines[2] = "1 2 VALUE_EVENT_EVAL|cbus|EQ|1|TRUE     SYNTH_START|mei|mei_voice_normal|ごめんなさい。今日は運休日です。\n"
        lines[4] = "2 3 SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|バス、電車をご利用ください。\n"
    else:
        while wait <= 0:#水曜日を除いた平日用
            if timetable[i][0]=="all" or timetable[i][0]=="normal":
                wait = timetable[i][1] - d_calc
                wait = wait.total_seconds()
                dep = timetable[i][1]
                arr = timetable[i][2]
                if(timetable[i][3] == "all_final"):#終バスチェック
                    break
            i = i + 1
        if(wait>0):
            lines[2] = "1 2 VALUE_EVENT_EVAL|cbus|EQ|1|TRUE     SYNTH_START|mei|mei_voice_normal|次のバスは、"+str(dep.hour)+"時"+str(dep.minute)+"分発です。\n"
            lines[4] = "2 3 SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|南大沢には"+str(arr.hour)+"時"+str(arr.minute)+"分に到着予定です。\n"
        else:
            lines[2] = "1 2 VALUE_EVENT_EVAL|cbus|EQ|1|TRUE     SYNTH_START|mei|mei_voice_normal|ごめんなさい。今日のバスは終了しました。\n"
            lines[4] = "2 3 SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|バス、電車をご利用ください。\n"

    #fst書き換え
    with open("MMDAgent.fst-cbus.fst","w",encoding='utf_8_sig') as fs:
        for line in lines:
            fs.write(line)
            #print(line)
    
    
    
                 

if __name__ == '__main__':
    json_str = c_bus_json()
    do_json(json_str)
