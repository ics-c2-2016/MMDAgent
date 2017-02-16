#cbus
0 1 <eps>                               VALUE_EVAL|cbus|EQ|1
1 2 VALUE_EVENT_EVAL|cbus|EQ|1|TRUE     SYNTH_START|mei|mei_voice_normal|次のバスは、18時30分発です。
1 0 VALUE_EVENT_EVAL|cbus|EQ|1|FALSE    <eps>
2 3 SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|南大沢には19時10分に到着予定です。
3 4 SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|行ってらっしゃい。
4 5 SYNTH_EVENT_STOP|mei                VALUE_SET|cbus|0
5 0 VALUE_EVENT_SET|cbus                VALUE_SET|fin|1