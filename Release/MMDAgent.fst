# ----------------------------------------------------------------- #
#           MMDAgent "Sample Script"                                #
#           released by MMDAgent Project Team                       #
#           http://www.mmdagent.jp/                                 #
# ----------------------------------------------------------------- #
#                                                                   #
#  Copyright (c) 2009-2015  Nagoya Institute of Technology          #
#                           Department of Computer Science          #
#                                                                   #
# Some rights reserved.                                             #
#                                                                   #
# This work is licensed under the Creative Commons Attribution 3.0  #
# license.                                                          #
#                                                                   #
# You are free:                                                     #
#  * to Share - to copy, distribute and transmit the work           #
#  * to Remix - to adapt the work                                   #
# Under the following conditions:                                   #
#  * Attribution - You must attribute the work in the manner        #
#    specified by the author or licensor (but not in any way that   #
#    suggests that they endorse you or your use of the work).       #
# With the understanding that:                                      #
#  * Waiver - Any of the above conditions can be waived if you get  #
#    permission from the copyright holder.                          #
#  * Public Domain - Where the work or any of its elements is in    #
#    the public domain under applicable law, that status is in no   #
#    way affected by the license.                                   #
#  * Other Rights - In no way are any of the following rights       #
#    affected by the license:                                       #
#     - Your fair dealing or fair use rights, or other applicable   #
#       copyright exceptions and limitations;                       #
#     - The author's moral rights;                                  #
#     - Rights other persons may have either in the work itself or  #
#       in how the work is used, such as publicity or privacy       #
#       rights.                                                     #
#  * Notice - For any reuse or distribution, you must make clear to #
#    others the license terms of this work. The best way to do this #
#    is with a link to this web page.                               #
#                                                                   #
# See http://creativecommons.org/ for details.                      #
# ----------------------------------------------------------------- #

# 1st field: state before transition
# 2nd field: state after transition
# 3rd field: event (input message)
# 4th field: command (output message)
#
# Model
# MODEL_ADD|(model alias)|(model file name)|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(ON or OFF for cartoon)|(parent model alias)|(parent bone name)
# MODEL_CHANGE|(model alias)|(model file name)
# MODEL_DELETE|(model alias)
# MODEL_EVENT_ADD|(model alias)
# MODEL_EVENT_CHANGE|(model alias)
# MODEL_EVENT_DELETE|(model alias)
#
# Motion
# MOTION_ADD|(model alias)|(motion alias)|(motion file name)|(FULL or PART)|(ONCE or LOOP)|(ON or OFF for smooth)|(ON or OFF for repos)
# MOTION_ACCELERATE|(model alias)|(motion alias)|(speed)|(duration)|(specified time for end)
# MOTION_CHANGE|(model alias)|(motion alias)|(motion file name)
# MOTION_DELETE|(mpdel alias)|(motion alias)
# MOTION_EVENT_ADD|(model alias)|(motion alias)
# MOTION_EVENT_ACCELERATE|(model alias)|(motion alias)
# MOTION_EVENT_CHANGE|(model alias)|(motion alias)
# MOTION_EVENT_DELETE|(model alias)|(motion alias)
#
# Move and Rotate
# MOVE_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(move speed)
# MOVE_STOP|(model alias)
# MOVE_EVENT_START|(model alias)
# MOVE_EVENT_STOP|(model alias)
# TURN_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(rotation speed)
# TURN_STOP|(model alias)
# TURN_EVENT_START|(model alias)
# TURN_EVENT_STOP|(model alias)
# ROTATE_START|(model alias)|(x rotation),(y rotaion),(z rotation)|(GLOBAL or LOCAL rotation)|(rotation speed)
# ROTATE_STOP|(model alias)
# ROTATE_EVENT_START|(model alias)
# ROTATE_EVENT_STOP|(model alias)
#
# Sound
# SOUND_START|(sound alias)|(sound file name)
# SOUND_STOP|(sound alias)
# SOUND_EVENT_START|(sound alias)
# SOUND_EVENT_STOP|(sound alias)
#
# Stage
# STAGE|(stage file name)
# STAGE|(bitmap file name for floor),(bitmap file name for background)
#
# Light
# LIGHTCOLOR|(red),(green),(blue)
# LIGHTDIRECTION|(x position),(y position),(z position)
#
# Camera
# CAMERA|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(distance)|(fovy)|(time)
# CAMERA|(motion file name)
#
# Speech recognition
# RECOG_EVENT_START
# RECOG_EVENT_STOP|(word sequence)
# RECOG_MODIFY|GAIN|(ratio)
# RECOG_MODIFY|USERDICT_SET|(dictionary file name)
# RECOG_MODIFY|USERDICT_UNSET
#
# Speech synthesis
# SYNTH_START|(model alias)|(voice alias)|(synthesized text)
# SYNTH_STOP|(model alias)
# SYNTH_EVENT_START|(model alias)
# SYNTH_EVENT_STOP|(model alias)
# LIPSYNC_START|(model alias)|(phoneme and millisecond pair sequence)
# LIPSYNC_STOP|(model alias)
# LIPSYNC_EVENT_START|(model alias)
# LIPSYNC_EVENT_STOP|(model alias)
#
# Variable
# VALUE_SET|(variable alias)|(value)
# VALUE_SET|(variable alias)|(minimum value for random)|(maximum value for random)
# VALUE_UNSET|(variable alias)
# VALUE_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)
# VALUE_EVENT_SET|(variable alias)
# VALUE_EVENT_UNSET|(variable alias)
# VALUE_EVENT_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)|(TRUE or FALSE)
# TIMER_START|(count down alias)|(value)
# TIMER_STOP|(count down alias)
# TIMER_EVENT_START|(count down alias)
# TIMER_EVENT_STOP|(count down alias)
#
# Plugin
# PLUGIN_ENABLE|(plugin name)
# PLUGIN_DISABLE|(plugin name)
# PLUGIN_EVENT_ENABLE|(plugin name)
# PLUGIN_EVENT_DISABLE|(plugin name)
#
# Other events
# DRAGANDDROP|(file name)
# KEY|(key name)
#
# Other commands
# EXECUTE|(file name)
# KEY_POST|(window class name)|(key name)|(ON or OFF for shift-key)|(ON or OFF for ctrl-key)|(On or OFF for alt-key)

# 0011-0020 Initialization

0    12   <eps>                               MODEL_ADD|mei|Model\mei\mei.pmd|0.0,0.0,-14.0
12   13   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|ON|mei
13   14   <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF|OFF
14   15   <eps>                               STAGE|Stage\building2\floor.bmp,Stage\building2\hino.bmp
15   699  <eps>                               MOTION_ADD|mei|base|Motion\mei_wait\mei_wait.vmd|FULL|LOOP|ON|OFF

#0700-0750  最初の挨拶

699  700  <eps>                               SYNTH_START|mei|mei_voice_normal|はじめまして。私の名前はメイです。
700  701  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|キャンパス内と周辺の施設、学部の案内ができます。
701  710  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|キャンパス内と周辺の施設の案内をしますか。
#702  710  <eps>                               TIMER_START|timer|60
#710  699  TIMER_EVENT_STOP|timer              <eps>
710  706  RECOG_EVENT_STOP|いいえ             SYNTH_START|mei|mei_voice_normal|学部案内をしますか。
710  706  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|学部案内をしますか。
710  706  RECOG_EVENT_STOP|し,ない            SYNTH_START|mei|mei_voice_normal|学部案内をしますか。
710  704  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|かしこまりました。
710  704  RECOG_EVENT_STOP|うん               SYNTH_START|mei|mei_voice_normal|かしこまりました。
710  704  RECOG_EVENT_STOP|して               SYNTH_START|mei|mei_voice_normal|かしこまりました。
704  705  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|キャンパス内の施設、周辺の飲食店、コンビニ、スーパー、バス停などの案内ができます。
705  20   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|何を案内しますか。
706  503  RECOG_EVENT_STOP|はい               <eps>
706  503  RECOG_EVENT_STOP|うん               <eps>
706  503  RECOG_EVENT_STOP|して               <eps>
706  707  RECOG_EVENT_STOP|いいえ             <eps>
706  707  RECOG_EVENT_STOP|いえ               <eps>
702  707  RECOG_EVENT_STOP|し,ない             <eps>
707  708   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
708  709   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
709  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0021-0030 Idle behavior

2    3    <eps>                               SYNTH_START|mei|mei_voice_normal|ほかに案内しますか。
3    25  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|かしこまりました。
3    25  RECOG_EVENT_STOP|うん               SYNTH_START|mei|mei_voice_normal|かしこまりました。
3    25   RECOG_EVENT_STOP|して              SYNTH_START|mei|mei_voice_normal|かしこまりました。
3    20  RECOG_EVENT_STOP|いいえ              SYNTH_START|mei|mei_voice_normal|気をつけて行ってらっしゃい。
3    20  RECOG_EVENT_STOP|いえ                SYNTH_START|mei|mei_voice_normal|気をつけて行ってらっしゃい。
3    20  RECOG_EVENT_STOP|し,ない             SYNTH_START|mei|mei_voice_normal|気をつけて行ってらっしゃい。
20   21    <eps>                              TIMER_START|idle1|20
21   22   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
22   23   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
23   1    TIMER_EVENT_START|idle3               VALUE_SET|random|0|100
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1    699    TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

25   20   SYNTH_EVENT_STOP|mei                  SYNTH_START|mei|mei_voice_normal|キャンパス内と周辺の施設への行き方、学部のほかに、天気や、南おーさわキャンパスへのバスについても案内できます。なにを案内しますか。
1    20    RECOG_EVENT_STOP|キャンパス          SYNTH_START|mei|mei_voice_normal|どこに行きたいですか
1    20    RECOG_EVENT_STOP|施設               SYNTH_START|mei|mei_voice_normal|どこに行きたいですか

# 0031-0040 Hello

1    31   RECOG_EVENT_STOP|こんにちは         SYNTH_START|mei|mei_voice_normal|こんにちは。
1    31   RECOG_EVENT_STOP|こんばんは         SYNTH_START|mei|mei_voice_normal|こんばんは。
31   32   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32   20    SYNTH_EVENT_STOP|mei                <eps>

# 0041-0050 Self introduction

1    41   RECOG_EVENT_STOP|自己紹介           SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|あなた,誰          SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|君,誰              SYNTH_START|mei|mei_voice_normal|メイと言います。
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|よろしくお願いします。
43   20    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|ありがと           SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有難う             SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有り難う           SYNTH_START|mei|mei_voice_normal|どういたしまして。
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|いつでも、話しかけてくださいね。
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   20    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|可愛い             VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|かわいい           VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|綺麗               VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|きれい             VALUE_EVAL|random|LE|80
61   62   VALUE_EVENT_EVAL|random|LE|80|TRUE  SYNTH_START|mei|mei_voice_bashful|恥ずかしいです。
61   62   VALUE_EVENT_EVAL|random|LE|80|FALSE SYNTH_START|mei|mei_voice_bashful|ありがとう。
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   20    SYNTH_EVENT_STOP|mei                <eps>

# 0091-0100 Bye

1    91   RECOG_EVENT_STOP|バイバイ           SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さようなら         SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さよなら           SYNTH_START|mei|mei_voice_normal|さようなら。
91   92   <eps>                               MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
92   20    SYNTH_EVENT_STOP|mei                <eps>

# 0101-0110 Browsing

1    101  RECOG_EVENT_STOP|ホームページ       EXECUTE|http://www.tmu.ca.jp
1    101  RECOG_EVENT_STOP|ＭＭＤＡｇｅｎｔ   EXECUTE|http://www.mmdagent.jp/
1    101  RECOG_EVENT_STOP|首都大             EXECUTE|http://www.tmu.ac.jp/
101  102  <eps>                               SYNTH_START|mei|mei_voice_normal|ＭＭＤＡｇｅｎｔの、ホームページを表示します。
102  20    SYNTH_EVENT_STOP|mei                <eps>

# 0111-0120 Screen

1    111  RECOG_EVENT_STOP|フルスクリーン     KEY_POST|MMDAgent|F|OFF
111  112  <eps>                               SYNTH_START|mei|mei_voice_normal|スクリーンの設定を、変更しました。
112  20    SYNTH_EVENT_STOP|mei                <eps>

#キャンパス内案内
# 0121-0140 Guide 食堂

1    121  RECOG_EVENT_STOP|食堂               MODEL_DELETE|menu
121  122  <eps>                               IMAGE_ADD|syokudo|ics-project\syokudo.bmp|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
122  123  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
123  124  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
124  125  <eps>                               SYNTH_START|mei|mei_voice_normal|食堂は、正面から見ると、左奥の方向にあります。
125  126  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
126  127  <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
127  128  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
128  129  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
129  130  <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
130  131  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
131  132  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正門を入って、まっすぐ進み、大きな建物の前で、左に曲がります。
132  133  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|そのまま、まっすぐ芝生の道を進むと、左側に建物が見えます。
133  134  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|その建物の入り口を入り、そこで、食券を買います。
134  135  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|左に進むと、右側に受付があるので、食券を渡します。
135  136  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|広場があるので、自由に、ご飯を食べることができます。
136  137  SYNTH_EVENT_STOP|mei                IMAGE_DELETE|syokudo
137  139  <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
139  140  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
140  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0141-0160 Guide 購買

1    141  RECOG_EVENT_STOP|購買               MODEL_DELETE|menu
1    141  RECOG_EVENT_STOP|生協               MODEL_DELETE|menu
141  142  <eps>                               IMAGE_ADD|koubai|ics-project\syokudo.bmp|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
142  143  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
143  144  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
144  145  <eps>                               SYNTH_START|mei|mei_voice_normal|購買は、正面から見ると、左奥の方向にあります。
145  146  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
146  147  <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
147  148  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
148  149  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
149  150  <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
150  151  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
151  152  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正門を入って、まっすぐ進み、大きな建物の前で、左に曲がります。
152  153  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|そのまま、まっすぐ芝生の道を進むと、左側に建物が見えます。
153  154  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|その建物を入り、左に進むと、左側に購買の入り口があります。
154  155  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|購買の入り口の奥に、机があるので、自由にご飯を食べることができます。
155  157  SYNTH_EVENT_STOP|mei                IMAGE_DELETE|koubai
157  158  <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
158  159  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
159  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0161-0180 Guide 体育館

1    161   RECOG_EVENT_STOP|体育館            MODEL_DELETE|menu
161  162  <eps>                               IMAGE_ADD|taiikukan|ics-project\taiikukan.bmp|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
162  163  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
163  164  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
164  165  <eps>                               SYNTH_START|mei|mei_voice_normal|体育館は、正面から見ると、すぐ左前の方向にあります。
165  166  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
166  167  <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
167  168  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
168  169  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
169  170  <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
170  171  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
171  172  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正門を入って、まっすぐ進み、大きな建物の前で、左に曲がります。
172  173  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|芝生の手前で、左に曲がると、左側に体育館が見えます。
173  174   SYNTH_EVENT_STOP|mei                IMAGE_DELETE|taiikukan
174  176  <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
176  177  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
177  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0181-0200 Guide 教務課

1    181   RECOG_EVENT_STOP|教務課            MODEL_DELETE|menu
181  182  <eps>                              IMAGE_ADD|kyomuka|ics-project\kyomuka.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
182  183  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
183  184  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
184  185  <eps>                               SYNTH_START|mei|mei_voice_normal|教務課は、正面から見ると、右前の方向にあります。
185  186  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
186  187  <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
187  188  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
188  189  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
189  190  <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
190  191  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
191  192  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正門を入って、まっすぐ進みます。
192  193  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|建物を斜め左にくぐり、左に曲がります。
193  194  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|まっすぐ進むと、右側に白い建物が見えます。
194  195  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|入り口を入って、右側の窓口が、教務課です。
195  197   SYNTH_EVENT_STOP|mei                IMAGE_DELETE|kyomuka
197  198  <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
198  199  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
199  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0201-0220 Guide 1号館

1    201   RECOG_EVENT_STOP|1号館             MODEL_DELETE|menu
201  202  <eps>                               IMAGE_ADD|1goukan|ics-project\kyomuka.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
202  203  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
203  204  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
204  205  <eps>                               SYNTH_START|mei|mei_voice_normal|1号館は、正面から見ると、右前の方向にあります。
205  206  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
206  207  <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
207  208  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
208  209  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
209  210  <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
210  211  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
211  212  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正門を入って、まっすぐ進みます。
212  213  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|建物を斜め左にくぐり、左に曲がります。
213  214  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|まっすぐ進むと、右側に白い建物が見えます。
214  215  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|その建物が1号館で、ここには教授の方の部屋があります。
215  217   SYNTH_EVENT_STOP|mei                IMAGE_DELETE|1goukan
217  218  <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
218  219  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
219  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0221- 0240 library

1    221   RECOG_EVENT_STOP|図書館            MODEL_DELETE|menu
221   222   <eps>                             IMAGE_ADD|tosyokan|ics-project\tosyokan.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
222   223   <eps>                             MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
223   224   <eps>                             MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
224   225   <eps>                             SYNTH_START|mei|mei_voice_normal|図書館は、正面から見ると、右側の方向にあります。
225   226   SYNTH_EVENT_STOP|mei              MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
226   227   <eps>                             SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
227   228   <eps>                             MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
228   229   SYNTH_EVENT_STOP|mei              MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
229   230  <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
230   231  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
231   232  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正門を入って、まっすぐ進みます。
232   233  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|右側の入り口から入り、地下一階に降りると受付があります。
233   234   SYNTH_EVENT_STOP|mei              SYNTH_START|mei|mei_voice_normal|学生のかたですか？        
234   235   RECOG_EVENT_STOP|はい             SYNTH_START|mei|mei_voice_normal|ゲートに学生証をタッチすると中にはいれます
234   235   RECOG_EVENT_STOP|うん             SYNTH_START|mei|mei_voice_normal|ゲートに学生証をタッチすると中にはいれます
234   235   RECOG_EVENT_STOP|いいえ           SYNTH_START|mei|mei_voice_normal|受付の方に相談してください
234   235   RECOG_EVENT_STOP|違います         SYNTH_START|mei|mei_voice_normal|受付の方に相談してください
235   236   SYNTH_EVENT_STOP|mei                IMAGE_DELETE|tosyokan
236   237   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
237   238   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
238   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

#0301-0320 Guide 2号館

1    301   RECOG_EVENT_STOP|2号館             MODEL_DELETE|menu
301  302  <eps>                              IMAGE_ADD|2goukan|ics-project\tosyokan.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
302  303  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
303  304  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
304  305  <eps>                               SYNTH_START|mei|mei_voice_normal|2号館は、正面から見ると、右側の方向にあります。
305  306 SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
306  307  <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
307  308  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
308  309  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
309  310  <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
310  311  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
311  312  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正門を入って、まっすぐ進みます。
312  313  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正面に見える高い建物が2号館です。
313  315   SYNTH_EVENT_STOP|mei                IMAGE_DELETE|2goukan
315  316  <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
316  317  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
317  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

#0321-0340 Guide 部室

1    321   RECOG_EVENT_STOP|部室              MODEL_DELETE|menu
321  322  <eps>                              IMAGE_ADD|busitu|ics-project\syokudo.bmp|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
322  323  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
323  324  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
324  325  <eps>                               SYNTH_START|mei|mei_voice_normal|部室は、正面から見ると、左奥の方向にあります。
325  326  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
326  327  <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
327  328  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
328  329  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
329  330  <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
330  331  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
331  332  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正門を入って、まっすぐ進み、大きな建物の前で、左に曲がります。
332  333  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|そのまま、まっすぐ芝生の道を進むと、左側に建物が見えます。
333  334  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|その建物の2階に部室があります。
334  336   SYNTH_EVENT_STOP|mei                IMAGE_DELETE|busitu
336  337  <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
337  338  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
338  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

#0381-0400 Guide 実験棟

1    381   RECOG_EVENT_STOP|実験棟            MODEL_DELETE|menu
1    381   RECOG_EVENT_STOP|3号館             MODEL_DELETE|menu
1    381   RECOG_EVENT_STOP|4号館             MODEL_DELETE|menu
1    381   RECOG_EVENT_STOP|5号館             MODEL_DELETE|menu
381  382  <eps>                              IMAGE_ADD|jikken|ics-project\jikken.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
382  383  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
383  384  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
384  385  <eps>                               SYNTH_START|mei|mei_voice_normal|正面から見ると、右奧の方向にあります。
385  386  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
386  387  <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
387  388  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
388  389  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
389  390  <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
390  391  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
391  392  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|正門を入って、まっすぐ進みます。
392  393  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|建物を斜め左にくぐり、左に曲がります。
393  394  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|まっすぐ進むと、右側にガラス張りのきれいな建物が見えます。
394  396   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|jikken
396  397  <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
397  398  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
398  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF
#0401 - 0420 トイレ 
1    401   RECOG_EVENT_STOP|トイレ            MODEL_DELETE|menu
1    401   RECOG_EVENT_STOP|手洗い            MODEL_DELETE|menu
401  402   <eps>                             IMAGE_ADD|wc|ics-project\tosyokan.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
402  403   <eps>                              MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
403  404   <eps>                              MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
404  405   <eps>                              SYNTH_START|mei|mei_voice_normal|トイレは、正門から見て右前の方向に見える二号館にあります
405  406   SYNTH_EVENT_STOP|mei               MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
406  407   <eps>                              SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
407  408   <eps>                              MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
408  411   SYNTH_EVENT_STOP|mei               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
411  412   <eps>                              IMAGE_DELETE|wc
412  413   <eps>                              MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
413  414   <eps>                              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
414  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

#0421 - 0440 自販機
1    421   RECOG_EVENT_STOP|自販機             MODEL_DELETE|menu
1    421   RECOG_EVENT_STOP|自動販売機         MODEL_DELETE|menu
421   422   <eps>                              IMAGE_ADD|jihanki|ics-project\tosyokan.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
422   423   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
423   424   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
424   425   <eps>                               SYNTH_START|mei|mei_voice_normal|自動販売機は、正門から見て右前に見える建物に、道沿いの左側の入り口から入ると、正面にみえます
425   426   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
426   427   <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
427   428   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
428   429   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd430  
429   430  <eps>                                    SYNTH_START|mei|mei_voice_normal|生協のすぐそばにも自動販売機があります。生協への案内をしますか？
430   141   RECOG_EVENT_STOP|はい               IMAGE_DELETE|toshokan
430   431   RECOG_EVENT_STOP|いいえ             SYNTH_START|mei|mei_voice_normal|わかりました
431   432   SYNTH_EVENT_STOP|mei                IMAGE_DELETE|toshokan
432   433   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
433   434   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
434   435   <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF


#キャンパス外案内
#0241 -0260  飲食店

1    241   RECOG_EVENT_STOP|ごはん           MODEL_DELETE|menu
1    241   RECOG_EVENT_STOP|めし             MODEL_DELETE|menu
1    241   RECOG_EVENT_STOP|飲食店            MODEL_DELETE|menu
241   242   <eps>                                IMAGE_ADD|food|ics-project\飲食店.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
242   243   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
243   244   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
244   245   <eps>                               SYNTH_START|mei|mei_voice_normal|周辺には、マクドナルド、丸亀製麺、洋麺屋ごえもんなどがあります。
245   246   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
246   247   <eps>                               SYNTH_START|mei|mei_voice_normal|マップでは、こちらになります。
247   248   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
248   249   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd    
249   250   <eps>                               SYNTH_START|mei|mei_voice_normal|どちらにいきますか？
250   251   RECOG_EVENT_STOP|マクドナルド       SYNTH_START|mei|mei_voice_normal|現在地から正門に対して右側に進み、二つ目の交差点を左に曲がると、左手に見えます。
250   251   RECOG_EVENT_STOP|丸亀               SYNTH_START|mei|mei_voice_normal|現在地から正門に対して右側に進み、三つ目の交差点をわたり左に曲がると、右手に見えます
250   251   RECOG_EVENT_STOP|洋麺               SYNTH_START|mei|mei_voice_normal|現在地から正門に対して左側に進み、最初の交差点を渡ると正面に見えます。
250   251   RECOG_EVENT_STOP|ごえもん           SYNTH_START|mei|mei_voice_normal|現在地から正門に対して左側に進み、最初の交差点を渡ると正面に見えます。
251   252   SYNTH_EVENT_STOP|mei                IMAGE_DELETE|food  
252   253   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
253   254   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
254   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

#0261 - 0280 スーパー

1     261   RECOG_EVENT_STOP|スーパー           MODEL_DELETE|menu
261   262   <eps>                              IMAGE_ADD|super|ics-project\スーパー.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
262   263   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
263   264   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
264   265   <eps>                               SYNTH_START|mei|mei_voice_normal|スーパーは正門の真後ろ、もしくは、現在地から正門に対して右側に進み、二つ目の交差点を左に曲がったところにあります。
265   266   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
266   267   <eps>                               SYNTH_START|mei|mei_voice_normal|マップでは、こちらになります。
267   268   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
268   271   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
271   272   <eps>                               IMAGE_DELETE|super
272   273   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
273   274   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
274   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

#0281- 0300 バス停
1    281   RECOG_EVENT_STOP|バス停             MODEL_DELETE|menu
1    281   RECOG_EVENT_STOP|豊田               MODEL_DELETE|menu
281   282   <eps>                              IMAGE_ADD|bust|ics-project\バス停豊田.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
282   283   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
283   284   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
284   285   <eps>                               SYNTH_START|mei|mei_voice_normal|豊田駅行きのバスは、現在地から正門に対して左側に進み、最初の交差点を渡って少し進んだところにあるバス停からでています。
285   286   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
286   287   <eps>                               SYNTH_START|mei|mei_voice_normal|マップでは、こちらになります。
287   288   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
288   291   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
291   292   <eps>                               IMAGE_DELETE|bust
292   293    <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
293   294   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
294   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

#441-460 八王子バス

1    441   RECOG_EVENT_STOP|八王子              MODEL_DELETE|menu
441   442   <eps>                              IMAGE_ADD|bush|ics-project\バス停八王子.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
442   443   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
443   444   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
444   445   <eps>                               SYNTH_START|mei|mei_voice_normal|八王子駅行きのバスは、現在地から正門に対して右側に道を進み、最初の信号を渡った後、小学校があるかどを右に曲がり、しばらく直進すると右手に洋服の青山が見えます。すぐそばに大和田坂上というバス停があり、そこから八王子行きのバスが出ています。
445   446   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
446   447   <eps>                               SYNTH_START|mei|mei_voice_normal|マップでは、こちらになります。
447   448   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
448   450   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
450   451   <eps>                               MODEL_DELETE|bush
451   452   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
452   453   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
453   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF


# 0341-0380 Guide コンビニ

1    341  RECOG_EVENT_STOP|コンビニ           MODEL_DELETE|menu
341  342  <eps>                              IMAGE_ADD|konbini|ics-project\コンビニ.png|10.0,10.0|0.0,10.0,0.0|0.0,0.0,0.0|ON
342  343  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
343  344  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
344  345  <eps>                               SYNTH_START|mei|mei_voice_normal|この近くには、ファミリーマートとセブンイレブンがあります。
345  346  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|どちらがよろしいですか。
346  347  RECOG_EVENT_STOP|ファミリーマート   SYNTH_START|mei|mei_voice_normal|かしこまりました。
346  347  RECOG_EVENT_STOP|ファミマ           SYNTH_START|mei|mei_voice_normal|かしこまりました。
347  348  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
348  349  <eps>                               SYNTH_START|mei|mei_voice_normal|マップでは、こちらになります。
349  350  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
350  351  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
351  353  <eps>                               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
353  354  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|道路を右手に、まっすぐ進みます。
354  357  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|一つ目の交差点を渡ると、左側にあります。
346  360  RECOG_EVENT_STOP|セブンイレブン     SYNTH_START|mei|mei_voice_normal|かしこまりました。
346  360  RECOG_EVENT_STOP|セブン             SYNTH_START|mei|mei_voice_normal|かしこまりました。
346  360  RECOG_EVENT_STOP|セブイレ           SYNTH_START|mei|mei_voice_normal|かしこまりました。
360  361  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
361  362  <eps>                               SYNTH_START|mei|mei_voice_normal|マップでは、こちらになります。
362  363  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
363  365  SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
365  366  <eps>                               SYNTH_START|mei|mei_voice_normal|では、これから道順を、説明します。
366  367  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|道路を右手に、まっすぐ進みます。
367  368  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|一つ目の交差点を渡り、まっすぐ進みます。
368  357  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|次の交差点を右に渡ると、正面にあります。
357  371   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|konbini
371  372  <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
372  373  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
373  2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

#学部案内
#0500-0600 Guide 学部案内
1    500  RECOG_EVENT_STOP|学部               MODEL_DELETE|menu
1    500  RECOG_EVENT_STOP|学科               MODEL_DELETE|menu
1    500  RECOG_EVENT_STOP|コース             MODEL_DELETE|menu
500  502  <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
502  503  <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
503  504  <eps>                               SYNTH_START|mei|mei_voice_normal|日野キャンパスには、システムデザイン学部の3、4年生が所属しています。
504  505  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|システムデザイン学部には、5つのコースがあります。
505  506  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|知能機械システムコース、情報通信システムコース、航空宇宙システム工学コース、経営システムデザインコース、インダストリアルアートコースの5つです。
506  507  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|知能機械システムコースは、以前、ヒューマンメカトロニクスシステムコースでした。
507  508  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|コースについての詳しい説明をしますか。
508  509  RECOG_EVENT_STOP|いいえ             MODEL_DELETE|panel
508  509  RECOG_EVENT_STOP|しない             MODEL_DELETE|panel
508  510  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|かしこまりました。
508  510  RECOG_EVENT_STOP|うん               SYNTH_START|mei|mei_voice_normal|かしこまりました。
508  510  RECOG_EVENT_STOP|して               SYNTH_START|mei|mei_voice_normal|かしこまりました。
510  511  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|どちらのコースについて説明しますか。
511  512  RECOG_EVENT_STOP|知能               SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  512  RECOG_EVENT_STOP|機械               SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  512  RECOG_EVENT_STOP|ヒューマン         SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  512  RECOG_EVENT_STOP|メカトロ二クス     SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  513  RECOG_EVENT_STOP|情報               SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  513  RECOG_EVENT_STOP|通信               SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  513  RECOG_EVENT_STOP|情通               SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  514  RECOG_EVENT_STOP|航空               SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  514  RECOG_EVENT_STOP|宇宙               SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  515  RECOG_EVENT_STOP|経営               SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  515  RECOG_EVENT_STOP|経シス             SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  516  RECOG_EVENT_STOP|インダス           SYNTH_START|mei|mei_voice_normal|かしこまりました。
511  516  RECOG_EVENT_STOP|アート             SYNTH_START|mei|mei_voice_normal|かしこまりました。
512  520  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|知能機械システムコースは、人間社会システムとの融和、地球環境との調和を図りながら「機械系」「電気・電子情報系」両方を複合した形でとらえ、知的システム創生に関わる3つの基礎分野を学修します。
520  600  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|「制御・ロボット工学」「人間・システム工学」「材料・加工・計測工学」の3つの分野を学修し、また物を見て、触り、観察して作り上げる力と、レポートをまとめる力を身につけるために、各分野の実験も行います。
513  530  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|情報通信システムコースは、インターネットやデジタル通信、情報セキュリティ、知能情報処理から高度な情報処理まで、現代社会の基盤技術である「情報」と「通信」を融合させ、その両者を集中的に学び、研究します。
530  620  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|技術の進歩が著しいこの分野において、常に新しい技術を生み出すことのできる「底力」のある技術者を育成するために、基礎を徹底重視、幅広い学問領域をバランスよく学修します。
514  540  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|航空宇宙システムコースでは数学や物理学、化学などの専門基礎をベースに、空気力学、推進工学、材料構造力学、飛行力学、制御工学を中心とした航空宇宙工学に必須の科目を学びます。
540  541  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|また、これらに宇宙情報通信や宇宙環境利用などの応用科目を加え、幅広い分野で活躍できる人材育成のための教育プログラムを用意しています。
541  600  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|本コースの強みは、充実した実験・実習施設です。大型の低速風洞を始め、遷・超音速風洞、ジェットエンジン、小型ロケットエンジン、真空チャンバー、模擬無重力実験装置、高温疲労試験装置、騒音・振動試験用エンクロージングなどの実験・計測装置が設置され、実際の装置を使っての実践教育がエンジニアとしての能力やセンス、さらには応用力を身につけるのに役立っています
515  600  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|マネジメント工学分野、人間工学分野、社会システム工学分野の3つの分野を併せて学ぶことで、総合的かつ多角的観点から経営システムのデザインを考えることのできる能力を育成していきます。
516  550  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|本コースは学生の学びの方向を2つの専門分野に分けています。プロダクトデザインコアでは家電・トランスポーテーション・空間・家具などにいたる多様な工業製品や人間工学のデザインを学びます。
550  551  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|「メディアアートコア」では、デジタル技術をベースに映像、Web、ソフトウェア、インタラクティブアートからグラフィックデザインにいたるメディアデザインとコンテンツ作りを学びます。また、デザイン資源を生活や社会・産業などに活かすためのリサーチ・企画・プロデュース・編集能力なども学びます。
551  600  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|ワークショップなどの体験的なプログラムが充実しており、ひらめきを大切に、感じる心や豊かな感性を育む教育を実現していきます。
600  508  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|ほかのコースについての詳しい説明をしますか。
509  601   <eps>                              MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
601  602   <eps>                              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
602  2   <eps>                                MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF
620  621  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|情報通信システムコースの研究室について説明しますか。
621  600  RECOG_EVENT_STOP|いいえ             MODEL_DELETE|panel
621  600  RECOG_EVENT_STOP|しない             MODEL_DELETE|panel
621  626  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|かしこまりました。
621  626  RECOG_EVENT_STOP|うん               SYNTH_START|mei|mei_voice_normal|かしこまりました。
621  626  RECOG_EVENT_STOP|して               SYNTH_START|mei|mei_voice_normal|かしこまりました。
626  627  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|情報通信システムコースには15の研究室があります。
627  628  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|通信システム分野のあぼけん、田川研、大久保研、柴田研、情報システム分野の石川研、福本研、三浦研、片山研、小町研、岩崎研、メディア情報処理分野のきや研、高間研、山口研、西川研、藤吉研の15です。
628  629  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|どこの研究室に興味がありますか。
629  630  RECOG_EVENT_STOP|あぼ               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  631  RECOG_EVENT_STOP|石川               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  632  RECOG_EVENT_STOP|きや               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  633  RECOG_EVENT_STOP|高間               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  634  RECOG_EVENT_STOP|田川               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  635  RECOG_EVENT_STOP|福本               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  636  RECOG_EVENT_STOP|三浦               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  637  RECOG_EVENT_STOP|山口               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  638  RECOG_EVENT_STOP|大久保             SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  639  RECOG_EVENT_STOP|片山               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  640  RECOG_EVENT_STOP|小町               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  641  RECOG_EVENT_STOP|柴田               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  642  RECOG_EVENT_STOP|西川               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  643  RECOG_EVENT_STOP|岩崎               SYNTH_START|mei|mei_voice_normal|かしこまりました。
629  644  RECOG_EVENT_STOP|藤吉               SYNTH_START|mei|mei_voice_normal|かしこまりました。
630  801  SYNTH_EVENT_STOP|mei                IMAGE_ADD|abo|image\teacher\abo.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
801  802  <eps>                               SYNTH_START|mei|mei_voice_normal|あぼけんは、電波や光を使って、他の手段では測ることの出来ない遠く離れた場所の環境情報を測り、その情報を伝送するシステムの研究をしています。
802  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|abo
631  803   SYNTH_EVENT_STOP|mei               IMAGE_ADD|ishikawa|image\teacher\ishikawa.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
803  804  <eps>                               SYNTH_START|mei|mei_voice_normal|石川研は、ビッグデータを効率的に解析することで新しい価値を発見する技術を研究しています。
804  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|ishikawa
632  805   SYNTH_EVENT_STOP|mei               IMAGE_ADD|kiya|image\teacher\kiya.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
805  806  <eps>                               SYNTH_START|mei|mei_voice_normal|きやけんは、情報圧縮、映像処理、コンテンツ配信、セキュリティに関する研究をしています。
806  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|kiya
633  807   SYNTH_EVENT_STOP|mei                IMAGE_ADD|takama|image\teacher\takama.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
807  808  <eps>                               SYNTH_START|mei|mei_voice_normal|高間研は、Webに代表される情報環境・情報リソースを活用し、我々の知的活動・創造的活動を支援するための知識処理システムについての研究をしています。
808  809  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|また、セマンティックウェブ技術を応用した情報検索システムや、情報可視化技術を用いた知的インタフェース、テキストや画像情報の効率的な収集手法などについて研究をしています。
809  900  SYNTH_EVENT_STOP|mei                IMAGE_DELETE|takama
634  810   SYNTH_EVENT_STOP|mei               IMAGE_ADD|tagawa|image\teacher\tagawa.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
810  811  <eps>                               SYNTH_START|mei|mei_voice_normal|田川研は、カメラで撮影した画像から3 次元情報を抽出するコンピュータビジョンの研究、超音波断層像から2次元の動き情報を抽出する動画像解析の研究、発話時の口唇動画像から話者情報を抽出する個人識別の研究をしています。
811  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|tagawa
635  812  SYNTH_EVENT_STOP|mei               IMAGE_ADD|fukumoto|image\teacher\fukumoto.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
812  813  <eps>                               SYNTH_START|mei|mei_voice_normal|福本研は、故障しない、あるいは故障してもそれに耐えて機能するようなコンピュータシステムや、ネットワークシステムの実現手法について研究しています。
813  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|fukumoto
636  814  SYNTH_EVENT_STOP|mei                IMAGE_ADD|miura|image\teacher\miura.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
814  815  <eps>                               SYNTH_START|mei|mei_voice_normal|三浦研は、高信頼性のあるVLSIをどのように設計するか、また設計されたVLSIが正しく動作することをどのように調べるか、について研究しています。
815  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|miura
637  816  SYNTH_EVENT_STOP|mei                IMAGE_ADD|yamaguti|image\teacher\yamaguchi.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
816  817  <eps>                               SYNTH_START|mei|mei_voice_normal|山口研の研究テーマは成長するネットワーク型知能と人間中心システム、知能情報処理とネットワーク技術を活用した新たなシステムデザインです。
817  818  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|人間のジェスチャーを理解する意図の認識機構、また、人間と意図を共有しコミュニケートするオントロジー機構、さらに、コミュニケーションが空間全体 に広がる知能空間を研究しています。
818  900  SYNTH_EVENT_STOP|mei                IMAGE_DELETE|yamaguti
638  819  SYNTH_EVENT_STOP|mei                IMAGE_ADD|ookubo|image\teacher\ookubo.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
819  820  <eps>                               SYNTH_START|mei|mei_voice_normal|大久保研は、電磁波・音波などの振動・波動現象の信号解析及び数値シミュレーションに関する研究。電磁観測を用いた自然災害の予測と監視のためのシステム開発及び信号解析に関する研究。高精度な時間領域数値解析手法の開発に関する研究などをしています。
820  821  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|例えば，電磁波・音波などの振動・波動現象の信号解析及び数値シミュレーション。ディジタル信号の補間法とその応用。地球環境電磁界計測を利用した自然現象の監視・観測システムとその信号処理。生体内画像化のための信号処理などになります
821  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|ookubo
639  822  SYNTH_EVENT_STOP|mei                IMAGE_ADD|katayama|image\teacher\katayama.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
822  823  <eps>                               SYNTH_START|mei|mei_voice_normal|片山研は三次元CADアセンブリモデルの高精度検索、グラフデータの効率的検索、問い合わせ最適化などについて研究しています
823  824  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|専門分野はデータ工学で、グラフとして表現できるデータやマルチメディアデータを対象とした効率的な検索手法について研究をしています。
824  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|katayama
640  825  SYNTH_EVENT_STOP|mei               IMAGE_ADD|komachi|image\teacher\komachi.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
825  826  <eps>                               SYNTH_START|mei|mei_voice_normal|小町研は大規模テキストを用いた統計的手法によって、人間のことばを解析し、多言語コミュニケーション支援につなげる研究をしています。特に日本語と英語をターゲットに、言語学習者の作文の誤り訂正、統計的機械翻訳、意味・文脈解析、そしてウェブからの大規模な情報抽出に関する研究をしています。
826  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|komachi
641  827   SYNTH_EVENT_STOP|mei                IMAGE_ADD|shibata|image\teacher\shibata.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
827  828  <eps>                               SYNTH_START|mei|mei_voice_normal|柴田研は地球・都市環境問題に役立つリモートセンシングシステム（光計測、非接触可視化など）に関する研究をしています
828  829  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|光通信で利用されている装置を応用し、大気の風向風速を測定するシステムの開発や、大気汚染物質モニタリング用のレーザー光源・微弱光受信システムの開発、計測データの高度信号処理法に関する研究などをしています
829  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|shibata
642  830   SYNTH_EVENT_STOP|mei               IMAGE_ADD|nishikawa|image\teacher\nishikawa.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
830  831  <eps>                               SYNTH_START|mei|mei_voice_normal|西川研は無線通信、インターネットによるメディアデータの配信についての研究をしています
831  832  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|動画像に代表されるメディア情報を、インターネットを用いて効率よく配信する事を研究しています。インターネットはメールなど少量のデータの送信を想定して設計されているため、メディア情報のように大容量のデータの配信を効率よく行うためには新しい工夫が必要です。このため、メディア情報配信に特化したインターネットプロトコルの設計などを通して、効率のよい配信方法を研究しています。
832  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|nishikawa
643  832   SYNTH_EVENT_STOP|mei               IMAGE_ADD|iwasaki|image\teacher\iwasaki.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
832  833  <eps>                               SYNTH_START|mei|mei_voice_normal|岩崎研はVLSIテストに関する研究、フィンテックにおけるブロックチェーンのセキュリティの研究、機械学習を用いたネットワークビッグデータの構造解析をしています。
833  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|iwasaki
644  834  SYNTH_EVENT_STOP|mei               IMAGE_ADD|fujiyoshi|image\teacher\fujiyoshi.jpg|5.0,5.0|5.0,20.0,-10.0|0.0,0.0,0.0|ON  
834  835  <eps>                               SYNTH_START|mei|mei_voice_normal|藤吉研はネットの分野であるセキュリティや画像処理の研究、現実の世界と橋渡しをする拡張現実、動物体検出、マルチメディア本などの関する研究をしています。
835  900   SYNTH_EVENT_STOP|mei               IMAGE_DELETE|fujiyoshi
900  901  <eps>                               SYNTH_START|mei|mei_voice_normal|ほかの研究室についての詳しい説明をしますか。
901  509  RECOG_EVENT_STOP|いいえ             MODEL_DELETE|panel
901  509  RECOG_EVENT_STOP|しない             MODEL_DELETE|panel
901  628  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|かしこまりました。
901  628  RECOG_EVENT_STOP|うん               SYNTH_START|mei|mei_voice_normal|かしこまりました。
901  628  RECOG_EVENT_STOP|して               SYNTH_START|mei|mei_voice_normal|かしこまりました。

#1001-1999 API Field
#1001-1010 wether API
1    1001  RECOG_EVENT_STOP|天気              SYNTH_START|mei|mei_voice_normal|ごめんなさい。天気はわからないや。
1001 1002  SYNTH_EVENT_STOP|mei               <eps>
1    1002  RECOG_EVENT_STOP|寒い              <eps>
1    1002  RECOG_EVENT_STOP|暑い              <eps>
1    1002  RECOG_EVENT_STOP|気温              <eps>
1002 1003  <eps>                              EXECUTE|apiowmwetherstd.py
1003 1004  <eps>                              TIMER_START|api|1
1004 1005  TIMER_EVENT_STOP|api               SYNTH_START|mei|mei_voice_normal|この後の気温を確認するね。
1005 1006  SYNTH_EVENT_STOP|mei               RELOAD|SUB
1006 1007  <eps>                              VALUE_SET|wether|1
1007 2     VALUE_EVENT_SET|fin                <eps>

#1011-1020 cbus API
1    1011  RECOG_EVENT_STOP|バス              <eps>
1    1011  RECOG_EVENT_STOP|南大沢,行く       <eps>
1011 1012  <eps>                              EXECUTE|apicbus.py
1012 1013  <eps>                              TIMER_START|api|1
1013 1014  TIMER_EVENT_STOP|api               SYNTH_START|mei|mei_voice_normal|次に出発する南大沢行きのバスを確認するね。
1014 1015  SYNTH_EVENT_STOP|mei               RELOAD|SUB
1015 1016  <eps>                              VALUE_SET|cbus|1
1016 2     VALUE_EVENT_SET|fin                <eps>

#2001-2100 Dance Motion

1     2002  RECOG_EVENT_STOP|恋               SYNTH_START|mei|mei_voice_normal|恋ダンスを一緒に踊りましょう。
1     2002  RECOG_EVENT_STOP|ダンス           SYNTH_START|mei|mei_voice_normal|恋ダンスを一緒に踊りましょう。
2002  2003  <eps>                             MODEL_DELETE|menu
2003  2004  SYNTH_EVENT_STOP|mei	          MOTION_ADD|mei|dance|Motion\a.vmd|FULL|ONCE|OFF|OFF
2004  2005  MOTION_EVENT_ADD|mei|dance		  SOUND_START|koi|Music\koi.mp3
2005  2006  MOTION_EVENT_DELETE|mei|dance     SYNTH_START|mei|mei_voice_normal|私のダンスどうでしたか？
2006  2007  SYNTH_EVENT_STOP|mei              TIMER_START|dance|10
2007  2008  RECOG_EVENT_STOP|いい             SYNTH_START|mei|mei_voice_normal|ありがとうございます。
2007  2008  RECOG_EVENT_STOP|すごい           SYNTH_START|mei|mei_voice_normal|うれしいです。
2007  2008  RECOG_EVENT_STOP|よかっ           SYNTH_START|mei|mei_voice_normal|うれしいです。
2007  2     TIMER_EVENT_STOP|dance            MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
2008  2     SYNTH_EVENT_STOP|mei              MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei

#3001-4000 English meeting

1    3001  RECOG_EVENT_STOP|ハロー            <eps>
2    3001  RECOG_EVENT_STOP|ハロー            <eps>
710  3001  RECOG_EVENT_STOP|ハロー            <eps>
1    3001  RECOG_EVENT_STOP|イングリッシュ    <eps>
2    3001  RECOG_EVENT_STOP|イングリッシュ    <eps>
710  3001  RECOG_EVENT_STOP|イングリッシュ    <eps>
1    3001  RECOG_EVENT_STOP|ジャパン          <eps>
2    3001  RECOG_EVENT_STOP|ジャパン          <eps>
710  3001  RECOG_EVENT_STOP|ジャパン          <eps>
3001 3002  <eps>                              "SYNTH_START|mei|slt_voice_normal|Hello, nice to meet you."
3002 3003  SYNTH_EVENT_STOP|mei               "SYNTH_START|mei|slt_voice_normal|I'm studying English now."
3003 3004  SYNTH_EVENT_STOP|mei               "SYNTH_START|mei|slt_voice_normal|so, I can't communicate in English."
3004 1     SYNTH_EVENT_STOP|mei               "SYNTH_START|mei|slt_voice_normal|Sorry, have a nice day."




